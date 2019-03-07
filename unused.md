# Content  

Analysis of biological data requires multiple choices (which models to use, what significance tests to perform, which data to include....) and this is particlarly true for meta-analyses (e.g. search terms, inclusion criteria...). In this document I attempt to summarize all alternative pathways I followed in the course of this analysis. Approaches that are still in use are not included in this document, unless indicated otherwise. More thorough descriptions of the alternative approaches can be found by following the github timeline.

## Climate data  

Three attempts to calculate winter variability were made:

* I followed the definition of (Halkett et al., 2004) and defined winter onset as the point where a regression line from august to December crosses 12째C. Winter variability was then defined as standard deviation in winter onset. I used daily mean temperatures of the GHCN-d dataset (NOAA)
* I defined winter onset as the xth day on which temperates fell below y 캜, and used the standard deviation of julian date. Again I used daily mean temperatures
* Instead of using daily mean temperatures, I used the mean of daily max and daily min temperatures, applying the same approach as before. This is the approach I stuck with

Further climate data calculations that were made but fell out of use:
* I calculated Amplitude, phase angle and annual temperature average of each station with a non-linear least-square regression
* I calculated the correlation of temperature at winter onset with temperature 1,2, or three weeks before winter onset. However, as the correlation was on average 0, this procedure was dropped.
* When calculating winter predictability as based on a linear regression over temperatures in the preceding month (see methods), I initially used pearsons R instead of the standard deviation in slopes that I use now 

Use of alternative thresholds
* I used x=5째C and y = 10 days for an initial analysis. It resulted in a mean winter onset around 30 november, much earlier than the day lengths from the empirical studies (~13 hours, mid-july). 
* I then tried to find the most suitable parameter combination, by finding out which mean timing best fits the data, and adjusting the parameters to get such a mean timing. The best fit was 94 days earlier than the 5째,10 day combination. The combination 15째,7 days yielded a winter onset that is still 1 month away from the best fit, but I left it at that gap
* Finally, I settled for 5 days below 10째C (not 10 days below 5), because this is similar to the values of halkett et al (regression over monthly means crosses 12째C) and waldock (threshold value of 11째C).  It resulted in a global median winter onset around Oct 11. Neverhteless I also prepared datasets for a sensitivity analysis


## Literature searches  

* 19.2.2018 Web of Science search by topic for: "(photoperiodic AND (geogr\* OR range)) OR (photoperiod\* AND latitud\*) OR(photoperiod\* AND longitud\*)". Later forward citation searches found quite a few further articles
*  15.6.2018 WOS search for 
"TS = (("day length" OR photoperiod\* OR diapaus\* OR hibern\* OR dorman\* ) AND (geogr\* OR "range" OR latitud\* OR longitud\* OR cline$ OR clinal)) OR TI = (("day length" OR photoperiod\* OR diapaus\* OR hibern\* OR dorman\*) AND "populations")" and subsequent filtering by keywords
* 07.09.2018: searched in new google dataset beta search "photoperiodic response insect" - 9 results, not relevant or duplicates 
* 26.11.2018 and 28.11.2018 new search as described in methods (subsequent filtering is different from earlier approaches)
All literature searches were accompanied by forward citation searches.

## Eligibility and inclusion criteria
* In the first analysis we focussed on variation in slopes. Eligibility criteria were thus first only 3 day lengths, then after analysis 4 day lengths, and then 4 day lengths with at least 2 points on the sloped part
* We also excluded entirely flat reaction norms initially, as slope estimates make no sense for canalized genotypes
* the handling of incomplete reaction norms varied, depending on analysis: either exclusion upfront, or when models did not converge

## Effect size calculation
* initially we calculated effect sizes by dose response curve analysis. We used 4-parameter drcs, but with upper, lower or both upper and lower limit fixed at population mean, and chose appropriate models by AIC differences. Depending on eligibility criteria some (or many) populations were excluded after analysis. 
* we applied various ways to standardize variance estimates: truncating very small standard errors to a minimum, using 1/s.e. instead of 1/s.e�, weighing by sample size (number of day length treatments)

 
## Statistical analysis  

* The initial hypothesis was that reaction norm slopes depend on climate variability and predictability: 

1)  slope ~ variability + 1| study (variability= day length predictability)
2)  slope ~ predictabilty + 1|study (predictability = temperature predictability)

* This was changed to slope ~ variability \* predictability + 1|order\genus\species\study 
* we added mean timing ~ latitude + 1| phylogeny
* various ways of scaling and transforming the data, addition of altitude and packages (metafor and lme4) were tested
* we also tested  upper diapause limit ~ variability, cdl ~ variability, cdl ~ predictability, and slope ~ colour of noise

all kinds of DRC analysis were problematic because the slope models may not have a single likelihood maximum (slope may be anything from steep to infinity) which is why we switched to MCMC. This allowed also variance partitioning according to the new hypothesis laid out in manuscript
* we initially included models on canalization ~ mean winter (as surrogate for amplitude in winter) but the lack of canalized reaction norms did not allow further exploration


## Searches that were conducted but not used  
* search for diapause termination:  

TS = ( (post-diapaus\* OR (diapaus\* AND ("termination" OR cessati\* OR spring))) AND (geogr\* OR "range" OR latitud\* OR longitud\* OR cline$ OR clinal OR "populations"))

TS = (( (spring and (phenolog\* OR emerg\*) ) ) AND (geogr\* OR "range" OR latitud\* OR longitud\* OR cline$ OR clinal OR "populations")) NOT #1 

TS = ( ((SPRING AND (ECLOSION OR emergence)) OR post-diapaus\* OR (diapaus\* AND ("termination" OR cessati\* OR spring)))) 
this approach might be used for another, future study


* search to find single response curves, too (random would then not be study, but species only):  
(Ts =( (photoperiodic and (response or incidence or induction)) or ((hibern\* or dormanc\* or diapaus\*)) or ("critical day length" or "critical day lengths")))

* searches on each species to find low temperature threshold that should induce autumn diapause. The general search was always:

TS = latin or common name  
 #1 and TS = (diapause or (temperature and development))
