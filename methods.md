# Description of this file  
This file consists of a summary and a methods section that is updated from time to time, and includes the most important methods and results. This is followed by a detailed description of all methods and models that have been used (and is hence rather long). Then there is a short results section (only most important parts are kept). In the end there is a checklist that summarises the long methods part and is at the same time my to-do list. 


# Summary    

Many organisms escape the adverse conditions of winter by a diapause response, usually relying on day length as main cue for winter onset, and on autumn temperature for fine-tuning. Natural environments are stochastic,  however, and winter onset is both variable across years (i.e. correlates only weakly with day length), and difficult to predict based on preceding autumn temperatures.  Because long-term (geometric mean) fitness is maximized by performing consistently under variable conditions and avoiding extinction, it should be adaptive to spread the risk in time by investing in phenotypes with different diapause thresholds (diversified bet-hedging). With increasing cue reliability the need to rely on bet-hedging should be reduced. Hence, we expected that variability in diapause timing is determined by an interaction of environmental variability and predictability.   
We tested this hypothesis with a meta-analysis. First, we calculated winter variability and predictability based on weather data for 30,000 locations. To correlate the environment with physiological variability, we then searched for publications that study photoperiodic response curves (PRCs) of insects at more than two sites (60 studies with 350-450 locations). We calculated the slopes of the PRCs with four-parameter dose response curves, expecting that they correlate with environmental variability and predictability.    
As expected, populations from northern latitudes shift their timing towards earlier diapause, progressing with approximately 50 minutes per 5 degrees latitude. This shift in diapause correlated well with the latitudinal cline in winter onset (and associated changes in photperiod) from the climate data. The analysis of slope ~ predictability * variability is not finished yet.




# Methods    

## climate data  
To calculate winter onset and environmental predictability at various locations, I used the GHCN-Daily dataset (Menne et al., 2012), version 3.22 which includes weather station data from throughout the world (Menne et al., 2018). I used the mean of daily minimum and maximum temperatures to calculate daily average temperatures of ~5-50 years for each station. I then calculated winter onset in each year as the day on which temperatures falls below x °C for the yth time (starting the "year" in midsummer), and used standard devitation among years to estimate winter variability. To calculate winter predictability, I first calculated the slope of the last 30 days before winter onset, and used the between-years standard deviation in that slope. During the analysis of the results (after seeing that predictability has likely no effect, but before final analysis), I changed the approach to calculating the "colour of noise", i.e. the slope coefficient in a power spectral density plot (not finished, but should, if possible, use only data for winter onset +- 1 month). 

## empirical data
I searched the web of science database for "(photoperiodic AND (geogr\* OR range)) OR (photoperiod\* AND latitud\*) OR(photoperiod\* AND longitud\*), filtered all relevant articles, and did a forward-citation search. I also checked the references of two books (todo). I then contacted some authors to obtain unpublished data (todo). Then I extracted photoperiodic response curves from ~60 published studies (~400 populations) along with their sampling locations, and estimated the means (LD 50, critical day length) and slopes of these curves with a dose-response-curve analysis. slopes were scaled by (max response - min response) (parameter d-c), because populations that achieve only 50% diapause induction have flatter slopes (todo)

## correlation of phoperiodic response with latitude

I correlated the critical day length (day length at which 50 % of all offspring switch to diapause) with latitude of origin. I used a linear mixed-effects model of form 
PRC ~ latitude + 1|(study nested in species)
 and weighted the model by the inverse of the standard error of the critical day length estimate (todo). Although the relationship appears exponential, box-cox transformation (sqrt) did not improve model fit or residual structure (box-cox gives wide range of transformations, 95% ~0.2-0.8). The effect size reported shuold be slope (measured in h/°N) +CI and Fisher's Z transform of pearson's r.

## correlation of slope in photoperiodic response with variability/predictability

To get estimates of predictability/variability/mean winter at the study site, I averaged the estimates from the 5 closest stations within a 5° radius (weighted by 1/euclidian distance). I then correlated winter unpredictability and variability with the slope of the PRCs using the following model:
slope ~ variability*predictability + (1|study in species) (todo)
where individuals slopes were weghted by the inverse of their standard error, and scaled by the study mean. (todo).
I did the same model for parameter d, the maximum diapause incidence each population reaches (todo). 
The preferred output is sqrt(adjusted R²) and slope +CI, though the random effects may require different approach
The predictability estimate comes from the colour-of-noise approach, if possible only using data from winter onset +- 1 month (todo).

## exploratory analyses  
The color-of noise approach was only adopted after seeing preliminary results, so one could argue it is not strictly hypothesis-testing (though I think it is improving on the method rather than data-mining). 
The following real exploratory analyses are planned:
using color of noise of the whole year (instead of noise of only +- 1 month around winter onset)
splitting data into subgroups (lepidoptera, diptera, other) and testing
checking which species are positive, and potential bet-hedgers

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

