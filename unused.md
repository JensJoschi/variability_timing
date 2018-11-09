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

#### additions october 2018  
Our use of thresholds was a more or less arbitrary decision. The first threshold (5°, 10 days) resulted in a mean winter onset around 30 november, much earlier than the day lengths from the empirical studies (~13 hours, mid-july). I then tried to find the most suitable parameter combination, by finding out which mean timing best fits the data, and adjusting the parameters to get such a mean tming. The best fit was 94 days earlier than the 5°,10 day combination. The combination 15°,7 days yielded a winter onset that is still 1 month away from the best fit, but I left it at that gap, because I think that otherwise the calculation of winter onset becomes unstable (inflates variability?). 1 month is fine anyway, because that represents a realistic gap between diapause induction and diapause expression. 
I then systematically varied the parameters to prepare for a sensitivity analysis, between 5 and 15°C, and the number of days below this threshold between 1 and 10 days.
For the (hopefully really) final analysis I settled for 5 days below 10°C (not 10 days below 5), because this is similar to the values of halkett et al (regression over monthly means crosses 12°C) and waldock (threshold value of 11°C).  It resulted in a global median winter onset around Oct 11 .

#### comparison  
Both searches found 72 articles, but these were not completely the same. We hence compared the lists of articles found in the first and second search, including all forward citations. 

64 articles were found by both searches. Out of the 8 articles that were only found in the first search, 3 were truly not found in the second search, whereas the other 5 were notes to contact the author and ask for data. 3 of the 8 unique articles in the second search were truly not found in the first search, two were wrongly tagged as negatives, one was left to check ,and two were marked as problematic in both searches. 

During the comparison we found a few articles that were never followed up due to lack of literature access. After following these missing data the comparison was done again:

64 articles were found by both searches. Out of the 8 articles that were only found in the first search, 3 have been wrongly classified as positive, whereas the remaining five are useful references (2 were truly not found in the second search and 3 were wrongly classified as negative). The 8 unique articles of the second search were all usfeul (4 false negatives in first search, 4 missing).
Altogether, there were 77 useful references.
(the notes to contact the author may be dubbed false positive, or false negative, depending on whether the contacting is successful)

upon closer inspection 1 article had only one population, leaving 76 references.

#### eligibility/cleaning
10 articles missed important data, 28 were removed(6 measured only 3 day lenghts, 2 did not contain useful data (1 meeting abstract, 1 irrelevant study),  17 had too few points on the sloped parts, and 3 had incomplete photoperiodic response curves), 37 were left.

Two further studies were removed because the coordinates were not accurate enough.
 
From the remaining 35 studies (312 populations), 104 individual populations had to be removed because their response curve was incomplete or did not have enough points on the sloped part.

The remaining 35 studies were on 211 populations in 31 species (8 orders). The majority of the populations came from japan (95 populations, 17 studies), followed by Europe (84 populations, 12 studies), the US (21 populations, 4 studies), China (7 populations, 2 studies), Mexico and middle america (3 populations, 1 study), and indonesia (1 population in 1 study) (2 studies were over 2 regions). 
Contacting the 11 authors with missing dta may bring up to 172 further pops! 

The required information on slopes and CDL was directly given for 1 study (7 populations). For the remaining 204 populations it had to be extracted from figures/tables.


#### new comparison (1 oct 2018)  
[Out of the 75 articles found by the first search, 8 did not have 4 photoperiods and 5 were false positives. 62 remained. From the 77 articles of the second search, 5 had only 3 photoperiods, 7 were false positives. 65 remained. 
After combining these two datasets, 69 unique articles remained.]

alternative:
The 75 articles found by the first search included 5 false positives, and the 77 articles from the second search included 7 false positives. Thus, 70 references remained in each search. After combining these two datasets, 78 unique articles (624 populations) remained. 


#### inclusion (1 oct 2018)

