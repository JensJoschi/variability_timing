List of issues
==============

-   check whether e\_rel in slopes.rmd is se or 1/se
-   proper statistics

General description
===================

Aim
---

The aim of this project is to correlate climate variability with variability in seasonal timing. Is the slope in seasonal responses a bet-hedging trait, i.e., is it adaptive to spread one's timing in more variable conditions?

### Overview

Previous scripts calculated winter variability and winter predictability based on climate station data (30k stations), and various parameters of photoperiodic response curves from published studies (350 populations, 61 studies). This script analyses these datasets.

### Specific description

The data was generated with R version 3.4.4. It requires the datasets "01climate\_data/03output/results.txt" and "02studies/02output/slopes.txt", and the locations.txt file from the NOAA server.

### Script

#### Load the datasets

``` r
url<-"ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/ghcnd-stations.txt"
#this dataset is fixed-width delimited, requiring a few additional steps
locations<-read.fwf(
  file=url
  ,sep="!",na.strings=c("NA","-999.9"), #sep = ! because ! does not exist in dataset - > dataset is fixed-width and should have no additional separators
  widths=c(11, 9, 10, 7,2,35)
)
reslist<-read.table("01climate_data/03output/results.txt",na.string = c("NA","-9999","-999.9"))
names(reslist)<-c("ID","meanwinter","sd_winter","nyears","predictability","amplitude","phase angle", "intercept","beta")
climate<-merge(locations,reslist,by=1)
rm(locations)
rm(reslist)
names(climate)<-c("ID","lat","lon","alt","no_idea","name","meanwinter","sd_winter", "nyears","unpredictability","amplitude","phase angle", "intercept","beta")

slopes<-read.table("02studies/02output/slopes.txt")
slopes<-slopes[-159,]  #the drm gives a nearly entirely flat slope, so this never reaches diapause
slopes<-slopes[-1,] # a row with NA
climate<-climate[!is.na(climate$meanwinter),] #because these cannot be used anyway
climate$alt[climate$alt == -999.9]<-NA #was somehow not converted to NA during read.table
```

#### correlation latitude - CDL

The critical day length (day length at which 50 % of all offspring switch to diapause) should correlate with latitude. Earlier studies quote rates of 1-1.5 hours per 5°N. Let's see if that holds for the data in this meta-analysis:

``` r
r2<-slopes
r2<-separate(r2,col=1, into = c("study","pop"), sep ="-",remove=FALSE)
```

    ## Warning: Expected 2 pieces. Additional pieces discarded in 2 rows [5, 93].

``` r
r2$e<-as.numeric(r2$e)
r2$degN<-as.numeric(r2$degN)
r2$e[r2$e>100]<-NA
r2$degN[r2$degN>80] <- NA
r2$study[r2$study=="6b"]<-6
r2$study<-as.integer(r2$study)
#png("cdl_vs_lat.png")
plot(r2$e~r2$degN, bg = r2$study,pch=22,main = "Correlation of critical day length and latitude", xlab ="latitude",ylab="critical day length")
M<-lm(r2$e~r2$degN, weights = as.numeric(r2$e_rel))
abline(M)
coef(M)[2]*5  #0.93 hours per 5 degree latitude
```

    ##   r2$degN 
    ## 0.8977892

``` r
text(20,24, "slope = 0.93 hours/5°N\nR²=0.58")
```

![](analysis_files/figure-markdown_github/corr_CDL-1.png)

``` r
#dev.off()
r2$e_rel<-as.numeric(r2$e_rel)
r2$e_rel[r2$e_rel>3000]<-3000
r2$e_rel2<-sqrt(r2$e_rel)/max(sqrt(r2$e_rel),na.rm=T)

#png("cdl_vs_lat_weighted.png")
plot(r2$e~r2$degN, bg = "grey",pch=21,cex=r2$e_rel2+0.5, main = "delay in photoperiodic response vs latitude", xlab = "Latitude (°N)", ylab = "Critical photoperiod")
M<-lm(r2$e~r2$degN, weights = as.numeric(r2$e_rel))
abline(M,lty=2)
coef(M)[2]*5  #0.93 hours per 5 degree latitude
```

    ##   r2$degN 
    ## 0.8789228

