

#this dataset uses the noaa ghcn-daily datset.

#first, it connects with the NOAA server to get a list of available climate stations together with their latitudes and longitudes. This is the only time a connection to the server is required.

#Secondly, the script opens a pre-processed (with PERL) dataset, which includes daily average temeratures for all months, years and stations all over the world (~3million). Thirdly, the skript calculates a regression line through autumn temperatures of each year to calculate winter onset for each station. It then produces the value "between-years standard deviation in winter onset" for each of the ~9000 stations with average temps.


###libraries
library(RCurl)
library(readr)
library(data.table)
###making a map out of locations data
url<-"ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/ghcnd-stations.txt"
#this dataset is fixed-width delimited, requiring a few additional steps
locations<-read.fwf(
  #file=url(filenames[2]),
  file=url
  ,sep="!",na.strings=c("NA","-9999"), #sep = ! because ! does not exist in dataset - > dataset is fixed-width and should have no additional seps
  widths=c(11, 9, 11, 8,2,35)
)
#plot(locations[,2]~locations[,3],xlab = "lon",ylab="lat",pch=21, cex=0.1)
#seems to work

converted<-fread("01climate_data\\02 processing\\001data_conversion\\converted7.txt", sep ="|", na.strings=c("NA","-9999"),verbose=T)
###reading in and cleaning data####
converted<-read.table("01climate_data\\02 processing\\001data_conversion\\converted.txt",sep="|",na.strings=c("NA","-9999"))
#this dataset is made with a perl script, which: uses the noaa server full dataset, reduces it to lines that contain TAVG, and copies it without flags, but with delimiter "|".

newset<-merge(converted,locations,by=1)
rm(converted)
#now newset contains daily temps of all stations + their coordinates and names

names(newset)<-c("ID","year","month",1:31,"lat","lon","alt","name","?")
#factors to numeric etc, further cleanup
newset<-droplevels(newset)
str(newset)
newset[,2]<-(as.integer(as.character(newset[,2])))
newset[,3]<-(as.integer(as.character(newset[,3])))
str(newset)
#temperatures in lines 4:34 are treated as factors due to leading whitespace
newset[4:34,]<-as.numeric(trimws(newset[,4:34],"b"))
as.numeric(trimws(newset[,4],"b"))


#plot(newset$lat~newset$lon)

nrow(newset)
#the full dataset (all stations,years and months with a TAVG read) has 3,078,174 lines


#There is little empirical data for southern hemisphere, so only data from norhtern hemisphere is retained. For the current calculations of winter onset, only autumn and winter temperatures are needed. Lastly, old data (prior to 1950) is removed

newset<-newset[newset$lat>0,]
newset<-newset[newset[,2]>1949,]
newset<-newset[newset[,3]>7,]#only autumn and winter is needed
nrow(newset)
#this makes 1,088,859 lines

###data cleanup

#in earlier trials it turned out that at least in some stations there is a full month with TAVG reads of "0" that should have been "NA". This causes the regression in the winter onset calculation to be perfectly flat, so the date of winter onset is +-Inf
#months that consist of only 0's have both mean and sd of 0 (means can become 0 by chance)
#find these and replace by NA
reps<-0
for (i in 1:nrow(newset)){
    if(
      (sd(as.numeric(newset[i,4:34]),na.rm=T)==0) 
      & 
      (mean(as.numeric(newset[i,4:34]),na.rm=T)==0)){
      newset[i,4:34]<-NA
      reps<-reps+1
    }
}
reps
# lines had to be replaced
newset<-droplevels(newset)


a<-newset[newset$ID=="USR0000ACOT",]
for (i in 1:nrow(newset)){
  if(
    (sd(as.numeric(newset[i,4:34]),na.rm=T)==0) 
    & 
    (mean(as.numeric(newset[i,4:34]),na.rm=T)==0)){
    newset[i,4:34]<-NA
    reps<-reps+1
  }
}
a[6,4:10]
sd(a[6,4:10])
#removing stations with too little data
names(table(newset[,1])[table(newset[,1])<6]) # to calculate sd in winter onset, data must be available for at least 3 years. To calculate a regression through autumn temperatures for one year, 1 month worth of data is not enough. minimum requirement is thus 2*3=6 months
#here we go:
newset<-newset[(newset[,1] %in% names(table(newset[,1])[table(newset[,1])<6]))==F,] #removes all those that have a name that occurs less than 6 times
#this makes 1,088,344 lines