Only populations with 2 points or more on the sloped part were considered for analysis; 21 Studies had less than three such populations and were therefore excluded. 
The remaining 35 studies were on 211 populations in 31 species (8 orders). The majority of the populations came from japan (93 populations, 17 studies), followed by Europe (84 populations, 12 studies), the US (24 populations, 5 studies), China (7 populations, 2 studies) and Mexico and middle america (3 populations, 1 study) (2 studies were over 2 regions).  One study (7 populations) reported the slope and midponit from drc analyiss directly. Only four of these studies reported photoperiodic response curves for 2 temperatures. 


#### inclusion 4 oct 2018  
Multiple articles did not contain raw data or figures, or the raw data in figures was not unambigously linked to the populations (use of same symbols for all populations). In 12 cases the data could not be retrieved (todo), and the studies had to be removed from analysis (179 populations). 445 populations remained.
9 articles (52 populations) had only three day lengths, and this is not enough to calculate the slope. 
The calculation of reliable slope estimates required in general at least four day length measurements, with two points on the sloped part of the reaction norm and two points defining upper and lower limits (though upper or lower limits could be imputed in 3 cases; see below).
24 studies (98 populations) did not fulfil these requirements for three populations and were removed. Moreover, 106 of the remaining 295 populations were removed, leaving 33 studies with 189 populations.


### drc analysis(old)  
To estimate the slopes I modelled diapause with four-parameter binomial dose response curves in R. This analysis provides lower and upper bounds of photoperiodic induction (I constrained these to range from 0 to 100%), the slope, and the inflection point where 50 % of the individuals are induced (critical day length), so four parameters per slope were estimated. 

There were 2 problems with the first attempt to calculate dose-response-curves. First, studies with only 1 point estimate on the slope part should not be included, because the slope estimate becomes unreliable. Secondly, the estimation method with 4 parameters per curve costs many degrees of freedom. Intuitively one would expect, however, that all populations of one species have the same lower and upper limit, wich would reduce the estimation to 2 parameters per slope, plus 2 global parameters. I therefore tried the following models on each study (sorted by plausibility): 

1. upper and lower parameter fixed at study mean (requires 2 df plus 2 df per population)
2. upper parameter fixed (requires 1 df plus 3 per population)
3. lower parameter fixed (requires 1 df plus 3 per population)
4. both limits vary (requires 4 df per population)

Model 2 may results from conservative bet-hedging (some populations have non-zero diapause regardless of season, to hedge against early winter), while model 3 is the risk-prone opposite (some non-diapausing offspring exist even late in the season to hope for late winter, see halkett et al 2004).

All analyses were done on 30 studies where the slopes can be reliably estimated, i.e. with at least 2 points on the slope part (this could include the highest point of one population if that was still below a study-wide upper limit). I fitted all models, provided there were at least 3 residual df left, and chose those with lowest AIC. If there were multiple models with delta AIC <2, I used the most plausible model. If necessary for model convergence, I removed the box constraints (diapause ranging between 0and 100%), provided the resulting estimates were reasonable (e.g. lower limit = -0.02%, or s.e. of estimte going slightly over the limit). Model 3 was (surprisingly) most often the best suited model. 

# drc analysis (after merging with new search results)  

same approach as before, but on 204 populations, and with a delta-AIC of 4.0. 169 populations gave no (2 studies) or only global averages of sample sizes (e.g. "there were on average 20 individuals per treatment" or "sample sizes ranged from 30-120 individuals" - in this case I used the mean,75), 7 populations (2 studies) had population-level means ("there were on average 20 individuals per treatment in Kochi and Sendai, 40 in Kyoto"), and 28 populations (8 studies) had accurate information (sample size of each treatment in each population).

One population (KS in Kimura_evol) had to be removed, and three studies (Lehmann, Pegoraro, Murata) were very variable.
Murata was removed subsequently, and the line SP22 in Pegoraro(entirely flat) was removed,too.
We then removed Suwa, because the low S.e. in both b and e suggest that it was overfitted. Three populations had very low standard errors in the b estimate, so that the influence (1/s.e.) was more than 10 times higher than the median. Similarly, 4 populations had very low s.e. in the slope estimates. These 7 populations were flagged to be removed from the respective analyses.
In the end there were 35 studies, with 181 populations with CDL estimates, and 182 populations with slope estimates.