``` r
for( i in 2:length(unique(r2$study))){
  a<-r2[r2$study==unique(r2$study)[i],]
  a<-a[is.na(a$e)== FALSE,]
  a<-a[is.na(a$degN)==FALSE,]
  points(a$e~a$degN, pch=21, bg=i,cex=a$e_rel2+0.5)
  M<-lm(a$e~a$degN,weights=as.numeric(a$e_rel))
 lines(x= a$degN,y= predict(M),col="grey",xpd=T)
}
text(20,24, "slope = 0.93 hours/5°N\nR²=0.39")
```

![](analysis_files/figure-markdown_github/corr_CDL-2.png)

``` r
#dev.off()

#actually the relationship does not seem to be linear
boxcox(r2$e~r2$degN)
```

![](analysis_files/figure-markdown_github/corr_CDL-3.png)

``` r
M1<-lm(r2$e~r2$degN)
M2<-lm(r2$e^0.465 ~ r2$degN)
#plot(M1)
#plot(M2)
summary(M1)
```

    ## 
    ## Call:
    ## lm(formula = r2$e ~ r2$degN)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -9.7780 -0.9560  0.0789  1.0630  6.5005 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 6.723356   0.332098   20.25   <2e-16 ***
    ## r2$degN     0.169140   0.007568   22.35   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.599 on 344 degrees of freedom
    ## Multiple R-squared:  0.5922, Adjusted R-squared:  0.591 
    ## F-statistic: 499.5 on 1 and 344 DF,  p-value: < 2.2e-16

``` r
summary(M2)
```

    ## 
    ## Call:
    ## lm(formula = r2$e^0.465 ~ r2$degN)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -1.24824 -0.11150  0.01271  0.11887  0.58904 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 2.6151557  0.0375565   69.63   <2e-16 ***
    ## r2$degN     0.0181991  0.0008559   21.26   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.1808 on 344 degrees of freedom
    ## Multiple R-squared:  0.5679, Adjusted R-squared:  0.5667 
    ## F-statistic: 452.1 on 1 and 344 DF,  p-value: < 2.2e-16

``` r
#not much difference, can keep linear model
```

The estimate of 1 h per 5° N is not too bad, overall diapause becomes 50 min earlier per 5°.

#### correlation with climate data

One would expect that this curve fits well to mean winter onset given latitude, and the climate data allows testing that. Overview:

``` r
plot(climate$meanwinter~climate$lat,pch=22,cex=0.1, main ="Mean winter onset vs. latitude")
```

![](analysis_files/figure-markdown_github/clim_M-1.png)

``` r
hist(slopes$degN,breaks=100) #for comparison
```

![](analysis_files/figure-markdown_github/clim_M-2.png)

It is possible a bad idea to use any climate above 70°N. The highest latitude in the studies was 69.05 °N. The apparent cap at ~25°N is because winter is not defined for warm climates (winter never arrives). The lowest latitude in the studies is at 18.3°N. Refined overview:

``` r
climate<-climate[climate$lat<=70,]
plot(climate$meanwinter~climate$lat,pch=22,cex=0.1, main ="Mean winter onset vs. latitude")
```

![](analysis_files/figure-markdown_github/minus70-1.png)

``` r
M<-lm(climate$meanwinter~climate$lat)
```

Mean winter decreases by 2.6 days per ° latitude = 13 days per 5°, so an organism needs to react to a day length equal to 13 days earlier in the year per 5°N. The correct calculation of day length at a given latitude for a given day is difficult: <https://en.wikipedia.org/wiki/Sunrise_equation> luckily there is a package that solves that.