I then calculated winter predictability: The last 31 days before winter onset of each year were aggregated and pearsons R was calculated. The climate at one station was considered predictable (high R) if 1) temperature declined more or less linearly, 2) the slope was consistent across years, and 3) there was little day-to-day variation.  I used only years with at least 182 days of data, and concentrated only on years that actually reach winter as defined above. I excluded all stations that reach winter less than 3 times

Lastly, this approach was replaced by using the standard deviation in slopes of the same regressions. This is very likely the final version of predictability. Actually, no:

As alternative to the previous approach, I calculated the color of environmental noise like Vasseur & Yodzis 2004 (Ecology). Taking all temperature information (Tmax divided by Tmin) from one station, I calculated the power spectral density. First, I removed the seasonal trend by substracting from each daily temperature estimate the station-wide mean temperature of that day. Missing values were replaced by linear interpolation. I then calculated the spectral density within the frequency range of 1/366 and 1/(2 months) with the function spectrum, using the method "ar", and used the negative of the slope of log10(spectral density)~log10(frequency) as estimate for beta. beta was normally distributed.
Because this approach does not calculate winter predictability, but general environmental predictability, I do not expect to find a pattern here. Therefore this approach is not hypothesis-testing but exploratory. 
Not sure if possible, but limiting the time window to ~1 month around winter onset and then calculating the slope could be a better way to calculate predictability. This needs discussion and I will settle for one of the two ways to calculate predictability before conducting the real analysis on the final dataset. 



## empirical data

I searched the web of science database for "(photoperiodic AND (geogr\* OR range)) OR (photoperiod\* AND latitud\*) OR(photoperiod\* AND longitud\*)" on 19.2.2018. This search yielded 1627 unique  results. The results were merged in an excel-file. I added articles to the study that I knew or which were cited in these articles but that did not match the keywords (total: 1641). 
I classified the studies as plant/animal, Vertebrate/invertebrate, and water/terrestrial by filtering for different keywords (e.g. plant,flower, ento*, fish, bird) in journal titles. Articles that appeared in more general journals were classified manually (according to title, abstract or full text).


Concentrating on terrestrial invertebrates, I selected only studies that measured photoperiodic response curves of more than two populations, and over at least 3 photoperiods.  61 studies with 364-450 populations fulfilled these criteria (5 studies with a total of 90 populations did not show any PRCs but I may be able to retrieve them if I write to the authors). These 61 studies examined PRCs of 47 species (T.urticae and some Drosophila species were adressed in several studies) of 9 orders (1 species per study, except in one case). I did a forward citeation search on april 3rd 2018 on all 61 eligible studies, and found 762 further articles that cite these studies, 11 of which were suitable for inclusion. A forward search on these 11 articles on April 12th (94 new refs) brought 1 new study, and following its 20 citations on April 16th yielded another article. Its 14 citations (april 16th) yielded no further article. 
I removed again all studies with exactly 3 photoperiods measured (study IDs: 3,10,16,31,36,52,69), because they are not useful for DRC  analysis, but nevertheless good for the literature search.In total, 46 studies with 358 populations (up to 57 with 440 after contacting authors) were included.
For all studies that were included, I noted study species, sample sizes, coordinates and altitude (if available), and saved the PRCs as .png files. I then extracted the data from the figures using WebPlotDigitizer Version 3.12 (Rohatgi, 2017). When raw data was avaiulable (x % of all cases) I used this data to test the error rate of manual extraction (todo, but small according to initial tests). Where neccessary,  the day length was then rounded or corrected to match the description in materials and methods of the respective study. For example the points on the x-axis were in some cases not continous as the axis would suggest (e.g. x-axis in (Paolucci et al., 2013) mixes 1h intervals with 2h intervals), or points were plotted next to each other for better visibility  (Riihimaa Ari et al., 2004). Y-values that were slightly above 100% or below 0% were set to 100% and 0% respectively. in one figure of (Urbanski et al., 2012), 1 data point that appeared in the figure but did not exist in the available raw data was deleted.


To estimate the slopes I modelled diapause with four-parameter binomial dose response curves in R. This analysis provides lower and upper bounds of photoperiodic induction (I constrained these to range from 0 to 100%), the slope, and the point where 50 % of the individuals are induced (critical day length). Where detailed information on sample sizes was available (% of all cases), I weighted diapause estimates by number of trials. I also recorded the standard error, using a robust sandwich estimation method (Zeileis, 2006).
To get the coordinates of the study populations, I used 1) the coordinates that were quoted in the studies, or, if not available coordinates of the quoted town or area. Town and area coordinates were made available by the WikiProject Geographical coordinates and the Geohack tool (Dispenser et al., 2018) 


## Statistical analysis