### drc analysis 4 oct  

Detailed information on number of individuals per point estimate was rarely available (22 populations, 7 studies), as sample sizes were either given as population-level means (4 populations, 1 study) or as global average or range (139 populations, 22 studies), or missed entirely (2 studies, 10 populations). 

During analysis we removed 7 studies (21 populations) and 22 further populations, because the fitted curves did no longer match the inclusion criteria (2 points on sloped part), resulting in unrealistically high slope estimates and low standard errors. 25 Studies and 139 populations were left. We added the study with 7 populations, which provided estimates of mean and slope directly, levaing 26 studies and 146 populations.

table of all decisions made:
i|study         |best   |chosen |impossible   |notes
1|chen          |1,3,4  |1      |
2|gomi          |LL.2   |LL.2   |all          |mod 1 would have missing data for 2 pops
3|gotoh         |3                            |consider removing ishikawa     
4|hashimoto     |1,3    |1                    |nagaoka and okayama removed            
5|ito           |2,4    |2                    |WA removed
6|kimura_geogr_1|3                            |consider removing OI
7|kimura_geogr_2|3,4    |3
8|kimura_geogr_3|1,3,4  |1      |            |evidence for 1 from 2 further pops
9|koveos        |4                            |thessaloniki1 and padua removed
10|kurota       |3    |3      |4   
11|lankinen     |3    |3      |             |evidence for 1/3 from 8 further pops; dietikon2 removed
12|lehmann      |NA    |NA      |             |removed
13|lumme        |2,4  |2
14|lushai       |NA  |NA                      |removed
15|murata       |NA    |NA                      |removed
16|musolin      |NA   |NA                     |removed
17|nechols      |LL.2 |LL.2                 |mod 1 would have NA for 1 pop, evidence from 7 further pops
18|paolucci     |1-4  |1                    |SCH looks odd
19|riihima      |2    |2      |             |removed oulo2
20|ryan         |1,2,3|1      |4
21|shimizu      |3,4  |3                    |SPR removed
22|shintani     |LL.2 |LL.2                 |mod1 would have NAs, evidence from 8 further pops
23|shroyer      |2    
24|so           |NA   |NA                   |removed
25|suwa         |1    |1      |             |removed all pops except 7,10,16,20; consider removing completely
26|tyukmaeva    |3,4  |3                    |removed lathi1,lathi3
27|ujiye        |NA    |NA      |NA         |removed
28|urbanski     |3    |3      |4              |1 and 2 without box constraints (bc fit is soo bad), 4 has NA for 1 pop
29|vaznunes     |3    |3      |4            |removed S1,S2,T2
30|wang         |1,3  |1
31|yoshida      |3    |3
32|kimura_evol  |NA   |NA                   |removed
33|takeda       |1,3,4|1                    |consider removing
34|noda         |3    |3      |               |removed dl<9; removed ishigaki


Our strict inclusion criteria ensured that all 146 populations have at least two data points on the sloped part. However, populations with data only at the extremes of the slope (e.g. 5% and 95%) nevertheless resulted in unrealistically low standard errors. The inverse variance, which is needed to determine the weight of each study, hence ranged over 5 orders of magnitude (10^0 - 10^(-5)), with lowest values mostly on the least reliable studies. Constraining the analysis to populations with three data points on the sloped part would bias the selection to populations with flat slopes, while halving the dataset and not fully mitigating the problem. Instead, we capped the inverse variance at 10 times the median inverse variance. This affected 15 populations for the slope estimates, 

 [1] chen-Yongxiu-Helicoverpa-armigera           hashimoto-Iwamizawa-Pieris-rapae           
 [3] hashimoto-Naze-Pieris-rapae                 kurota-Ninohe-Bruchidius-dorsalis          
 [5] riihimaa-Punkaharju-Chymomyza-costata       shintani-Yokokawa-Psacothea-hilaris        
 [7] shroyer-BURDETTE-Aedes-triseratius          suwa-16-Tetranychus-pueraricola            
 [9] suwa-20-Tetranychus-pueraricola             suwa-7-Tetranychus-pueraricola             