``` r
M<-lm(climate$meanwinter~climate$lat)
#expected_dl = daylength(latitude,day)
#with day = day from regression on M +182 days because the "year" calculated from climate data starts in july
slopes$expdl<-daylength(slopes$degN,
              182+coef(M)[1]+coef(M)[2]*slopes$degN
)
#the switch to diapause usually takes some time, e.g. sexual offspring must be produced and mature. lets try 1 - 3 weeks
slopes$expdl7<-daylength(slopes$degN, 182+coef(M)[1]+coef(M)[2]*slopes$degN-7)
slopes$expdl14<-daylength(slopes$degN,182+coef(M)[1]+coef(M)[2]*slopes$degN-14)
slopes$expdl21<-daylength(slopes$degN,182+coef(M)[1]+coef(M)[2]*slopes$degN-21)
plot(slopes$expdl~slopes$degN,main = "how the CDL should vary with latitude",xlab ="latitude",ylab ="expected CDL")
points(slopes$expdl7~slopes$degN,col=2)
points(slopes$expdl14~slopes$degN,col=3)
points(slopes$expdl21~slopes$degN,col=4)
```

![](analysis_files/figure-markdown_github/climate_CDL-1.png)

#### combining these two

integrating this into the curve of CDL vs latitude (mostly copy of above code)

``` r
r2<-slopes
r2<-separate(r2,col=1, into = c("study","pop"), sep ="-",remove=FALSE)
```

    ## Warning: Expected 2 pieces. Additional pieces discarded in 2 rows [5, 93].

``` r
r2$e<-as.numeric(r2$e)
r2$degN<-as.numeric(r2$degN)
r2$e[r2$e>100]<-NA
r2$degN[r2$degN>80] <- NA
r2$study[r2$study=="6b"]<-6
r2$study<-as.integer(r2$study)
#png("cdl_vs_lat.png")
plot(r2$e~r2$degN, bg = r2$study,pch=22,main = "Correlation of critical day length and latitude", xlab ="latitude",ylab="critical day length")
points(x=r2$degN, y = r2$expdl,cex=0.3)
#points(r2$expdl7~r2$degN,col=2,cex=0.3)
#points(r2$expdl14~r2$degN,col=3,cex=0.3)
points(r2$expdl21~r2$degN,col=4,cex=0.3)
```

![](analysis_files/figure-markdown_github/CDL_and_expected-1.png)

``` r
plot(r2$e~r2$expdl,main = "Correlation of Critical day length and expected CDL",xlab ="expected by climate data",ylab="CDL from studies")
abline(lm(r2$e~r2$expdl))
```

![](analysis_files/figure-markdown_github/CDL_and_expected-2.png)

``` r
summary(lm(r2$e~r2$expdl))
```

    ## 
    ## Call:
    ## lm(formula = r2$e ~ r2$expdl)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -7.8663 -1.2085 -0.0226  1.2982  5.1334 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  -7.4676     1.0989  -6.795 4.77e-11 ***
    ## r2$expdl      2.0982     0.1076  19.507  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.725 on 344 degrees of freedom
    ## Multiple R-squared:  0.5252, Adjusted R-squared:  0.5238 
    ## F-statistic: 380.5 on 1 and 344 DF,  p-value: < 2.2e-16

Now to the main part of this study: correlating slope of the PRC with climate data

1.  histograms of all variables

checking whether the nls regression makes sense

visualisation mean winter, sd(winter), predictability, beta

``` r
#png("mean-winter.png")
p<-climate
p<-p[!is.na(p$meanwinter),]
plot(p$lat~p$lon,bg = rgb(p$meanwinter,p$meanwinter,0,maxColorValue = max(p$meanwinter)),cex=0.3,pch=22,col=NA, main ="mean winter onset",xlab="",ylab="")
```

![](analysis_files/figure-markdown_github/visualisation-1.png)

``` r
#dev.off()

p<-climate
p<-p[!is.na(p$capped_sd),]
p$capped_sd[p$capped_sd>20]<-20
p<-p[p$nyears>8,]
#png("sd-winter.png")
plot(p$lat~p$lon,bg = rgb(p$capped_sd,p$capped_sd,0,maxColorValue = max(p$capped_sd)),cex=0.3,pch=22,col=NA, main ="sd winter onset, capped at 20",xlab="",ylab="")
```

