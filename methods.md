# Description of this file  
This file consists of a summary and a methods section that is updated from time to time, and includes the most important methods. This is followed by a detailed description of all methods and models that have been used (and is hence rather long). In the end there is a checklist that summarises the long methods part and is at the same time my to-do list. 


# Summary    

Many insects escape the adverse conditions of winter by diapause. Finding the optimal diapause timing is challenging as the optimal timing may be determined by mean winter onset, its variability, and predictability of the environment. Insects are known to use day length as main cue for mean winter onset, and plastic responses to temperature as secondary cue. It is, however, not known how insects deal with variable environments with little predictability. We hypothesized that 1) the timing of diapause closely tracks mean winter onset (which is different from a linear diapause-latitude relationship); and 2) that the variability in diapause timing increases with environmental variability, but decreases with environmental predictability. 
We tested these hypotheses with a meta-analysis. First, we calculated mean winter onset, winter variability (between-years standard deviation in winter onset) and predictability (standard deviation in slopes of a temperature-time regression) for ~29,000 climate stations in the northern hemisphere. We then searched for publications that study photoperiodic reaction norms of insects at more than two sites (30 studies, 10 orders, 174 populations). We determined the inflection point and the slopes in the reaction norms, as these determine, resepectively, the mean and the temporal spread of diapause. We then correlated the inflection point with mean winter onset, and the slope estimates with variability and predictability of the environment.  
As expected, populations from northern latitudes shift their timing towards earlier diapause, progressing with approximately 50 minutes per 5 degrees latitude.  This shift in diapause correlated well with the latitudinal cline in winter onset (and associated changes in photoperiod) from the climate data. Contrary to our hypotheses, however, the variability in diapause was neither explained by winter variability nor by winter predictability. We conclude that insect phenology can readily evolve in response to temperature across insect orders, but that it is vulnerable to changes in climatic variability. 




# Methods    

We calculated mean, variability and predictability of winter onset at approximately 29,000 weather stations across the northern hemisphere. We then extracted photoperiodic response curves from 30 published studies (174 populations) along with their sampling locations, and estimated midpoint and slopes of these curves. The midpoints of diapause timing were then correlated with winter onset, and the slope estimates were correlated with winter variability and predictability.

 
## 1. climate data  

### 1.1 overview  

We used the GHCN-Daily dataset (Menne et al., 2012), version 3.22 which includes weather station data from throughout the world (Menne et al., 2018). We used the mean of daily minimum and maximum temperatures to calculate daily average temperatures of ~5-50 years for each station. We then calculated winter onset in each year as the day on which temperatures falls below 15 °C for the 7th time (starting the "year" in midsummer), and used standard deviation among years to estimate winter variability. To calculate winter predictability, we calculated the slope of temperatures of the last 30 days before winter onset, and used the between-years standard deviation in that slope. As a second estimate of predictability we then calculated the "colour of noise" according to (Vasseur), i.e. the slope coefficient in a power spectral density plot.

### 1.2. data preparation  

We used two Perl scripts to read the GHCN daily dataset file by file and extract daily minimum and maximum temperatures from all climate stations (~12 million stations*months). The script removed all data flags, and saved the output in delimited format (using | as delimiter). All further analysis was conducted in R. We removed all incomplete cases (either minimum or maximum temperature not recorded), all stations with less than 18 months of data, and all stations from the southern hemisphere. We then calculated the average of daily maximum and daily minimum temperature to obtain an estimate of daily mean temperature. This procedure left data for 11,715,375 months in  28,963 climate stations. We removed all years in each station in which more than half of the data points was missing, and all stations that cover less than 3 years of data. 

### 1.2. winter onset and winter variability  