[11] tyukmaeva-Oulanka3-Drosophila-montana       tyukmaeva-Pelkosenniemi1-Drosophila-montana
[13] tyukmaeva-Pelkosenniemi2-Drosophila-montana tyukmaeva-Pelkosenniemi4-Drosophila-montana
[15] yoshida-onuma-Drosophila-triauraria   

and  26 studies for the mean estimates:
[1] gomi-FI-Hyphantria-cunea                 gomi-SO-Hyphantria-cunea                
 [3] hashimoto-Iwamizawa-Pieris-rapae         ito-HA-Orius-sauteri                    
 [5] ito-MO-Orius-sauteri                     kimura_geogr_1-OI-Drosophila-auraria    
     kimura_geogr_2-IW-Drosophila-triauraria 
 [9] koveos-Thessaloniki2-Tetranychus-urticae koveos-Voorne-Tetranychus-urticae       
[11] kurota-Ninohe-Bruchidius-dorsalis        kurota-Sagamihara-Bruchidius-dorsalis   
[13] riihimaa-Punkaharju-Chymomyza-costata    shintani-Yokokawa-Psacothea-hilaris     
[15] shroyer-BURDETTE-Aedes-triseratius       suwa-10-Tetranychus-pueraricola         
[17] suwa-16-Tetranychus-pueraricola          suwa-20-Tetranychus-pueraricola         
[19] suwa-7-Tetranychus-pueraricola           vaznunes-L-Tetranychus-urticae          
[21] vaznunes-P-Tetranychus-urticae           vaznunes-V-Tetranychus-urticae          
[23] vaznunes-W-Tetranychus-urticae           wang-HH-Sericinus-montelus              
[25] wang-WH-Sericinus-montelus               takeda-stjohn-Diatraea-grandiosella     
[27] noda-Sendai-Laodelphax-striatellus   

 We repeated all further analyses with uncapped variances, with those points removed, and with an unweighted meta-analysis to test how this decision biased our results. (todo)
 
## changes after statistical consulting  (oct 2018)
inverse variance approach is probably fine as is, though capping at the xth percentile is better than saying 10* the mean. using a sample-size weighing may be better than inverse variance wieghing. The actual analysis is fine, though the I² close to 100% is strange. double check if there is an error.

description of the sample size weighing:
Meta-analysis models differ from regular mixed-effects models in that the data points (effect sizes of each study) are weighed by their reliability. Usually the models are weighed by the inverse of the effect size variance, but this was not feasible in our analysis. Even though we restricted our analysis to populations with at least two points on the sloped part, an unbalanced distribution of data points (e.g. at 5% and 95% induction) caused partial overfitting in some populations and resulted in unrealistically low standard errors. We looked at funnel plots (s.e. vs residuals of the models 1) CDL~lat, random = ID/genus/order, unit weight; 2) slope ~ 1, same random, unit weight), and they showed that points with high standard errors spread less around expectation than points with low standard errors (i.e. the funnel goes wrong way). especially for slope estimates with s.e. between 0 and 20. For higher s.e. it becomes better (spread proportional to s.e.)

We tried a different weighing, based on the no. of points on the sloped part. We counted all points on sloped part plus first point on the upper and lower limit. These are the points that mostly define shape of drc. It was manually done by counting the points on the fittted curves.These funnel plots look much better, because they are in the right direction now. The shading "funnel" is missing in these plots, because it cannot be calculated with sample sizes only. See also ?funnel. 

 (Fig. S1). The inverse variance weight hence ranged over 5 orders of magnitude (100 - 10-5), with highest values mostly on the least reliable studies. We therefore weighed the studies by the number of day length treatments that hit the sloped part. This is similar to a sample size- weighing approach, only without the caveat that sample sizes are not comparable across studies. To test whether this decision biased our results, we repeated all analyses by weighing with inverse variances (these were capped at the 20th percentile to allow model convergence) and with an unweighted analysis.
 
## Statistical analysis  