![](analysis_files/figure-markdown_github/visualisation-2.png)

``` r
#dev.off()


p<-climate
p<-p[!is.na(p$unpredictability),]
p<-p[p$nyears>5,]
p$unpredictability[p$unpredictability>5]<-5 #0.6% of all data
#range(p$unpredictability)
#png("predictability-winter.png")
plot(p$lat~p$lon,bg = rgb(p$unpredictability,p$unpredictability,0,maxColorValue = max(p$unpredictability)),cex=0.3,pch=22,col=NA, main ="unpredictability",sub="dark low standard deviation in slopes",xlab="",ylab="")
```

![](analysis_files/figure-markdown_github/visualisation-3.png)

``` r
#dev.off()

#colour of noise
p<-climate
p<-p[p$nyears>10,]
p<-p[!is.na(p$beta),]
#p[p$beta>0.6]<-0.6
plot(p$lat~p$lon,bg=rgb(1,1-p$beta+0.0001,1-p$beta+0.0001,maxColorValue = 1.0001),cex=0.5,pch=22,col=NA)
```

![](analysis_files/figure-markdown_github/visualisation-4.png)

Does winter variability or predictability correlate with lat/alt or amplitude?

``` r
p$amplitude[p$amplitude>250]<-250
plot(p$sd_winter~p$lat,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/corr_climate-1.png)

``` r
plot(p$sd_winter~p$sq_alt,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/corr_climate-2.png)

``` r
plot(p$sd_winter~p$amplitude,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/corr_climate-3.png)

``` r
plot(p$unpredictability~p$lat,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/corr_climate-4.png)

``` r
plot(p$unpredictability~p$amplitude,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/corr_climate-5.png)

``` r
#summary(lm(p$unpredictability~p$lat+p$lon+p$sq_alt))
#summary(lm(p$unpredictability~p$lat+p$lon+p$alt))
#summary(lm(p$unpredictability~p$amplitude))

plot(p$capped_sd~p$unpredictability,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/corr_climate-6.png)

``` r
summary(lm(p$capped_sd~p$unpredictability))
```

    ## 
    ## Call:
    ## lm(formula = p$capped_sd ~ p$unpredictability)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -19.036  -3.491  -1.339   2.159  37.921 
    ## 
    ## Coefficients:
    ##                    Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)        12.00731    0.04381 274.092  < 2e-16 ***
    ## p$unpredictability  0.08800    0.01095   8.037 9.74e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 5.27 on 18058 degrees of freedom
    ## Multiple R-squared:  0.003565,   Adjusted R-squared:  0.003509 
    ## F-statistic:  64.6 on 1 and 18058 DF,  p-value: 9.742e-16

``` r
#summary(lm(p$sd_winter~p$lat+p$sq_alt)) #R²=0
```

``` r
plot(climate$beta~climate$lat,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/beta_climate-1.png)

``` r
plot(climate$beta~climate$amplitude,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/beta_climate-2.png)

``` r
plot(climate$beta~climate$lon,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/beta_climate-3.png)

``` r
plot(climate$beta~climate$meanwinter,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/beta_climate-4.png)

``` r
plot(climate$beta~climate$alt,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/beta_climate-5.png)

``` r
plot(climate$beta~climate$sd_winter,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/beta_climate-6.png)

``` r
plot(climate$beta~climate$unpredictability,pch=22,cex=0.1)
```

![](analysis_files/figure-markdown_github/beta_climate-7.png)

correlate slopes with climate data: Take the 5 closest climate stations in a 5° radius, calculate sd,predictability,color and mean of these weighted by inverse of euclidian distance.

