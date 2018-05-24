# Description of this file  
This file consists of a summary and a methods section that is updated from time to time, and includes the most important methods and results. This is followed by a detailed description of all methods and models that have been used (and is hence rather long). In the end there is a checklist that summarises the long methods part and is at the same time my to-do list. 


# Summary    

Many organisms escape the adverse conditions of winter by a diapause response, usually relying on day length as main cue for winter onset, and on autumn temperature for fine-tuning. Natural environments are stochastic,  however, and winter onset is both variable across years (i.e. correlates only weakly with day length), and difficult to predict based on preceding autumn temperatures.  Because long-term (geometric mean) fitness is maximized by performing consistently under variable conditions and avoiding extinction, it should be adaptive to spread the risk in time by investing in phenotypes with different diapause thresholds (diversified bet-hedging). With increasing cue reliability the need to rely on bet-hedging should be reduced. Hence, we expected that variability in diapause timing is determined by an interaction of environmental variability and predictability.   
We tested this hypothesis with a meta-analysis. First, we calculated winter variability and predictability based on climate data. To correlate the environment with physiological variability, we then searched for publications that study photoperiodic response curves (PRCs) of insects at more than two sites. We found 30 publications with PRC reports of sufficient quality. The slopes of the PRCs are an approximation of diapause variability, because they describe temporal spread of diapause, and we correlated them with environmental variability and predictability.  
As expected, populations from northern latitudes shift their timing towards earlier diapause, progressing with approximately 1 hour per 5 degrees latitude. This shift in diapause correlated well with the latitudinal cline in winter onset (and associated changes in photperiod) from the climate data. The analysis of slope ~ predictability * variability is not finished yet.




# Methods    

## climate data  

To calculate winter onset and environmental predictability at various locations, I used the GHCN-Daily dataset (Menne et al., 2012), which includes weather station data from throughout the world (Menne et al., 2018). I used the mean of daily minimum and maximum temperatures to calculate daily average temperatures of ~5-50 years for each station. I then calculated winter onset in each year as the day on which temperatures falls below x °C for the yth time (starting the "year" in midsummer), and used standard devitation among years to estimate winter variability. To calculate winter predictability, I first calculated the slope of the last 30 days before winter onset, and used the between-years standard deviation in that slope. As a more exploratory approach, I added a calculation of the "colour of noise", i.e. the slope coefficient in a power spectral density plot. 

## empirical data  

I searched the web of science database for "(photoperiodic AND (geogr\* OR range)) OR (photoperiod\* AND latitud\*) OR (photoperiod\* AND longitud\*), filtered all relevant articles, and did a forward-citation search (approx. 2000 references in total). I also checked the references of two books (1 todo). I then contacted some authors to obtain unpublished data (todo). 61 studies reported PRCs under at least 3 day lengths for at least 3 populations, but only 30 studies were of sufficient quality. I extracted the photoperiodic response curves from these 30 studies along with their sampling locations, and estimated the means (LD 50, critical day length), range of photoperiodic induction and slopes with a dose-response-curve analysis. 

## combining the datasets  

To get estimates of predictability/variability/mean winter at the study site, I averaged the estimates from the 5 closest stations within a 5° radius (weighted by 1/euclidian distance).  

## correlation of phoperiodic response with latitude

I correlated the critical day length (day length at which 50 % of all offspring switch to diapause) with latitude of origin. I used a linear mixed-effects model of form 
CDL ~ latitude + 1|(study nested in species/genus/order)
 and weighted the model by the exponential of the inverse of the standard error of the critical day length estimate. I did the same for a correlation of CDL with expected CDL based on the day length at winter onset.

## correlation of slope in photoperiodic response with variability/predictability

 I then correlated winter unpredictability and variability with the slope of the PRCs using the following model:
slope ~ variability*predictability + (1|study in genus/order)
where individuals slopes were weighted by the inverse of their standard error



## exploratory analyses  