for(i in 4:34){
  newset[,i]<-as.integer(as.character(newset[,i]))
}

for (i in 4:34){
newset[which(newset[,i]>600),i]<-NA   #there is still a range of positive values with temps>60?C-->NA
newset[which(newset[,i]<(-600)),i]<-NA
}

newset<-droplevels(newset)

#Still need to remove stations with data for only one year, as this would not allow calculating a standard deviation between years
temp<- aggregate(newset$year~newset$ID,FUN = unique)
length(table(temp[1,2]))#example

counter<-rep(NA,length(levels(newset$ID))) 
for(i in 1:length(levels(newset$ID))){
  counter[i]<-length(table(temp[i,2]))
}
counter#this is the no. of years for each climate station, e.g. the first station (levels(newset$ID))[1] has data from 54 years

bad<- levels(newset$ID)[counter<3]
newset[newset$ID %in% bad ==T,] #these are stations that are to be erased

newset<- newset[newset$ID %in% bad ==F,] #reduces from 1,088,344 to 1,013,142
newset<-droplevels(newset)
nrow(newset)
#end of data cleaning####





###go through each station in the dataset and calculate winter arrivals for each year

allonsets<-matrix(NA, length(levels(newset$ID)),max(newset$year)-min(newset$year)+1) #this matrix will contain winter onset of each station (row) and year (column). 
allonsets<-data.frame(allonsets)
samplesiz<-allonsets #similar matrix but stores sample sizes
allslopes<-allonsets #stores slopes of all stations and years

#idea: start at station 1, year 1. search for all rows that have are relevant for this station and year (max 6 months, because the remaining months are already deleted from dataset). Make a regression through daily temperatures for that year and see where regression line crosses e.g. 12 °C (winter onset). Loop through all years for that station. Then calculate sd of winter onset between years. Do so for all stations.

for (s in 1:length(levels(newset[,1]))){#this loop goes through each station
  station<-newset[newset$ID == levels(newset$ID)[s],] #station is now a small dataset with max 67*5 rows (67 years * 5 relevant months)
 station<-station[order(station[,2],station[,3],na.last=F),] #sorts by year and month
 station<-droplevels(station)
 
 
#for each year:
for(y in 1:length(unique(station$year))){

  year<-station[station[,2]==unique(station[,2])[y],] #reduces dataset to 1 station, 1 year (max 31*5 points)
  
  mat <- matrix(NA,5,31) #this expands the dataset to all 5*31 days and fills up with Na in case of missing months

  
  for (i in 1:nrow(year)){ #i=month
    mon<-as.numeric(year[i,3])-7
    mat[mon,1:31]<-as.numeric(year[i,4:34])
  }
  #calculating winter onset similar to halkett et al 2004 Amnat, Doi: 10.1086/383618
  mat<-as.numeric(t(mat))  #transposed so that the order is kept (otherwise it would be row-wise)
  x<-1:155 #31 days * 5 months = 155 days. this will be the x for the regression
  
  if(sum(is.na(mat)==F)>20){ #only calculate winter onset if there are at least 20 days
    coefs<-coef(lm(mat~x)) #winter onset is where abline of this model crosses 12?C
    #data is displayed with 1 decimal place, so 12? = 120
    #120=slope*x +intercept
    #x = (120-intercept)/slope
    #onset[y]<-(120-coefs[1])/coefs[2]
    allonsets[s,year[1,2]-1950+1]<-(120-coefs[1])/coefs[2] #puts winter onset in row s (1 station per row), column 2:68
    allslopes[s,year[1,2]-1950+1]<-coefs[2]
    samplesiz[s,year[1,2]-1950+1]<-length(mat[is.na(mat)==F])
  } 
}#loop through each year

allonsets[s,1]<-as.character(station[1,1])
allslopes[s,1]<-as.character(station[1,1])
samplesiz[s,1]<-as.character(station[1,1])
}#loop through each station