Starting from midsummer in each year and station, we counted the number of days when the temperature fell below a certain threshold x. Winter was assumed to arrive when x was reached for the yth time. Years in which winter did not arrive according to this definition were excluded, and stations with less than 3 occurrences of winter were removed from analysis. Based on these data we calculated mean winter onset  (Won) for each station. The parameter combination {x=5°C, y=10 days) yielded an average Won in the northern hemisphere of November 13, which is about two weeks before the meteorological winter onset (Dec 1st). A preliminary analysis showed that the empirical day lengths were much longer than the day lengths of Won at all latitudes, so the physiologically relevant temperature threshold is apparently not the same as the (arbitrarily set) meteorological winter onset. We therefore determined the day of diapause onset that explains the empirical day lengths best: First, we calculated the day lengths at day ( Won  - 1,2,…365) for each latitude for which we obtained empirical data. Secondly, we obtained 365 estimates of Kolmogorov-Smirnoff´s D for empirical vs these day lengths. The profile of D estimates showed that the optimal date of diapause onset is 94 days earlier than Won (Aug 11). Assuming a delay of one month between diapause induction and diapause expression, we therefore estimated that a physiologically relevant Won is on average around Sep 11, which we achieved by running the climate analysis with the parameter combination {x = 15 °C , y = 7 days ). Across all stations with recorded winter onsets, 80 % of the years had more than 350 days with data, and 87.5% had more than 300 days with data (check whether numbers changed). Nevertheless, we calculated a weighted mean winter onset and a frequency weighed standard deviation of winter onset to account for differences in reliability. We obtained x estimates of winter onset and y estimates of winter variability in the northern hemisphere.


### 1.3 winter predictability  

To calculate the predictability of winter based on preceding temperatures, we used the temperature recordings of the last 30 days before winter onset of each year. Years with less than 10 temperature recordings in the month preceding winter were excluded. We regressed daily mean temperature over time with a linear model, and recorded the slope estimate of each year. The standard deviation in slopes was then used as predictability estimate. In total there were x estimates of predictability based on this method.  

As another method to calculate climate predictability, we adopted the approach of Vasseur ().  Taking all temperature information from one station (daily temperatures of multiple years), we calculated the power spectral density. First, we removed the seasonal trend by substracting from each daily temperature estimate the station-wide mean temperature of that day. Missing values were replaced by linear interpolation. We then calculated the spectral density within the frequency range of 1/366 and 1/(2 months) with the function spectrum, using the method "pgram", and estimated beta as the negative of the slope of log10(spectral density)~log10(frequency). Beta was only calculated if there were at least five frequency estimates. In total there were x estimates of beta, but only y estimates were based on 25 or more years of data and subsequently used.


## 2. empirical data  
 
### 2.1 overview  
We extracted photoperiodic response curves from published studies, calculated four-parameter dose-response curves (or simplified versions of these) to obtain estimates of lower and upper diapause limit, critical day length (inflection point of logit-curve) and slope of the curves, and correlated these estimates with environmental parameters. 

### 2.2 Eligibility criteria  
We concentrated on studies that measure PRCs of invertebrates. We excluded marine and intertidal organisms, because the climate estimates apply only to terrestrial systems. Invertebrates with a larval stage in shallow water (e.g. mosquitoes) were nevertheless included. Studies with estimates for less than 3 populations (samples) were excluded, because the inclusion of “study” as random term in the analysis diminishes the return (in degrees of freedom) for smaller studies. We also excluded all studies that measured diapause at three or fewer photoperiods, and all studies with less than 2 estimates on the sloped part of the population’s PRC, because such studies would not allow for a meaningful slope estimate by dose-response curve analysis. 
To maximize sample sizes, we did not restrict our analysis to any geographic location or publication language. We restricted our search, however, to publications after 1965, because earlier publications (usually in russian language) were difficult to obtain, and those which we obtained (figures in danilevskii) reported only estimates for few populations, and with too few data points to be included in analysis.  

### 2.3. search method  
We searched the web of science database for "(photoperiodic AND (geogr\* OR range)) OR (photoperiod\* AND latitud\*) OR(photoperiod\* AND longitud\*)" on 19.2.2018. This search yielded 1627 unique  results. We added a few further articles to the study that did not match the keywords (total: 1641). We classified the studies as plant/animal, Vertebrate/invertebrate, and water/terrestrial based on journal titles (journal names including e.g. “plant”, “ento*”, “fish” or “bird”), manuscript titles, abstract or full text.  (x studies) concentrated on terrestrial invertebrates. We screened the full text of these candidate studies to determine whether PRCs were recorded, and if so, how many photoperiods and populations were measured. We selected all studies with PRC estimates of more than 2 populations and 2 photoperiods (61 studies) for a forward-citation search on April 3rd 2018. We found 762 further articles, 11 of which were included for another forward-search. A forward search on these 11 articles on April 12th (94 new citations) brought 1 new study, and following its 20 citations on April 16th yielded another article. Its 14 citations (April 16th) yielded no further article. 
In addition to this literature search, we contacted (x) authors for unpublished material (x studies), and reviewed the data in Danilevskii 1965 (y studies). 
After applying the strict criteria described in 2.1 on all potentially eligible studies, 30 studies with 174 populations remained for inclusion.