The statistical model became quite complicated, and I needed to test a couple of things before settling on the final model. Originally I planned the following models:

1)  slope ~ variability + 1| study
2)  slope ~ predictabilty + 1|study

but thinking more about the issue I decided to switch to a single model with a variability*predictability interaction term. Also the random structure simplifies too much, because it turned out there is quite some phylogenetic signal in it that needs accounting for. As side question I decided for a third model:

3) mean timing ~ latitude + 1|study

In the beginning I tried various ways of scaling, different random structure and weighing the studies, to see which approaches work and which do not. But as I realized that this approach leaves way too many researchers degrees of freedom, I stopped the work on the slope~variability \* predictability model. Instead I focussed on the side-question how mean diapause timing correlates with latitude. The relationship is well-known and highly significant no matter which model is applied, so there is no potential bias towards models with a significant effect. After settling for the right model and summary statistics,I will applied the same model to the variability\*predictability data. 


#### climate: old approach based on predictability (R²):

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

#### new analysis after merging old and new search and proofreading script  

In the last analysis all populations were included for drc modelling, and only those with clear convergence failure removed subsequently. This way some clearly overfitted populations slipped through, with s.e. of the estimates very close to 0, so the influence (1/s.e.) was infiinte. 
This time the populations with <2 points on sloped part were removed directly, and only 2 studies + 1 pop removed after drc modelling. The resulting data (CDL + s.e.) was much more homogenous, so the models did not need to exp-transform the s.e.).  
It is generally agreed to use 1/variance, but squaring the s.e. would lead to a very broad range of weights (11% more than 10\* influence of median, 20% less than 0.1 \* median), so I continue with 1/s.e.

new model
cdl~latitude + (1|order/genus/study) , weights = exp(1/s.e) (of cdl estimate)

cdl ~ expected_daylength + (1|order/genus/study) , weights = exp(1/s.e) with 
expected_daylength = daylength(latitude, winter_onset -30 days) using the function from geosphere.

#### slope vs climate data  
I used the model 
cdl \~ variability*predictability + (1|order/genus/study), but with
weights = 1/s.e (of slope estimate), because s.e. were not close to 0. For predictability, I used the sd(slopes) estimate, not the colour of noise approach. For plotting I used 2 individual models, cdl \~ variability and cdl \~ predictability with same random terms and weighting. 

#### exploratory analyses  
I plotted upper limit ~ variability (for a subset with meaningful estimates), cdl ~ variability, cdl ~ predictability, and slope ~ colour of noise, but did not do formal models. there was no meaningful effect. 


# searches that were conducted but never used  

### 07.09.2018: searched in new google dataset beta search "photoperiodic lresponse insect" - 9 results, not relevant or duplicates  

#### search for diapause termination  

TS = ( (post-diapaus* OR (diapaus* AND ("termination" OR cessati* OR spring))) AND (geogr* OR "range" OR latitud* OR longitud* OR cline$ OR clinal OR "populations"))

TS = (( (spring and (phenolog* OR emerg*) ) ) AND (geogr* OR "range" OR latitud* OR longitud* OR cline$ OR clinal OR "populations")) NOT #1 


TS = ( ((SPRING AND (ECLOSION OR emergence)) OR post-diapaus* OR (diapaus* AND ("termination" OR cessati* OR spring)))) (5697, 2769 after reduction -would take ~ 10 h for ~ 28 studies)

mammals ~ 5500

#2 AND SU = entomology 

#2 NOT #3 AND SU = zoology NOT TI =( marine* OR aquat* OR limno* OR water OR palaeo* OR $vertebra* OR *fish* OR $amphib* OR $salientia* OR $anura* OR $caudata OR $salamand* OR newt$ OR $gymnophion* OR frog$ OR tadpole$ OR toad$ OR $reptil* OR $crocodil* OR *sauria* OR $squamat* OR $lizard* OR $lacert* OR $gekko* OR $serpent* OR $snake* OR $testudin* OR $turtle* OR $tortois* OR $mammal* OR $rodent* OR $sciurid* OR $hamster* OR *mouse* OR *mice* OR $squirrel* OR $rabbit* OR $hare OR $hares OR $chiropt* OR $bat OR $bats OR $myotis OR $sorciomorpha OR $soricid* OR $talpid* OR $shrew* OR $marmot* OR $mole OR $moles OR $primat* OR $carnivora OR $ursid* OR $ursus OR $felid OR $felids OR "$sea lion" OR "$fur seal" OR "$elephant seal" OR $marsupi* OR $goat* OR $sheep* OR $deer OR $cattle OR estrus OR suprachiasm*) 