#### climate: old approach based on predictability (R²): (discontinued) 
I correlated winter predictability (R²) with latitude, longitude and square-root-transformed altitude in a linear model. The model estimates were then used to interpolate to the sampling sites of the empirical studies. To do so, I used 1) the coordinates that were quoted in the studies, or, if not available coordinates of the quoted town or area 2) the altitudes that were quoted in the studies, or if not available, the altitude of the available coordinates. Town and area coordinates were made available by the WikiProject Geographical coordinates and the Geohack tool (Dispenser et al., 2018), and the altitude was derived from a topographic map of the world with a resolution of 5 minutes in latitude and longitude (NOAA, 1988).  
I used a mixed-effects model to correlate the estimated predictability at  the sampling locations with the slopes of the empirical PRCs. The influence of each of the 350 populations was weighted by the inverse of the standard error of the slope estimate; study identity was used as random term. An alternative appraoch would be to use study species as random term, and ignoring study id (doing both could be complicated). This approach would allow including studies with only 1 population. <<-better still: species nested in study.

#### physiology: correlation diapause with latitude  
I correlated the critical day length (day length at which 50 % of all offspring switch to diapause; parameter e in dose-response curves) with latitude of origin. I used a linear model, and weighted by the inverse of the standard error of e (todo: lmer with study or species/study as random). Although the relationship appears exponential, box-cox transformation (sqrt) did not improve model fit or residual structure (box-cox gives wide range of transformations, 95% ~0.2-0.8).  

#### climate: new approach with slopes estimate  
I calculated correlations of variability and predictablity with latitude, amplitude, altitude and with amplitude from the nls regression. I found no general pattern, though both variability and unpredictability appear to be higher in continental climates (as expected from low amplitude). Variability and unpredictability do not correlate strongly.

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


#### general information  
I used Perl version 5.22.1, and R version 3.4.4 (R Core Team, 2018). The data was manipulated with the packages textreadr, Rcurl, data.table (Dowle & Srinivasan, 2017; Rinker, 2017; Duncan Temple Lang and the CRAN team, 2018) and the tidyverse packages  (Wickham, 2017) readr, tidyr, dplyr, stringr and magrittr (Wickahm; Bache & Wickham, 2014; Wickham, Francois, et al., 2017; Wickham, Hester, et al., 2017; Wickham & Henry, 2018). To interpolate between climate stations I used the package geomapdata (Lees, 2012).  The data from the empirical studies was extracted with WebPlotDigitizer version 3.12 (Rohatgi, 2017).
The dose-response curve analyses were made with the package drc (Ritz et al., 2015) , its standard errors were computed with the packages sandwich (Zeileis, 2006) and lmtest (Zeileis & Hothorn, 2002), and the correlation of variability and slope estimates was computed with package lme4 (Bates et al., 2007).

MASS needs inclusion
as does package for daylength
and imputeTS
geomapdata not used anymore

# Results    


## climate data
Mean winter correlated with latitude and altitude. (old: Environmental predictability was reasonably well explained by latitude,longitude and altitude (R² = 0.25)) (new:) Environmental variablity did not correlate with any variable tested though it seems higher in continental climates and higher in high latitudes. Standard deviation in winter onset was a bit more erratic, and not correlated with any variable. (colour of noise todo)


## empirical data
The critical day length ( julian date on which 50 % offspring are diapausing) increased with latitude, by about 1 hour per 5°N (Fig. 2). This is close to published values of 1h to 1.5 hours per 5 ° Latitude (Danileevski 1986). (get slope + CI)

## empirical + climate data
The critical day length was consistently earlier, but correlated to the photoperiod expected by mean winter onset from the climate data. 
Critical day length correlates with mean winter onset
the slopes currently correlate neither with sd of winter onset, nor with unpredictability (in earlier versions a bug caused positive results) or environemntal color (todo). But many important details are not implemented yet, so things will likely change. 



# To-do list  
[x] Calculation mean winter onset, sd winter onset, predictability 
[.] correlation of these with °N/°E/alt/amplitude from nls (col of noise todo)
[x]  calculate the colour of noise (spectral power analysis). Although this only describes general precitability (not predictability of winter).

[x] find studies with photoperiodic response curves
[x] do forward-citation search to find further studies
[ ] get Danilevskii (requested)
[ ] get beck insect photoperiodism to check table 28 (requested)
[x] do 2nd level forward search

[x] get metadata for forward-searched articles and integrate to excelfile
[x] kick out studies with only 3 day lengths(does not allow sensible calc of DRC)
[.] extract PRCs where available (old refs still to do)
[ ] ask authors for missing data (N,coordinates, PRCs)
[.] get slope estimates from dose-response curve analysis on all populations (forward searched, author requests and old refs still missing)
[ ] estimate of error introduced by WebPlotDigitizer approach

[.] correlate CDL ~ latitude, weighted by s.e. of CDL estimate (missing: study ID as random term, nestedness with species)
[x] transformation of CDL to achieve linearity (turns out it is not needed)
[x] geographical averaging to get climate variability estimates at location of study sites
[x] calculation expected CDL shift based on climate data (winter arrival)
[x] correlation expected and true CDL shift
[ ] weights = 1/s.e. of slope estimate
[.] scaling of slope with d (not sure whether right approach)
[ ] account for variance heterogeneity
[ ] slope ~ predictability * variability + (1|study\species) (requires discussion whether this is correct final model)
[ ] account for spatial autocorrelation of study sites (requires discussion whether this is needed)


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