####end of calculation winter arrival####

#main data set is 'allonsets'. First col is the station ID, then day of winter arrival for each year (64 years)
#samplesiz is structured the same way, but includes the no. of days that are used in allonsets for winter onset calculation


#calculate number of days that is used per station (over all years)
nrow(allonsets)
samplesiz$ndays<-rowSums(samplesiz[,2:68],na.rm=T)
hist(samplesiz$ndays)
max(samplesiz$ndays)
#theoretical maximum
max(newset$year)-min(newset$year)
#67 years * 5 months * 30 or 31 days
67*(31*3+30*2)


hist(samplesiz[samplesiz[,69]>0,69],breaks=100,main="Number of days per dataset",xlab = "no. days")
median(samplesiz$ndays,na.rm=T) #calculations on each station are based on average on 3045 days (~20 winters)
min(samplesiz[samplesiz[,69]>0,69])#21; the script ignores all years with <20 days of data
samplesiz[samplesiz[,69]==21,]
#data exists for only 1 year, 21 days within that year - the year is column 11 = 1960
newset[newset[,1]=="RSM00027462",]
#only the year 1960 contains more than 20 days (21) and is therefore used for the regression


#same with number of years
samplesiz$nyears<-rowSums(is.na(samplesiz[,2:68]))
samplesiz$nyears<-67-samplesiz$nyears
table(samplesiz$nyears)
hist(samplesiz$nyears,breaks=100,main ="number of years per dataset")
median(samplesiz$nyears,na.rm=T)#standard deviation in winter onset is based on ~23 winter onsets per station


#it is still possible that stations have data for e.g. 3 days per months, for 3 months per year, and that for 10 years. They would not be removed in the intiial cleaning, because there are more than 6 months of data in total, and data for more than 1 year. But with only 3 days * 3 months = 9 days per year, winter will not be calculated for any year (calculations start with >20 days per year), and all data from this station is NA 
samplesiz2<-samplesiz[samplesiz$nyears>2,]
allonsets2<-allonsets[samplesiz$nyears>2,]

samplesiz<-samplesiz2
allonsets<-allonsets2
rm(samplesiz2)
rm(allonsets2)
allonsets$mean<-NA
allonsets$sd<-NA

for(i in 1:nrow(allonsets)){
  allonsets[i,69]<-mean(as.numeric(allonsets[i,2:68]),na.rm=T)
  allonsets[i,70]<-sd(as.numeric(allonsets[i,2:68]),na.rm=T)
}
hist(allonsets$mean)

nrow(allonsets[allonsets$mean==Inf,])
nrow(allonsets) #3% of all weather stations have some value == inf
#it seems that at least in some stations there is a full month with TAVG reads of "0" that should have been "NA". This causes the regression in the winter onset calculation to be perfectly flat, so the date of winter onset is +-Inf

badstations<-allonsets$X1[allonsets$mean==Inf]

#one could calculate mean monthly temperatures for all stations, and see which ones have a monthly mean of 0. Or calculate standard deviation, and see which ones have a sd of zero. 

for (i in 1:length(badstations)){
#  print (badstations[i])
  subset<- newset[newset$ID == badstations[i],]
  sdset<-NA
  for(j in 1:nrow(subset)){
    sdset[j]<-sd(as.numeric(subset[j,4:34]),na.rm=T)
  }
  if (!(0 %in% sdset)){print(badstations[j])}
}
#all bad stations have at least one month full of zeros.