#2 NOT #3 NOT #4 AND SU = zoology AND TI =(invertebrat* OR worm* OR annelid* OR platyhelminth* OR nematod* OR mollusc* OR gastropod* OR slug* OR snail* OR arthropod* OR chelicer* OR arachnid* OR aranea* OR acari OR tetranych* OR ixod* OR opilion* OR spider* OR *scorpio* OR tick$ OR mite$ OR harvestmen OR crustace* OR malostraca* OR isopod* OR woodlice OR oniscid* OR armadillium OR myriapod* OR chilopod* OR diplopod* OR pauropod* OR symphyla OR millipede* OR centipede* OR hexapod* OR collembol* OR springtail* OR insect$ OR blattodea OR *ptera OR mantodea OR odonata OR phasmatodea OR psocodea OR thysanura OR zygentoma OR psyllid* OR stenorrhyn* OR cockroach* OR beetle$ OR earwig* OR *fly OR *flies OR droso* OR mosquit* OR *bug$ OR aphid* OR adelgid* OR phyllox* OR *wasp$ OR (*bee OR *bees) OR (ant OR ants) OR mantis OR grasshopper* OR locust* OR cricket* OR louse OR lice OR flea$ OR moth$ OR thrip* OR silverfish ) NOT TI = (paleo* or $chiroptera*) 


	
#2 and SU = (Environmental Sciences & Ecology OR Evolutionary Biology OR Science & Technology Other Topics OR Life Sciences Biomedicine Other Topics OR GENETICS HEREDITY OR BIODIVERSITY CONSERVATION OR SOIL SCIENCE) NOT SU = (entomology OR zoology) 