The following real exploratory analyses are planned:
1) The "color of noise" approach takes whole-year predictability into account, not winter predictability. It hence does not fit strictly to the hypotheses and is an exploratory analysis.
2) splitting data into subgroups (lepidoptera, diptera, other) and testing
3) checking which species are positive, and potential bet-hedgers
4) during analysis it turned out that the parameter d, the maximum diapause incidence each population reaches, usually varies among populations. This potential bet-hedging trait was tested as well.


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
I then calculated winter predictability: In a first attempt the last 31 days before winter onset of each year were aggregated and pearsons R was calculated. The climate at one station was considered predictable (high R) if 1) temperature declined more or less linearly, 2) the slope was consistent across years, and 3) there was little day-to-day variation.  I used only years with at least 182 days of data, and concentrated only on years that actually reach winter as defined above. I excluded all stations that reach winter less than 3 times. This approach was replaced before doing the real analyses by using the standard deviation in slopes of the same regressions, as this seems statistically more sound. During analysis (after seeing that there seems to be no effect, but before including right random terms), I decided to supplement this by a calculation of environmental noise like Vasseur & Yodzis 2004 (Ecology).  

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

After fitting the models for the CDL~latitude data, I saw that the CDL from lab studies were consistently earlier(several months) than the day length that corresponds to winter onset. I therefore used the latitude of each study to calculate the day length on diapause onset, which I defined as {winter onset  - i=1,2...365 days}. I correlated observed CDLs with these 365 possible diapause onsets, using the model CDL~daylength - intercept, with daylength = f(latitude, diapause onset(i)). The model(i) with the lowest Komogorov-smirnov D was at meanwinter - 94 days. I ran the climate analysis again with different parameter combinations to search for a combination that is 94 days earlier. 

#### slope vs climate data
to-do!

#### general information  
incomplete list of packages used (needs updating!)  
I used Perl version 5.22.1, and R version 3.4.4 (R Core Team, 2018). The data was manipulated with the packages textreadr, Rcurl, data.table (Dowle & Srinivasan, 2017; Rinker, 2017; Duncan Temple Lang and the CRAN team, 2018) and the tidyverse packages  (Wickham, 2017) readr, tidyr, dplyr, stringr and magrittr (Wickahm; Bache & Wickham, 2014; Wickham, Francois, et al., 2017; Wickham, Hester, et al., 2017; Wickham & Henry, 2018). To interpolate between climate stations I used the package geomapdata (Lees, 2012).  The data from the empirical studies was extracted with WebPlotDigitizer version 3.12 (Rohatgi, 2017).
The dose-response curve analyses were made with the package drc (Ritz et al., 2015) , its standard errors were computed with the packages sandwich (Zeileis, 2006) and lmtest (Zeileis & Hothorn, 2002), and the correlation of variability and slope estimates was computed with package lme4 (Bates et al., 2007).

MASS needs inclusion
as does package for daylength
and imputeTS
geomapdata not used anymore


# Results    



# To-do list  
climate data  
[x] Calculation mean winter onset, sd winter onset  
[x] calculation predictability: sd (slopes)  
[x] calculation predictability: colour of noise  

studies  
[x] find studies with photoperiodic response curves  
[x] kick out unsuitable articles  
[x] get metadata for all remaining articles  
[x] extract rawdata  
[x] do forward-citation search to find further studies  
[x] get Danilevskii   
[ ] get beck insect photoperiodism to check table 28  
[x] kick out studies with only 3 datapoints/only 1 point on slope  
[x] get metadata  
[ ] extract rawdata (danilevski missing)  
[ ] ask authors for missing data (N,coordinates, PRCs)  
[.] get slope estimates from dose-response curve analysis on all populations (danilevskii missing)  
[ ] estimate of error introduced by WebPlotDigitizer approach  

analysis   
[x] settle for modelling approach  
[x] decide which statistics to report  
[x] correlate CDL ~ latitude, weighted and with appropriate random structure  
[x] transformation of CDL to achieve linearity (turns out it is not needed)  
[x] geographical averaging to get climate variability estimates at location of study sites  
[x] calculation expected CDL shift based on climate data (winter arrival)  
[x] correlation expected and true CDL shift  
[ ] do same model on slope ~ climate  
[.] scaling of slope with d (not sure whether right approach)  
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