### 2.4 Raw data extraction  

For all studies that were included, we noted study species, sample sizes and coordinates (if available), and saved the PRCs as .png files. We then extracted the data from the figures using WebPlotDigitizer Version 3.12 (Rohatgi, 2017). Where neccessary, the day length was then rounded or corrected to match the description in materials and methods of the respective study. For example the points on the x-axis were in some cases not continous as the axis would suggest (e.g. the x-axis in (Paolucci et al., 2013) mixes 1 hour intervals with 2 hour intervals), or points were plotted next to each other for better visibility (Riihimaa Ari et al., 2004). Y-values that were slightly above 100% or below 0% were set to 100% and 0% respectively.


### 2.5. Effect size calculation  

To estimate the midpoints and slopes we modelled diapause with binomial dose response curves in R. This analysis provides lower and upper bounds of photoperiodic induction (we constrained these to range from 0 to 100%), the slope, and the inflection point where 50 % of the individuals are induced (critical day length), so up to four parameters per slope were estimated. We expected that all populations of one species have the same lower and upper limit, which reduces the estimation to 2 parameters per slope, plus 2 global parameters per study. We also applied the alternative models with only one or no fixed global parameters, so the following models were applied on each study (sorted by plausibility): 

1. upper and lower parameter fixed at study mean (requires 2 df plus 2 df per population)
2. upper parameter fixed (requires 1 df plus 3 per population)
3. lower parameter fixed (requires 1 df plus 3 per population)
4. both limits vary (requires 4 df per population)

Model 2 may results from conservative bet-hedging (some populations have non-zero diapause regardless of season, to hedge against early winter), while model 3 is the risk-prone opposite (some non-diapausing offspring exist even late in the season to hope for late winter, see halkett et al 2004).

All analyses were conducted on the 30 studies where the slopes could be reliably estimated, i.e. with at least 2 points on the slope part (this could include the highest point of one population if that was still below a study-wide upper limit). We fitted all models, provided there were at least 3 residual degrees of freedom left, and chose those with lowest AIC. If there were multiple models with an AIC difference less than 2, we used the most plausible model. If necessary for model convergence, we removed the box constraints (diapause ranging between 0 and 100%), provided the resulting estimates were reasonable (e.g. lower limit = -0.02%).
We recorded the standard error along with the estimates of slope, inflection point and upper and lower limits, using a robust sandwich estimation method (Zeileis, 2006). Where detailed information on number of individuals per point estimate was available (% of all cases), we used these numbers to weight the individual points of the PRC. We wish to emphasize that a lack of detailed information  should not be confused with a partially unweighted (“vote-count”) meta-analysis, because the sample size (populations per study) was always known. Rather, the lack of weighing in the PRC estimates lead to slightly higher standard errors in the estimates, i.e. the missing information occurred on a lower level (points within population) than the level of replication (population).
When the coordinates were not directly provided in the study, we used the coordinates of the quoted town or area. Town and area coordinates were made available by the WikiProject Geographical coordinates and the Geohack tool (Dispenser et al., 2018). 


## 3. Statistical analysis  
Our analysis is based on 174 populations from 30 studies, which covers 28 species from 24 genera and 10 orders. To obtain estimates of predictability/variability/mean winter for the study site locations, we averaged the estimates from the 5 closest stations within a 5° radius (weighted by 1/euclidian distance).

### 3.1. correlation of  diapause timing with latitude/winter onset  
The estimate for the inflection point of the PRCs is called the critical day length (CDL), and can be regarded as mean diapause timing. We correlated the CDL with latitude, using a random structure of “study” nested in “genus” nested in “order” (“species” explained zero variance). Because the standard errors for some CDL estimates were close to zero, the inverse of the standard errors (the typical procedure for meta-analyses) would yield nearly infinite weights for some studies. We therefore used the inverse of exponential-transformed standard errors as weight estimate. 

In addition to correlating the CDL with latitude, we calculated the day length at winter onset for each location. This day length can be considered the response which maximises arithmetic mean fitness, and we correlated this expectation with the observed CDL.


### 3.2. correlation of slope with predictability and variablity  
We expected that the slope of the PRCs flattens with increasing climate variability, but only in locations with unpredictable climate. We thus modelled the slope estimate as function of an interaction of variability and predictability, using the same random structure as for the correlation with latitude. In contrast to the CDL estimates, the standard error of the slope estimates was not close to zero, so we used the inverse of the untransformed  standard error to weigh the studies. 