for (i in 1:nrow(newset[newset$ID %in% badstations,]){
  
}

for (i in 1:length(badstations)){
  subset<- newset[newset$ID == badstations[i],]
  for(j in 1:nrow(subset)){
    if(
      (sd(as.numeric(subset[j,4:34]),na.rm=T)==0) 
      & 
      (mean(as.numeric(subset[j,4:34]),na.rm=T)==0)){
        newset[newset$ID == badstations[i],]
      which(subset$year==2011)
  }
  
newset[newset$ID=="USR0000ACOT",] #this is because a whole month (or year) consists of only zeros (wrongly called 0 instead of NA)

newset$sum<-rowSums(newset[,4:34],na.rm=T)
newset$sd<-NA
for(i in 1:nrow(newset)){
newset[i,41]<-sd(as.numeric(newset[i,4:34]),na.rm=T)
}

newset$ID[newset$sd==0]

#reload locations data
final<-merge(allonsets,locations,by=1)
final<-final[is.na(final[,69])==F,]

#atm the script is only correct for northern hemisphere, and makes only sense if winter is defined (at the equator the regression line becomes close to +-inf)
final_n<-final[final[,70]>20,]
plot(final_n[,70]~final_n[,71]) #the northern hemisphere

#plot winter onset for northern hemisphere
range(final_n[,68])
hist(final_n[,68])#there are a few values that are waay too small/large
final_n[final_n[,68]>1000,]
nrow(final_n)
nrow(final_n[final_n[,68]>1000,])/nrow(final_n)
nrow(final_n[final_n[,68]>500,])/nrow(final_n) #should be okay to drop the highest 0.5%
points(final_n[final_n[,68]>500,71],final_n[final_n[,68]>500,70],bg=2,pch=21,xpd=T)
#nearly all points are close to 20?N (e.g. Hawaii) so winter onset calculation does not make sense here - >remove
final_n<-final_n[final_n[,68]<500,]
range(final_n[,68])
nrow(final_n[final_n[,68]<(-500),])
points(final_n[final_n[,68]<(-500),71],final_n[final_n[,68]<(-500),70],bg=4,pch=21,xpd=T)
#only 8 points, look randomly distributed
final_n[final_n[,68]<(-500),]
final_n[final_n[,68]<(-500),1:67][4,]
#strange values caused by outlier in 1 or few years
final_n<-final_n[final_n[,68]>(-500),]
range(final_n[,68])
hist(final_n[,68],breaks=100)

plot(final_n[,70]~final_n[,71],xlab = "",ylab="",pch=21, cex=0.1,col="white",xaxt="n",yaxt="n")
points(x=final_n[,71],y=final_n[,70],col=1,pch=21,cex=0.1)#map of all available data from northern latitudes
cols<-final_n[,68]
hist(cols,breaks=100)
cols[cols<(-20)]<-(-20)
cols[cols>200]<-200
hist(cols,breaks=100)
#now the color range is truncated, all stations with winter onset <-20 and all with >200 get same color

min(cols)
cols<-cols-min(cols)
range(cols) # now all cols are shifted to positive value, so rgb function works
plot(final_n[,70]~final_n[,71],xlab = "",ylab="",pch=21, cex=0.1,col="white",xaxt="n",yaxt="n")
points(x=final_n[,71],y=final_n[,70],bg=rgb(cols,mean(cols),max(cols)-cols,maxColorValue=max(cols)),pch=22,cex=0.8,col="transparent")

rect(-180,50,-175,51,col=rgb(0,mean(cols),max(cols)-0,maxColorValue=max(cols)))
rect(-175,50,-170,51,col=rgb(50,mean(cols),max(cols)-50,maxColorValue=max(cols)))
rect(-170,50,-165,51,col=rgb(100,mean(cols),max(cols)-100,maxColorValue=max(cols)))
rect(-165,50,-160,51,col=rgb(150,mean(cols),max(cols)-150,maxColorValue=max(cols)))
rect(-160,50,-155,51,col=rgb(220,mean(cols),max(cols)-220,maxColorValue=max(cols)))
text(-180,49,"early",cex=0.7)
text(-155,49,"late",cex=0.7)
text(-167.5,46,"winter onset",cex=1)


points(x=final_n[final_n[,68]<(-20),71],y=final_n[final_n[,68]<(-20),70],bg="grey",pch=22,cex=1,col="grey")
nrow(final_n[final_n[,68]<(-20),])
points(x=final_n[final_n[,68]>200,71],y=final_n[final_n[,68]>200,70],bg="grey",pch=22,cex=1,col="black")
nrow(final_n[final_n[,68]<(-20),])

points(x=final_n[,71],y=final_n[,70],pch=21,cex=0.05,col="grey")#map of all available data from northern latitudes

#plot sd in winter onset for norhtern hemisphere
final_n<-final[final[,70]>20,]
hist(final_n[,69],breaks=100)#there are a few values that are waay too small/large
nrow(final_n[final_n[,69]>1000,])/nrow(final_n)
nrow(final_n[final_n[,69]>500,])/nrow(final_n)
nrow(final_n[final_n[,69]>100,])/nrow(final_n)
final_n<-final_n[final_n[,69]<100,]
hist(final_n[,69],breaks=100)
cols<-final_n[,69]
hist(cols,breaks=100)
cols[cols>40]<-40
hist(cols,breaks=100)
plot(final_n[,70]~final_n[,71],xlab = "",ylab="",pch=21, cex=0.1,col="white",xaxt="n",yaxt="n")
points(x=final_n[,71],y=final_n[,70],bg=rgb(cols,mean(cols),max(cols)-cols,maxColorValue=max(cols)),pch=22,cex=0.4,col="transparent")
rect(-180,50,-175,51,col=rgb(40,mean(cols),max(cols)-40,maxColorValue=max(cols)))
rect(-175,50,-170,51,col=rgb(30,mean(cols),max(cols)-30,maxColorValue=max(cols)))
rect(-170,50,-165,51,col=rgb(20,mean(cols),max(cols)-20,maxColorValue=max(cols)))
rect(-165,50,-160,51,col=rgb(10,mean(cols),max(cols)-10,maxColorValue=max(cols)))
rect(-160,50,-155,51,col=rgb(0,mean(cols),max(cols)-0,maxColorValue=max(cols)))
text(-180,49,40,cex=0.5)
text(-155,49,0,cex=0.5)
text(-167.5,46,"SD winter onset",cex=0.7)

##putting in locations data from metanalysis
data<-read.table("slopes.txt",header=T,sep="\t")
points(x=data$degE,y=data$degN,pch=21,bg=1,cex=0.5)


#selecting only stations that are close to those in metadata
data[1,]
which(abs(final_n[,70]-data[1,2])==min(abs(final_n[,70]-data[1,2])))
elements<-NA
#
for(j in 1:nrow(data)){
elements[j]<-which((abs(final_n[,70]-data[j,2])+abs(final_n[,71]-data[j,3]))==min((abs(final_n[,70]-data[j,2])+abs(final_n[,71]-data[j,3]))))
}
points(x=final_n[elements,71],y=final_n[elements,70],col=2)

#alternative map
final_n<-final_n[final_n[,69]<100,]
cols<-final_n[,69]
cols[cols>20]<-20
plot(final_n[,70]~final_n[,71],xlab = "",ylab="",pch=21, cex=0.1,col="white",xaxt="n",yaxt="n")
points(x=final_n[,71],y=final_n[,70],bg=rgb(cols,mean(cols),max(cols)-cols,maxColorValue=max(cols)),pch=22,cex=0.4,col="transparent")


#japan
Jap<-final[final[,70]>29,]
Jap<-Jap[Jap[,70]<46,]
Jap<-Jap[Jap[,71]>128,]
Jap<-Jap[Jap[,71]<146,]

plot(x=Jap[,71],y=Jap[,70])
range(Jap[,69])
Jap[Jap[,69]>25,]
#3/178 have SD > 25 = 1.6 %
Jap[Jap[,69]>25,69]<-25
hist(Jap[,69])
cols<-Jap[,69]
cols[Jap[,69]>10]<-10
plot(Jap[,70]~Jap[,71],xlab = "",ylab="",pch=21, cex=0.1,col="white",xaxt="n",yaxt="n")
points(x=Jap[,71],y=Jap[,70],bg=rgb(cols,mean(cols),max(cols)-cols,maxColorValue=max(cols)),pch=22,cex=1,col="transparent")