#6 AND TI = (invertebrat* OR worm* OR annelid* OR platyhelminth* OR nematod* OR mollusc* OR gastropod* OR slug* OR snail* OR arthropod* OR chelicer* OR arachnid* OR aranea* OR acari OR tetranych* OR ixod* OR opilion* OR spider* OR *scorpio* OR tick$ OR mite$ OR harvestmen OR crustace* OR malostraca* OR isopod* OR woodlice OR oniscid* OR armadillium OR myriapod* OR chilopod* OR diplopod* OR pauropod* OR symphyla OR millipede* OR centipede* OR hexapod* OR collembol* OR springtail* OR insect$ OR blattodea OR *ptera OR mantodea OR odonata OR phasmatodea OR psocodea OR thysanura OR zygentoma OR psyllid* OR stenorrhyn* OR cockroach* OR beetle$ OR earwig* OR *fly OR *flies OR droso* OR mosquit* OR *bug$ OR aphid* OR adelgid* OR phyllox* OR *wasp$ OR (*bee OR *bees) OR (ant OR ants) OR mantis OR grasshopper* OR locust* OR cricket* OR louse OR lice OR flea$ OR moth$ OR thrip* OR silverfish ) NOT TI = (paleo* or $chiroptera*) 


	
#6 NOT #7 NOT TI = (marine* OR aquat* OR limno* OR water OR palaeo* OR $vertebra* OR *fish* OR $amphib* OR $salientia* OR $anura* OR $caudata OR $salamand* OR newt$ OR $gymnophion* OR frog$ OR tadpole$ OR toad$ OR $reptil* OR $crocodil* OR *sauria* OR $squamat* OR $lizard* OR $lacert* OR $gekko* OR $serpent* OR $snake* OR $testudin* OR $turtle* OR $tortois* OR $mammal* OR $rodent* OR $sciurid* OR $hamster* OR *mouse* OR *mice* OR $squirrel* OR $rabbit* OR $hare OR $hares OR $chiropt* OR $bat OR $bats OR $myotis OR $sorciomorpha OR $soricid* OR $talpid* OR $shrew* OR $marmot* OR $mole OR $moles OR $primat* OR $carnivora OR $ursid* OR $ursus OR $felid OR $felids OR "$sea lion" OR "$fur seal" OR "$elephant seal" OR $marsupi* OR $goat* OR $sheep* OR $deer OR $cattle OR estrus OR suprachiasm*OR microb* OR bacteria* OR fung* OR *ceae OR bloom OR yield OR germination OR molecular OR simulation OR QTL OR spring OR cell* OR tiller OR cultivar* OR bud* OR chill* OR (tree NEAR phenology)) 


	
#2 NOT #3 NOT SU = (zoology OR Environmental Sciences & Ecology OR Evolutionary Biology OR Science & Technology Other Topics OR Life Sciences Biomedicine Other Topics OR GENETICS HEREDITY OR BIODIVERSITY CONSERVATION OR SOIL SCIENCE ) AND SU = (AGRICULTURE OR PLANT SCIENCES OR FORESTRY OR FOOD SCIENCE TECHNOLOGY ) AND TI = (invertebrat* OR worm* OR annelid* OR platyhelminth* OR nematod* OR mollusc* OR gastropod* OR slug* OR snail* OR arthropod* OR chelicer* OR arachnid* OR aranea* OR acari OR tetranych* OR ixod* OR opilion* OR spider* OR *scorpio* OR tick$ OR mite$ OR harvestmen OR crustace* OR malostraca* OR isopod* OR woodlice OR oniscid* OR armadillium OR myriapod* OR chilopod* OR diplopod* OR pauropod* OR symphyla OR millipede* OR centipede* OR hexapod* OR collembol* OR springtail* OR insect$ OR blattodea OR *ptera OR mantodea OR odonata OR phasmatodea OR psocodea OR thysanura OR zygentoma OR psyllid* OR stenorrhyn* OR cockroach* OR beetle$ OR earwig* OR *fly OR *flies OR droso* OR mosquit* OR *bug$ OR aphid* OR adelgid* OR phyllox* OR *wasp$ OR (*bee OR *bees) OR (ant OR ants) OR mantis OR grasshopper* OR locust* OR cricket* OR louse OR lice OR flea$ OR moth$ OR thrip* OR silverfish ) NOT TI = (paleo* or $chiroptera*) 

#2 NOT #3 NOT SU = (zoology OR Environmental Sciences & Ecology OR Evolutionary Biology OR Science & Technology Other Topics OR Life Sciences Biomedicine Other Topics OR GENETICS HEREDITY OR BIODIVERSITY CONSERVATION OR SOIL SCIENCE OR AGRICULTURE OR PLANT SCIENCES OR FORESTRY OR FOOD SCIENCE TECHNOLOGY ) 

#1 OR #3 OR #4 OR #5 OR #7 OR #8 OR #9  2078 results
#8 needs tweaking (ecology, plant phenology removed)


#10 AND TI = (invertebrat* OR worm* OR annelid* OR platyhelminth* OR nematod* OR mollusc* OR gastropod* OR slug* OR snail* OR arthropod* OR chelicer* OR arachnid* OR aranea* OR acari OR tetranych* OR ixod* OR opilion* OR spider* OR *scorpio* OR tick$ OR mite$ OR harvestmen OR crustace* OR malostraca* OR isopod* OR woodlice OR oniscid* OR armadillium OR myriapod* OR chilopod* OR diplopod* OR pauropod* OR symphyla OR millipede* OR centipede* OR hexapod* OR collembol* OR springtail* OR insect$ OR blattodea OR *ptera OR mantodea OR odonata OR phasmatodea OR psocodea OR thysanura OR zygentoma OR psyllid* OR stenorrhyn* OR cockroach* OR beetle$ OR earwig* OR *fly OR *flies OR droso* OR mosquit* OR *bug$ OR aphid* OR adelgid* OR phyllox* OR *wasp$ OR (*bee OR *bees) OR (ant OR ants) OR mantis OR grasshopper* OR locust* OR cricket* OR louse OR lice OR flea$ OR moth$ OR thrip* OR silverfish ) NOT TI = (paleo* or $chiroptera*) 