### 3.3. exploratory analyses  
As alternative measure of climate predictability, we calculated the colour of environmental noise according to vasseur(). This approach does, however, calculate the predictability over the whole year, not predictability of winter alone. We used this estimate of environmental autocorrelation as alternative to model 3.2. but see this approach as exploratory. In addition, we repeated all analyses based only individually on the two most prevalent orders of our datasets (lepidoptera, diptera). 

### 3.4. report of effect sizes  
For all analyses we decided to report 1) estimates of the fixed effects along with their Wald-Type confidence intervals; 2) a generalized I² value and I² values for each nesting level of the random terms, as described on the metafor homepage (http://www.metafor-project.org/doku.php/tips:i2_multilevel_multivariate ); and 3) pseudo-R² values, defined by (Raudenbush 2009) as (sigma²random-effects model – sigma²mixed-effects model)/sigma²random-effects model. 


## 4. Further information  

The data from the empirical studies was extracted with WebPlotDigitizer version 3.12 (Rohatgi, 2017). For processing the climate variables and statistical models we used Perl version 5.22.1, and R version 3.4.4 (R Core Team, 2018). The data was manipulated with the packages textreadr, Rcurl, data.table, imputeTS (Dowle & Srinivasan, 2017; Rinker, 2017; Duncan Temple Lang and the CRAN team, 2018) and the tidyverse (Wickham, 2017)  packages readr, tidyr, dplyr, stringr and magrittr (Wickahm; Bache & Wickham, 2014; Wickham, Francois, et al., 2017; Wickham, Hester, et al., 2017; Wickham & Henry, 2018).  
The day length calculations were perfomed with the package geosphere. The dose-response curve analyses were made with the package drc (Ritz et al., 2015) , its standard errors were computed with the packages sandwich (Zeileis, 2006) and lmtest (Zeileis & Hothorn, 2002), and the mixed-effects models were made with the package metafor. We further used the packages lme4 (Bates et al., 2007), nlme, MASS and geomapdata  (Lees,s. 2012), but did not include any data derived from these functions in the final version of the manuscript.  

All analyses were first developed for the correlation of CDL with latitude, and then applied to the analysis of slope estimates. 



# details  

## climate data

 Three attempts to calculate winter variability/predictability were made (only 3rd one is interesting)

#### I followed the definition of (Halkett et al., 2004) and defined winter onset as the point where a regression line from august to December crosses 12°C. Winter variability was then defined as standard deviation in winter onset.

I used a Perl script to read the GHCN daily dataset file by file (~100,000 stations), and extracted daily average temperatures. The script removed all data flags, and saved the output in delimited format (using | as delimiter). The full dataset has 3,078,174 lines, one for each station and month with a  temperature average read. All further analysis was conducted in R. 
I concentrated only on data from the northern hemisphere, ignored stations with less than six months of data, all years prior to 1950, and all years with data for less than 20 days. To calculate winter predictability, I then calculated standard deviation between years for each station, removing those stations for which only 1 year of data exists. This variability estimate for approximately 9000 stations was on average based on 25 years per station (median: 22) and included 2880 days (1,013,142 station-months). 
With proximity to the equator the slope of the temperature regression flattens, and the calculated winter onset approaches infinity.  I therefore used only latitudes north of 20°N. Moreover, I excluded stations with winter onset later than +500 days or earlier than -500 days (0.5% of the dataset). Nevertheless, this approach biases the variability estimates towards flatter slopes with decreasing latitude, and was therefore discontinued. 

#### The second approach was to find the xth day were the temperature falls below y°C, and then use standard deviation of the julian date (weighted by sample size).
I used the same Perl script as before.

For an initial quality control I applied a non-linear least-square regression on all data of each station. I expected the temperature to follow a sine wave ( t(x) = A \* cos (x \* 2\*pi/omega + phi) + C), where omega is the period of 1 year, and fixed at 372 days (12\*31 days for coding efficiency). This curve is determined by the following parameters: 
- a constant C that defines the average temperature throughout the year. It was expected to be approximately 20°C to 30°C;
- the amplitude A, which quantifies the difference between winter and summer temperatures. A should decrease with proximity to the poles.
- the phase angle phi. Phi defines at what time of the year maximum temperatures occur. It should be close to midsummer in all stations of the northern hemisphere, and around midwinter in the southern hemisphere.  This corresponds to phase angles of 170/372 \*(2\*pi) = 2.87, and  368/372\*(2\*pi)=6.22, respectively.

I used A=400, phi = pi/2, C = 200 as starting values (temperatures are given in decimal degrees), and retried with up to two different starting value combinations upon convergence failure (A = 40, phi = pi, C = 200; A = 40, phi = 2\*pi, C = 200). For all trials I used the port algorithm as optimizer, upper bounds of A=500, phi =2*pi and C=400, and lower bounds of A= 0, phi = 0 and C= -400.

I then calculated winter arrival, concentrating only on the northern hemisphere. Starting from midsummer, I counted the number of days where the temperature fell below a certain threshold x. Winter was assumed to arrive when x was reached for the yth time. I used four such parameter combinations (x=10,y=50; x=5,y=20; x=20,y=100; x= 5,y =0; all in decimal degrees) in different runs. 
I excluded years with less than 100 days of data, and stations with less than 3 winter onsets. Across all stations with recorded winter onsets, 80 % of the years had more than 350 days with data, and 87.5% had more than 300 days with data. Nevertheless, I calculated a weighted mean winter onset and a frequency weighed standard deviation of winter onset to account for differences in reliability. 
Because most climate stations have temperature data for only approx. 10 years, this approach was also discontinued.



#### The third approach uses the same idea as the second (x days below y degrees), but applies it to daily minimum/maximum temperatures, which were about 10 times more frequently recorded.     

Two new Perl scripts extracted daily minimum and maximum temperatures from all climate stations, and the daily mean was calculated in R from those values for all days and stations. This approach yielded a considerably bigger dataset (~12 million stations*months).    
As before, I calculated Amplitude, phase angle and annual average with a non-linear least-square regression, weighted mean winter and weighted standard deviation in winter onset. In addition, I calculated the correlation of temperature at winter onset with temperature 1,2, or three weeks before winter onset. However, as the correlation was on average 0, this procedure was dropped.     
I then calculated winter predictability: In a first attempt the last 31 days before winter onset of each year were aggregated and pearsons R was calculated. The climate at one station was considered predictable (high R) if 1) temperature declined more or less linearly, 2) the slope was consistent across years, and 3) there was little day-to-day variation.  I used only years with at least 182 days of data, and concentrated only on years that actually reach winter as defined above. I excluded all stations that reach winter less than 3 times. This approach was replaced before doing the real analyses by using the standard deviation in slopes of the same regressions, as this seems statistically more sound. During analysis (after seeing that there seems to be no effect, but before including right random terms), I decided to supplement this by a calculation of environmental noise like Vasseur & Yodzis 2004 (Ecology). This approach takes the autocorrelation of temperature over the whole year, which is not the same as predictability of winter onset. But restricting the window in which to look to 1 month would not work, because then there is to little data to do the autocorrelation.  

