library(drc)

####Content ####
#This r script explains the use of the drc approach used in the meta-analysis. In general, 4-parameter dose-response curves were fit independently for each study, and at first also independently for each population. If possible, the lower limit (0%) was fixed, resulting in 3-parameter DRCs. Then I tested whether the upper limit could be fixed to the mean of all populations (usually 100%) as well. This script tests that approach on arbitrary data.  
#drm does for some reason not work well in markdown script, hence the whole description is kept as .r script

###some test data####
A<-c(0,9,46,79,92,100)/2
B<-c(8,45,81,93,104,107)/2
C<-c(0,1,23,100,98,97)/2
data<-data.frame(rep(c("A","B","C"),each=6),c(A,B,C),rep(1:6,3),rep(100,18))
data$data<-round(data$data)
names(data)<-c("group","data","x","number")
data$CURVE<-as.integer(data$group)#bug in plot.drc with CI plotting
plot(data$data~data$x,col=data$CURVE,xlab = "x",ylab = "y",main = "test data")


####reduce to LL.3####
#The first step is to create a 4-parameter dose response curve, and try to eliminate the lower limit
drm_4<-drm(data/number~x,curveid=CURVE,data=data,fct=LL.4(),type="binomial",weights=number,lower=c(NA,0,NA,NA))
plot(drm_4,type="bars",log="")
mselect(drm_4,list(LL.3()),sorted="IC")#does not work due to the "lower" parameter
drm_3<-drm(data/number~x,curveid=CURVE,data=data,fct=LL.3(),type="binomial",weights=number,lower=c(NA,0,NA))
plot(drm_3,type="bars",log="")
anova(drm_4,drm_3)
AIC(drm_4)-AIC(drm_3)
#3-parameter drc is better

####rationale #####
#the upper limit seems to be the same for the 3 populations, so one could reduce it to a 2-parameter DRC. However, the upper limit is not known and definitely not 1. The solution: estimate the upper limit over all populations.

####degrees of freedom for the different approaches####
#1. standard 3-parameter drc
drm_3$df.residual
6*3 - (3*3) #18 datapoints, 3 parameters estimated for each of the 3 populations

#2. 2-parameter drc with known upper limit (which is unreasonable)
wrong<-drm(data/number~x,curveid=CURVE,data=data,fct=LL.2(upper=0.5),type="binomial",weights=number)
wrong$df.residual
6*3 - (2*3) #only 2 parameters estimated for each population

#3. 3-parameter drc with upper limit estimated over all populations
6*3 -(2*3)-1 #2 parameters estimated + one global parameter
#should be much more powerful than 3-parameter DRC and preferred unless upper limit varies wildly


#build LL.3* ####
drm_3_est<-drm(data/number~x,curveid=CURVE,data=data,fct=LL.3(),type="binomial",weights= number,pmodels = data.frame(CURVE,1,CURVE))
summary(drm_3_est)
#now there is only one d estimate left (d is upper limit). 
plot(drm_3_est,type="confidence",log="",xlim=c(0,10))
plot(drm_3,type="bars",log="",xlim=c(0,10))
plot(drm_3_est,type="bars",log="",xlim=c(0,10))#much smaller conf intervals towards upper range

#model comparison####
#comparing the standard 3-parameter model with the common-upper-limit model:
AIC(model3)-AIC(ideal_model)
anova(model3,ideal_model)
#the model with common upper limit is better.

