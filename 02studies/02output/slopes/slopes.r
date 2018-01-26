setwd("D:/18modelling/slopes")

library(visreg)
#should be scaled to max(%):if a line reaches 40% at max (e.g. hou et al), this 40 % must be made 100% and 20%->50%
#for each textfile in folder do
files <- list.files(path="D:\\18modelling\\slopes", pattern="*.txt", full.names=T, recursive=FALSE)

results<-data.frame(NA,NA,NA,NA)
names(results)<-c("ID","int","sl","study")
 
for ( f in 1:length(files)){
 data<-read.table(files[f],header=T)
  
#data<-read.table("hou.txt",header=T) #paste (filename, .txt sep =="")
#str(data)
a<-aggregate(data$perc~data$ID,FUN=max)#use that!
names(a)<-c("ID","max")
data<-merge(data,a,1)
data$perc2<-data$perc/data$max *100
#data$perc<-data$perc2
#plot(data$perc~data$dl)
len<-length(levels(data$ID))
#for ( i in 1:len){
#s<-data[data$ID==levels(data$ID)[i],]
#lines(s$perc~s$dl,col=i)
#}
data$yes<-round(data$perc,0)
data$no<-100-data$yes
M<-glm(cbind(yes,no)~ID*dl,data=data,family="binomial")
#summary(M)
data$pred<-plogis(predict(M))*10

#for (i in 1:len){
#  lines(data$pred[data$ID == levels(data$ID)[i]]~data$dl[data$ID == levels(data$ID)[i]],col=i,lwd=2)
#}


#x0<-int/sl
#logfun<-function(x,k,x0){1/(1+exp(-k*(x-x0)))} 



t<-visreg(M,"dl",by="ID",breaks=len,plot=T)  #the slopes of these plots will be extracted
sl<-NA
int<-NA
q<-length(table(t$fit$dl))
#plot(plogis(t$fit$visregFit)*100~t$fit$dl,type="n",xlab = "Day length",ylab = "%",xlim=c(min(data$dl),max(data$dl)))




for( i in 1:len){
  test<- t$fit[(1:q) + q*(i-1),] #visreg made day lenght more continous by calculating values for 101 day lengths
  int[i]<-coef(lm(test$visregFit~test$dl))[1]  
  sl[i]<-coef(lm(test$visregFit~test$dl))[2]
 # lines(plogis(test$visregFit)*100~test$dl,col=1,lwd=2) # strategy of one clone
  #lines(plogis(test$visregLwr)~test$dl,col="grey") #confidence interval
  #lines(plogis(test$visregUpr)~test$dl,col="grey")
  }

int
sl
levels(data$ID) # this is the order of slopes

d<-data.frame(levels(data$ID),int,sl,files[f])
names(d)<-c("ID","int","sl","study")

results<-rbind(results,d)
}  


###alternative appraoch
#using package drc
#2-step appraoch as described in Ritz 2015 (https://doi.org/10.1371/journal.pone.0146021)
#and Ritz C, Streibig JC. From additivity to synergism-A modelling perspective. Synergy. 2014;1(1):22-29. 
#1. extract b from each site in each study
#2 correlate with environment
#desired dataset structure

#ID, Study, b, N
#FX, Smith, 0.13, 40

#with b = slope extracted with drc


setwd("D:/18modelling/slopes/")
library(drc)

#data<-read.table("Pegoraro.txt",header=T)
files <- list.files(path="D:\\18modelling\\slopes", pattern="*.txt", full.names=T, recursive=FALSE)
allresults<-data.frame(NA,NA,NA,NA,NA,NA,NA,NA)
names(allresults)<-c("ID","b","c","d","e","study","degN","degE")

#skip study f=4, will not converge
for ( f in c(1:3,5:length(files))){
  data<-read.table(files[f],header=T,sep="\t")

#data<-data[data$dl<24,]
data$affected<-round(data$N*data$perc/100,0)
data$affected[data$affected<0]<-0
data$p<-data$affected/data$N
mod1<-drm(p~dl,ID,data=data,fct=LL.4(),weights = N,type="binomial", upperl=c(NA,NA,1,NA),lowerl=c(NA,0,NA,NA))
    
#plot(mod1,col=1:6,lwd=2)
#readline("please hit return")
results<-data.frame(NA,NA,NA,NA,NA,NA,NA,NA)
names(results)<-c("ID","b","c","d","e","study","degN","degE")
for (i in 1:length(levels(data$ID))){
  results[i,1]<-mod1$parNames[[3]][i] #ID
  results[i,2]<-coef(mod1)[i] # b
  results[i,3]<-coef(mod1)[i+length(levels(data$ID))]#c
  results[i,4]<-coef(mod1)[i+2*length(levels(data$ID))]#d
  results[i,5]<-coef(mod1)[i+3*length(levels(data$ID))]#e
 results[i,6]<-files[f]#study
 results[i,7]<-data[data$ID==levels(data$ID)[i],]$degN[1]
 results[i,8]<-data[data$ID==levels(data$ID)[i],]$degE[1]
}

allresults<-rbind(allresults,results)
}