As thresholds I used x=5°C and y = 10 days for an initial analysis.



## empirical data

I searched the web of science database for "(photoperiodic AND (geogr\* OR range)) OR (photoperiod\* AND latitud\*) OR(photoperiod\* AND longitud\*)" on 19.2.2018. This search yielded 1627 unique  results. The results were merged in an excel-file. I added articles to the study that I knew or which were cited in these articles but that did not match the keywords (total: 1641). 
I classified the studies as plant/animal, Vertebrate/invertebrate, and water/terrestrial by filtering for different keywords (e.g. plant,flower, ento*, fish, bird) in journal titles. Articles that appeared in more general journals were classified manually (according to title, abstract or full text).

Concentrating on terrestrial invertebrates, I selected only studies that measured photoperiodic response curves of more than two populations, and over at least 3 photoperiods.  61 studies with 364-450 populations fulfilled these criteria (5 studies with a total of 90 populations did not show any PRCs but I may be able to retrieve them if I write to the authors). I did a forward citeation search on april 3rd 2018 on all 61 eligible studies, and found 762 further articles that cite these studies, 11 of which were suitable for inclusion. A forward search on these 11 articles on April 12th (94 new refs) brought 1 new study, and following its 20 citations on April 16th yielded another article. Its 14 citations (april 16th) yielded no further article. 
I removed again all studies with exactly 3 photoperiods measured, because they are not useful for DRC  analysis, but nevertheless good for the literature search.  
For all studies that were included, I noted study species, sample sizes, coordinates and altitude (if available), and saved the PRCs as .png files. I then extracted the data from the figures using WebPlotDigitizer Version 3.12 (Rohatgi, 2017). When raw data was avaiulable (x % of all cases) I used this data to test the error rate of manual extraction (todo, but small according to initial tests). Where neccessary,  the day length was then rounded or corrected to match the description in materials and methods of the respective study. For example the points on the x-axis were in some cases not continous as the axis would suggest (e.g. x-axis in (Paolucci et al., 2013) mixes 1h intervals with 2h intervals), or points were plotted next to each other for better visibility  (Riihimaa Ari et al., 2004). Y-values that were slightly above 100% or below 0% were set to 100% and 0% respectively. in one figure of (Urbanski et al., 2012), 1 data point that appeared in the figure but did not exist in the available raw data was deleted.