``` r
slopes$meanwinter<-NA
slopes$sd_winter<-NA
slopes$unpredictability<-NA
slopes$nyears<-NA
slopes$beta<-NA 

for ( i in 1:nrow(slopes)){
  #reduce to +-5 °
  sub<-climate[between(climate$lat,slopes[i,10]-5,slopes[i,10]+5)& between(climate$lon,slopes[i,11]-5,slopes[i,11]+5),]
  
  sub$diffN<-sub$lat-slopes[i,10] #calculate distance in latitude
  sub$diffE<-sub$lon-slopes[i,11] #same for longitude
  sub$diff<-sqrt(sub$diffN^2+sub$diffE^2) #euclidian distance
  sub<-arrange(sub,diff)[1:5,] #sort and take 5 lowest values
  
  slopes$meanwinter[i]<-weighted.mean(sub$meanwinter,1/sub$diff)
  slopes$sd_winter[i]<-weighted.mean(sub$sd_winter,1/sub$diff)
  slopes$unpredictability[i]<-weighted.mean(sub$unpredictability,1/sub$diff)
  slopes$nyears[i]<-weighted.mean(sub$nyears,1/sub$diff)
  slopes$beta[i]<-weighted.mean(sub$beta,1/sub$diff)

}
slopes$b<-abs(slopes$b)
slopes<-slopes[!is.na(slopes$meanwinter),]
```

Now the slopes from the studies can be plotted against climate variables (+modelling)

``` r
r2<-separate(slopes,col=1, into = c("study","pop"), sep ="-",remove=FALSE)
```

    ## Warning: Expected 2 pieces. Additional pieces discarded in 2 rows [4, 90].

``` r
r2$e<-as.numeric(r2$e)
r2$degN<-as.numeric(r2$degN)
r2$study[r2$study=="6b"]<-6
r2$study<-as.integer(r2$study)

plot(r2$e~r2$meanwinter,xlab = "mean winter",ylab="CDL",bg=palette(rainbow(42)),pch=22,sub="black line: prediction with 1|study")
for (i in unique(r2$study)){  #make grey lines for each individual study(with line thickness~no of populations)
t<-r2[r2$study==i,]
M<-lm(t$e~t$meanwinter)
if (sum(is.na(coef(M)))==0){lines(x=t$meanwinter, y= predict(M),col="grey",lwd=nrow(t)/10)
  }#if clause makes sure model worked
}

mixed<-lmer(e~meanwinter + (1|study),data=r2)
```

    ## Warning: 'rBind' is deprecated.
    ##  Since R version 3.2.0, base's rbind() should work fine with S4 objects

``` r
r2$pred<-predict(mixed)
lines(x=range(r2$meanwinter),y=summary(mixed)$coefficients[1,1]+range(r2$meanwinter)*summary(mixed)$coefficients[2,1],lwd=2) #coef(mixed) gives many coefs for all random terms
```

![](analysis_files/figure-markdown_github/resultschunk-1.png)

``` r
#same code for sd_winter and predictability
plot(r2$b~r2$sd_winter,xlab = "standard deviation in winter",ylab = "slope of PRC",bg=palette(rainbow(42)),pch=22,sub="black line: prediction with 1|study")
for (i in unique(r2$study)){
t<-r2[r2$study==i,]
M<-lm(t$b~t$sd_winter)
if (sum(is.na(coef(M)))==0){lines(x=t$sd_winter, y= predict(M),col="grey",lwd=nrow(t)/10)
  }
}
mixed<-lmer(b~sd_winter + (1|study),data=r2)
r2$pred<-predict(mixed)
lines(x=range(r2$sd_winter),y=summary(mixed)$coefficients[1,1]+ range(r2$sd_winter)*summary(mixed)$coefficients[2,1],lwd=2)
```

![](analysis_files/figure-markdown_github/resultschunk-2.png)