#getting the remaining study:
f<-4
data<-read.table(files[f],header=T,sep="\t")
data$affected<-round(data$N*data$perc/100,0)
data$affected[data$affected<0]<-0
data$p<-data$affected/data$N
mod1<-drm(p~dl,ID,data=data,fct=LL.2(),weights = N,type="binomial")
results<-data.frame(NA,NA,NA,NA,NA,NA,NA,NA)
names(results)<-c("ID","b","c","d","e","study","degN","degE")
for (i in 1:length(levels(data$ID))){
  results[i,1]<-mod1$parNames[[3]][i] #ID
  results[i,2]<-coef(mod1)[i] # b
  results[i,3]<-coef(mod1)[i+length(levels(data$ID))]#c
  results[i,4]<-coef(mod1)[i+2*length(levels(data$ID))]#d
  results[i,5]<-coef(mod1)[i+3*length(levels(data$ID))]#e
  results[i,6]<-files[f]#study
  results[i,7]<-data[data$ID==levels(data$ID)[i],]$degN[1]
  results[i,8]<-data[data$ID==levels(data$ID)[i],]$degE[1]
}

allresults<-rbind(allresults,results)

#total number of sites
nrow(allresults) #does not incorporate lankinen
data<-read.table("lankinen.txt",header=T,sep="\t")
res<-matrix(NA,nrow(data),8)
res<-as.data.frame(res)
res[,1]<-data[,1]
res[,2]<-data[,6]
res[,5]<-data[,4]
res[,6]<-"lankinen"
res[,7]<-data[,2]
res[,8]<-data[,3]
names(res)<-c("ID","b","c","d","e","study","degN","degE")
allresults<-rbind(allresults,res)
#183 sites in 11 studies

allresults[,2]<-abs(allresults[,2])

hist(allresults[,2],main="b",breaks=100)
hist(allresults[,3],main="c",breaks=100)
hist(allresults[,4],main="d",breaks=100)
plot(allresults[,2]~allresults[,7],xlab="latitude",ylab="slope")
str(allresults)
allresults[,7]
load("D:/18modelling/readfile/completed.r.RData")

plot(final_n[,70]~final_n[,71],xlab = "",ylab="",pch=21, cex=0.1,col="white",xaxt="n",yaxt="n")
points(x=final_n[,71],y=final_n[,70],bg=rgb(cols,mean(cols),max(cols)-cols,maxColorValue=max(cols)),pch=22,cex=0.4,col="transparent")

elements<-NA
for(j in 1:nrow(allresults)){
  elements[j]<-which((abs(final_n[,70]-allresults[j,7])+abs(final_n[,71]-allresults[j,8]))==min((abs(final_n[,70]-allresults[j,7])+abs(final_n[,71]-allresults[j,8]))))
}
plot(allresults[,2]~final_n[elements,70]) #plot b vs deg N
plot(allresults[,2]~final_n[elements,68]) #plot b vs winter onset
plot(x=allresults[,2],y=final_n[elements,69],xlab="b",ylab="sd winter onset") #plot b vs sd
#similar to plotting procedure, sd is capped at 40
final_n[final_n[,69]>40,69]<-40
plot(y=allresults[,2],x=final_n[elements,69],xlab="sd winter onset",ylab="b") #plot b vs sd
y<-allresults[,2]
x=final_n[elements,69]
logy<-log(y)
sqrty<-sqrt(y)
M<-lm(logy~x)
plot(logy~x,xlab="Environmental variability",ylab="Physiological determination [log]",pch=21,bg=as.factor(allresults[,6]),lwd=1.5)
library(nlme)
library(lme4)
allresults$logy<-logy
allresults$study<-as.factor(allresults$study)
allresults$study<-as.numeric(allresults$study)
allresults$study<-as.factor(allresults$study)
allresults$x<-final_n[elements,69]
allresults$xxx<-allresults$x
M2<-lme(logy~xxx,random= ~1|study,data=allresults)

plot(allresults$logy~allresults$x)
allresults$p<-predict(M2)
for(test in 1 : (length(levels(allresults$study)))){
  lines(x=1:40,y=coef(M2)[test,1]+1:40*coef(M2)[test,2],col="grey")
}

lines(x=1:40,y= 4.30571925+1:40*-0.01906706,col=2 )

M3<-lm(logy~x+study,data=allresults)
plot(allresults$logy~allresults$x)

plot(M)


plot(y=allresults[,2],x=final_n[elements,69],xlab="Environmental variability",ylab="Physiological determination",pch=21,bg=as.factor(allresults[,6]),lwd=1.5)
lines(x=1:40,y=exp(coef(M)[1]+coef(M)[2]*1:40))
#allresults<-allresults[-1,]