To estimate the slopes I modelled diapause with four-parameter binomial dose response curves in R. This analysis provides lower and upper bounds of photoperiodic induction (I constrained these to range from 0 to 100%), the slope, and the inflection point where 50 % of the individuals are induced (critical day length), so four parameters per slope were estimated. Where detailed information on sample sizes was available (% of all cases), I weighted diapause estimates by number of trials. I also recorded the standard error, using a robust sandwich estimation method (Zeileis, 2006).
To get the coordinates of the study populations, I used 1) the coordinates that were quoted in the studies, or, if not available coordinates of the quoted town or area. Town and area coordinates were made available by the WikiProject Geographical coordinates and the Geohack tool (Dispenser et al., 2018) 

There were 2 problems with the first attempt to calculate dose-response-curves. First, studies with only 1 point estimate on the slope part should not be included, because the slope estimate becomes unreliable. Secondly, the estimation method with 4 parameters per curve costs many degrees of freedom. Intuitively one would expect, however, that all populations of one species have the same lower and upper limit, wich would reduce the estimation to 2 parameters per slope, plus 2 global parameters. I therefore tried the following models on each study (sorted by plausibility): 

1. upper and lower parameter fixed at study mean (requires 2 df plus 2 df per population)
2. upper parameter fixed (requires 1 df plus 3 per population)
3. lower parameter fixed (requires 1 df plus 3 per population)
4. both limits vary (requires 4 df per population)

Model 2 may results from conservative bet-hedging (some populations have non-zero diapause regardless of season, to hedge against early winter), while model 3 is the risk-prone opposite (some non-diapausing offspring exist even late in the season to hope for late winter, see halkett et al 2004).

All analyses were done on 30 studies where the slopes can be reliably estimated, i.e. with at least 2 points on the slope part (this could include the highest point of one population if that was still below a study-wide upper limit). I fitted all models, provided there were at least 3 residual df left, and chose those with lowest AIC. If there were multiple models with delta AIC <2, I used the most plausible model. If necessary for model convergence, I removed the box constraints (diapause ranging between 0and 100%), provided the resulting estimates were reasonable (e.g. lower limit = -0.02%, or s.e. of estimte going slightly over the limit). Model 3 was (surprisingly) most often the best suited model. 
>
## Statistical analysis

The statistical model became quite complicated, and I needed to test a couple of things before settling on the final model. Originally I planned the following models:

1)  slope ~ variability + 1| study
2)  slope ~ predictabilty + 1|study

but thinking more about the issue I decided to switch to a single model with a variability*predictability interaction term. Also the random structure simplifies too much, because it turned out there is quite some phylogenetic signal in it that needs accounting for. As side question I decided for a third model:

3) mean timing ~ latitude + 1|study

In the beginning I tried various ways of scaling, different random structure and weighing the studies, to see which approaches work and which do not. But as I realized that this approach leaves way too many researchers degrees of freedom, I stopped the work on the slope~variability \* predictability model. Instead I focussed on the side-question how mean diapause timing correlates with latitude. The relationship is well-known and highly significant no matter which model is applied, so there is no potential bias towards models with a significant effect. After settling for the right model and summary statistics,I will applied the same model to the variability\*predictability data. 


#### climate: old approach based on predictability (R²): (discontinued) 