``` r
#quite severe variance heterogeneity


plot(r2$b~r2$beta,xlab="color of noise",ylab="slope of PRC",bg=palette(rainbow(42)),pch=22)
for (i in unique(r2$study)){
t<-r2[r2$study==i,]
M<-lm(t$b~t$beta)
if (sum(is.na(coef(M)))==0){lines(x=t$beta, y= predict(M),col="grey",lwd=nrow(t)/10)
  }
}
mixed<-lmer(b~beta + (1|study),data=r2)
r2$pred<-predict(mixed)
lines(x=range(r2$beta),y=summary(mixed)$coefficients[1,1]+ range(r2$beta)*summary(mixed)$coefficients[2,1],lwd=2)
```

![](analysis_files/figure-markdown_github/resultschunk-3.png)

``` r
r2<-r2[!is.na(r2$unpredictability),]

plot(r2$b~r2$unpredictability,xlab = "winter unpredictability",ylab = "slope of PRC",bg=palette(rainbow(42)),pch=22)
for (i in unique(r2$study)){
t<-r2[r2$study==i,]
t<-t[!is.na(t$unpredictability),]
M<-lm(t$b~t$unpredictability)
if (sum(is.na(coef(M)))==0){lines(x=t$unpredictability, y= predict(M),col="grey",lwd=nrow(t)/10)
  }
}
mixed<-lmer(b~unpredictability + (1|study),data=r2)
r2$pred<-predict(mixed)
lines(x=range(r2$unpredictability),y=summary(mixed)$coefficients[1,1]+ range(r2$unpredictability)*summary(mixed)$coefficients[2,1],lwd=2)
```

![](analysis_files/figure-markdown_github/resultschunk-4.png)

``` r
#quite severe variance heterogeneity



mixed_comp<-lmer(b~sd_winter*unpredictability+(1|study),data=r2)
m2<-lmer(b~sd_winter+unpredictability+(1|study),data=r2)
m3<-lmer(b~unpredictability+(1|study),data=r2)
m4<-lmer(b~sd_winter+(1|study),data=r2)

anova(mixed_comp,m2)
```

    ## refitting model(s) with ML (instead of REML)

    ## Data: r2
    ## Models:
    ## m2: b ~ sd_winter + unpredictability + (1 | study)
    ## mixed_comp: b ~ sd_winter * unpredictability + (1 | study)
    ##            Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)
    ## m2          5 3867.0 3886.2 -1928.5   3857.0                         
    ## mixed_comp  6 3868.2 3891.2 -1928.1   3856.2 0.8084      1     0.3686

``` r
anova(m2,m3)
```

    ## refitting model(s) with ML (instead of REML)

    ## Data: r2
    ## Models:
    ## m3: b ~ unpredictability + (1 | study)
    ## m2: b ~ sd_winter + unpredictability + (1 | study)
    ##    Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)
    ## m3  4 3867.7 3883.0 -1929.9   3859.7                         
    ## m2  5 3867.0 3886.2 -1928.5   3857.0 2.6798      1     0.1016

``` r
anova(m2,m4)
```

    ## refitting model(s) with ML (instead of REML)

    ## Data: r2
    ## Models:
    ## m4: b ~ sd_winter + (1 | study)
    ## m2: b ~ sd_winter + unpredictability + (1 | study)
    ##    Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)
    ## m4  4 3866.8 3882.1 -1929.4   3858.8                         
    ## m2  5 3867.0 3886.2 -1928.5   3857.0 1.7659      1     0.1839

``` r
#should exchange that with non-p statistics
#also need to correct for variance heterogeneity
#and include weights (inverse of s.e. of b)
```

The slope estimates of the individual dose-response curve vary by study (some are ~ 500, others 10). They need to be scaled on the study-level, so that they are 0-1 in each study. Everything else is copy of chunk above

``` r
#scale slope by study
r2<-r2%>%
  group_by(study)%>%
  mutate(b=scale(b))%>%
  ungroup()

plot(r2$b~r2$sd_winter,xlab = "standard deviation in winter",ylab = "slope of PRC (scaled by study)",bg=palette(rainbow(42)),pch=22)
mixed<-lmer(b~sd_winter + (1|study),data=r2)
r2$pred<-predict(mixed)
lines(x=range(r2$sd_winter),y=summary(mixed)$coefficients[1,1]+ range(r2$sd_winter)*summary(mixed)$coefficients[2,1],lwd=2)
```