add eclosion



#another one
(Ts =( (photoperiodic and (response or incidence or induction)) or ((hibern* or dormanc* or diapaus*)) or ("critical day length" or "critical day lengths")))

then everything as in #new
only that 14 is 
(#13 AND TI = (invertebrat* OR worm* OR annelid* OR platyhelminth* OR nematod* OR mollusc* OR gastropod* OR slug* OR snail* OR arthropod* OR chelicer* OR arachnid* OR aranea* OR acari OR tetranych* OR ixod* OR opilion* OR spider* OR *scorpio* OR tick$ OR mite$ OR harvestmen OR crustace* OR malostraca* OR isopod* OR woodlice OR oniscid* OR armadillium OR myriapod* OR chilopod* OR diplopod* OR pauropod* OR symphyla OR millipede* OR centipede* OR hexapod* OR collembol* OR springtail* OR insect$ OR blattodea OR *ptera OR mantodea OR odonata OR phasmatodea OR psocodea OR thysanura OR zygentoma OR psyllid* OR stenorrhyn* OR cockroach* OR beetle$ OR earwig* OR *fly OR *flies OR droso* OR mosquit* OR *bug$ OR aphid* OR adelgid* OR phyllox* OR *wasp$ OR (*bee OR *bees) OR (ant OR ants) OR mantis OR grasshopper* OR locust* OR cricket* OR louse OR lice OR flea$ OR moth$ OR thrip* OR silverfish ) NOT TI = (paleo* or $chiroptera*)) 
and 15
(#2 OR #7 OR #11 OR #12 OR #14) (9634, ~ 30 h, ~100 add data points)

###  literature search 9.10.2018  
searches on each species to find low temperature threshold that should induce autumn diapause. The general search was always:

TS = latin or common name
 #1 and TS = (diapause or (temperature and development))

Results

ts= ((laodelphax striatellus ) OR (small brown planthopper)) 514
 #1 AND TS = (diapause or (temperature and development)) 16

Ts= ((Diatraea AND grandiosella) OR (southwestern corn borer)) 424 ->60

TS = (Drosophila and auraria) 124 -> 11

ts= (Drosophila and triauraria) 42 ->30

TS = ((Sericinus montel*) OR (dragon swallowtail)) 8

Ti= ((tetranychus AND urticae) OR ((red OR (two and spotted)) and spider and mite)) 1638 ->124

TI = (aedes albopictus) 1981->102
	
TS = Drosophila montana - 133->18
	
TS = tetranychus pueraricola 18 ->4

 ((Aedes OR ochlerotatus) and triseriatus) 761 ->48
TS= ((psacothea hilaris) OR (Yellow spotted longicorn beetle)) 99->28

TS = Orius sauteri 92 ->31

	
TS= ((papilio glaucus) OR (eastern tiger swallowtail)) 188->37
TS= chymomyza costata 59->47

	
TS= nasonia vitripennis  815->52

TS= ((chrysopa AND ( oculata OR albicornis OR conspersa OR mexicana)) OR (golden eyed lacewing))  47->7
TS = ((nezara viridula) OR ( southern green AND (stink OR shield) bug)) 855->64
TS= asobara japonica 39->1
TI= ((Rhopalosiphum padi) OR (Bird cherry oat aphid))  449->17
TS= drosophila littoralis  269->22
TI= ((leptinotarsa decemlineata) OR (colorado potato beetle)) 1544->139
TS= bruchidius dorsalis 24->6
TS= drosophila subauraria 7->6
TS= ((pieris rapae) OR (small cabbage white)) 1410->45
TS= ((Hyphantria cunea) OR (fall webworm)) 402->40
TI= (Bollworm OR (Helicoverpa armigera)) 3033->172