I correlated winter predictability (R²) with latitude, longitude and square-root-transformed altitude in a linear model. The model estimates were then used to interpolate to the sampling sites of the empirical studies. To do so, I used 1) the coordinates that were quoted in the studies, or, if not available coordinates of the quoted town or area 2) the altitudes that were quoted in the studies, or if not available, the altitude of the available coordinates. Town and area coordinates were made available by the WikiProject Geographical coordinates and the Geohack tool (Dispenser et al., 2018), and the altitude was derived from a topographic map of the world with a resolution of 5 minutes in latitude and longitude (NOAA, 1988).  
I used a mixed-effects model to correlate the estimated predictability at  the sampling locations with the slopes of the empirical PRCs. The influence of each of the 350 populations [this number is before seeing that populations with only 3 measurements need to be excluded] was weighted by the inverse of the standard error of the slope estimate; study identity was used as random term. An alternative appraoch would be to use study species as random term, and ignoring study id (doing both could be complicated). This approach would allow including studies with only 1 population. <<-better still: species nested in study.
The effect size reported shuold be slope (measured in h/°N) +CI and Fisher's Z transform of pearson's r. The approach was abandonded before settling on random structures and modelling.
>
#### physiology: correlation diapause with latitude  (preliminary)
I correlated the critical day length (day length at which 50 % of all offspring switch to diapause; parameter e in dose-response curves) with latitude of origin. I used various preliminary models with known deficiencies (lm ignoring all random terms, lme ignoring nestedness or weighting) to see what works.
  Although the relationship appears exponential, box-cox transformation (sqrt) did not improve model fit or residual structure (box-cox gives wide range of transformations, 95% ~0.2-0.8)  

#### climate: newer approach with slopes estimate (preliminary) 
I calculated correlations of variability and predictablity with latitude, altitude and with amplitude from the nls regression. I found no general pattern, though both variability and unpredictability appear to be higher in continental climates (as expected from low amplitude). Variability and unpredictability do not correlate strongly.

To get estimates of predictability/variability/mean winter at the study site, I averaged the estimates from the 5 closest stations within a 5° radius (weighted by 1/euclidian distance).

I then calculated the photoperiod during winter onset at each study site (using latitude and mean winter onset of the site). I correlated this expected photoperiod with the observed CDL  from the studies. 

I then made the following models (and plots):

* for an overview:   
* lm(CDL~meanwinter), meanwinter is from climate estimates, CDL from dose-response curves  
* lm (slope ~ sd_winter)  
* lm (slope ~ unpredictability)  
* intermediate result for discussion:   
* lmer(CDL~meanwinter + (1|study))  
* lmer(slope ~ sd_winter + (1|study))  
* lmer(slope ~ unpredictablitiy + (1|study))  
* lmer(slope ~ color + (1|study))

* lmer(slope ~ unpredictability\*sd_winter + 1|study) and model reduction  
* same models but slope and CDL scaled by study  
[The preferred output is sqrt(adjusted R²) and slope +CI, though the random effects may require different approach.]

#### proper modelling of correlation diapause ~ latitude

I tried several intermediate models of form 
* cdl ~ 1+ (1|species/study)
* cdl ~ latitude + (1|order/genus/species/study)
* cdl ~ latitude + (1|order/genus/study)
* cdl ~ latitude + (1|order/genus/species)
(list likely not complete) with different ways of weighing. I used the packages lme and lmer.

In the end I settled for the following model:

cdl~latitude + (1|order/genus/study) , weights = exp(1/s.e) (of cdl estimate)

The correct model should actually be order/genus/species/study, and initially I wanted to keep species in although it explains 0 variance, because random effects with nearly 0 explained variance have no effect anyway. But in the end I left them out as profile likelihood plots showed unambigously that they should be erased. 
I added the model 
cdl ~ expected_daylength + (1|order/genus/study) , weights = exp(1/s.e) with 
expected_daylength = daylength(latitude, winter_onset -30 days) using the function from geosphere.

I also decided at that point which significance tests should be reported.
p-values become difficult to calculate in this analysis, because it is nested, unbalanced and weighted, so conditional F-tests are no option(GLMM-Faq by ben bolker explains that well). likelihood-ratio test should work, though it might be inaccurate for small sample sizes. Using a bootstrap version that builds its own Chisquare-like distribution works only for lmer. But p should not be used anyway for that kind of analysis, so I decided not to report it. 
Instead I decided to report:

1) the estimate of the coefficient with confidence interval, 
2) R² (conditional and marginal, library Mumin) and 
3) a plot of prediction + confidence intervals (which ignores random terms). 

I first tried with lme and lmer, but as the weighting proved problematic (lme and lmer do not do the correct weighting), I switched to the metafor package. This changed the reporting options, so I made a new list:  
0) a forest plot of the dose-response curve estimates (slope and mean timing)   
1) the estimate of the latitude coefficient with confidence interval (Wald-Type, because profile loglik and bootstrap are not available in metafor)  
2) I² + confidence interval   
3) pseudo-R²  
4) and a plot of prediction + confidence intervals + credible intervals.