![](analysis_files/figure-markdown_github/scaled-1.png)

``` r
#quite severe variance heterogeneity

backup<-r2
r2<-r2[!is.na(r2$beta),]
plot(r2$b~r2$beta,xlab="color of noise",ylab="slope of PRC(scaled by study",bg=palette(rainbow(42)),pch=22)
```

![](analysis_files/figure-markdown_github/scaled-2.png)

``` r
mixed<-lmer(b~beta + (1|study),data=r2)
#r2$pred<-predict(mixed)
#lines(x=range(r2$beta),y=summary(mixed)$coefficients[1,1]+ range(r2$beta)*summary(mixed)$coefficients[2,1],lwd=2)

r2<-backup

plot(r2$b~r2$unpredictability,xlab = "winter unpredictability (scaled by study)",ylab = "slope of PRC(scaled by study)",bg=palette(rainbow(42)),pch=22)
mixed<-lmer(b~unpredictability + (1|study),data=r2)
r2$pred<-predict(mixed)
lines(x=range(r2$unpredictability),y=summary(mixed)$coefficients[1,1]+ range(r2$unpredictability)*summary(mixed)$coefficients[2,1],lwd=2)
```

![](analysis_files/figure-markdown_github/scaled-3.png)

``` r
mixed_comp<-lmer(b~sd_winter*unpredictability+(1|study),data=r2)
m2<-lmer(b~sd_winter+unpredictability+(1|study),data=r2)
m3<-lmer(b~unpredictability+(1|study),data=r2)
m4<-lmer(b~sd_winter+(1|study),data=r2)

anova(mixed_comp,m2)
```

    ## refitting model(s) with ML (instead of REML)

    ## Data: r2
    ## Models:
    ## m2: b ~ sd_winter + unpredictability + (1 | study)
    ## mixed_comp: b ~ sd_winter * unpredictability + (1 | study)
    ##            Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)
    ## m2          5 919.58 938.71 -454.79   909.58                         
    ## mixed_comp  6 921.24 944.20 -454.62   909.24 0.3382      1     0.5609

``` r
anova(m2,m3)
```

    ## refitting model(s) with ML (instead of REML)

    ## Data: r2
    ## Models:
    ## m3: b ~ unpredictability + (1 | study)
    ## m2: b ~ sd_winter + unpredictability + (1 | study)
    ##    Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)
    ## m3  4 919.92 935.23 -455.96   911.92                         
    ## m2  5 919.58 938.71 -454.79   909.58 2.3464      1     0.1256

``` r
anova(m2,m4)
```

    ## refitting model(s) with ML (instead of REML)

    ## Data: r2
    ## Models:
    ## m4: b ~ sd_winter + (1 | study)
    ## m2: b ~ sd_winter + unpredictability + (1 | study)
    ##    Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)
    ## m4  4 917.66 932.96 -454.83   909.66                         
    ## m2  5 919.58 938.71 -454.79   909.58 0.0798      1     0.7775

``` r
#to see whether this makes sense
r2<-r2%>%
  group_by(study)%>%
  mutate(e=scale(e))%>%
  ungroup()
plot(r2$e~r2$meanwinter,xlab = "mean winter (scales by study)",ylab="CDL(scaled by study)",bg=palette(rainbow(42)),pch=22)
mixed<-lmer(e~meanwinter + (1|study),data=r2)
```

    ## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl = control
    ## $checkConv, : unable to evaluate scaled gradient

    ## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl = control
    ## $checkConv, : Model failed to converge: degenerate Hessian with 1 negative
    ## eigenvalues

``` r
r2$pred<-predict(mixed)
lines(x=range(r2$meanwinter),y=summary(mixed)$coefficients[1,1]+range(r2$meanwinter)*summary(mixed)$coefficients[2,1],lwd=2)
```

![](analysis_files/figure-markdown_github/scaled-4.png)