In addition I did the same model with lme() to see if the results are similar.

Generally all outcome statistics are inaccurate, because they expect that variance of each point is known, but I only provide a coarse estimate of vairance that is based on a very low within-population sample size (~4-10 points to get a slope estimate). that needs to be discussed.

After fitting the models for the CDL~latitude data, I saw that the CDL from lab studies were consistently earlier(several months) than the day length that corresponds to winter onset. I therefore used the latitude of each study to calculate the day length on diapause onset, which I defined as {winter onset  - i=1,2...365 days}. I correlated observed CDLs with these 365 possible diapause onsets, using the model CDL~daylength - intercept, with daylength = f(latitude, diapause onset(i)). The model(i) with the lowest Komogorov-smirnov D was at meanwinter - 94 days. I ran the climate analysis again with different parameter combinations to search for a combination that is 94 days earlier. The combination x = 15, y = 7 yielded a winter onset that is still 1 month away from the best fit for physiological data, but I left it at that gap, because I think that otherwise the calculation of winter onset becomes unstable (inflates variability?). 1 month is fine anyway, because that represents a realistic gap between diapause induction and diapause expression. I used that cliamte data for the final analysis.

#### slope vs climate data  
I used the model 
cdl \~ variability*predictability + (1|order/genus/study), but with
weights = 1/s.e (of slope estimate), because s.e. were not close to 0. For predictability, I used the sd(slopes) estimate, not the colour of noise approach. For plotting I used 2 individual models, cdl \~ variability and cdl \~ predictability with same random terms and weighting. 

#### exploratory analyses  
I plotted upper limit ~ variability (for a subset with meaningful estimates), cdl ~ variability, cdl ~ predictability, and slope ~ colour of noise, but did not do formal models. there was no meaningful effect. 


# To-do list  

[ ] find numbers that are missing in methods section
[ ] get beck insect photoperiodism to check table 28  
[ ] extract rawdata (danilevski)  
[ ] ask authors for missing data (N,coordinates, PRCs)  
[.] get slope estimates from dose-response curve analysis on all populations (danilevskii missing)  
[ ] account for spatial autocorrelation of study sites (requires discussion whether this is needed)  
[ ] write paper

# References


Bache SM & Wickham H (2014) magrittr: A Forward-Pipe Operator for R. 

Bates D, Mächler M, Bolker B & Walker S (2007) Fitting Linear Mixed-Effects Models Using lme4. Journal of Statistical Software 67.

Dowle M & Srinivasan A (2017) data.table: Extension of `data.frame`.

Duncan Temple Lang and the CRAN team (2018) RCurl: General Network (HTTP/FTP/...) Client Interface for R.

Lees JM (2012) geomapdata: Data for topographic and Geologic Mapping.

Menne MJ, Durre I, Korzeniewski B, McNeal S, Thomas K, Yin X, Anthony S, Ray R, Vose R., Gleason BE & Houston TG (2018) Global Historical Climatology Network -  Daily (GHCN-Daily).

Menne MJ, Durre I, Vose RS, Gleason BE & Houston TG (2012) An Overview of the Global Historical Climatology Network-Daily Database. Journal of Atmospheric and Oceanic Technology 29:897–910.


NOAA (1988) Data Announcement 88-MGG-02, Digital relief of the Surface of the Earth.

R Core Team (2018) R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria.

Rinker TW (2017) textreadr: Read Text Documents into R version 0.7.0. Buffalo, New York.

Ritz C, Baty F, Streibig JC & Gerhard D (2015) Dose-Response Analysis Using R. PLOS ONE 10:e0146021.

Rohatgi A (2017) WebPlotDigitizer. Austin, Texas, USA.

Wickahm H stringr: Simple, Consistent Wrappers for Common String Operations.

Wickham H (2017) re.

Wickham H, Francois R, Henry L & Müller K (2017) dplyr: A Grammar of Data  Manipulation.

Wickham H & Henry L (2018) tidyr: Easily Tidy Data with “spread()” and “gather()”   Functions.

Wickham H, Hester J & Francois R (2017) readr: Read Rectangular Text Data.

Zeileis (2006) Object-oriented Computation of Sandwich Estimators. Journal of Statistical Software 9.

Zeileis A & Hothorn T (2002) Diagnostic Checking in Regression Relationships. R News 2:7–10.



