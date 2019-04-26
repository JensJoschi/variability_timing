
# Description of this file  
This file consists of the methods section from the manuscript draft. This section is updated only sporadically and may be outdated. Methods that were abandoned are in a separate script (unused.md).


# Summary    

Global change alters season onset due to rises in mean temperature and temperature variability, and whether species can persist will critically depend on the evolability of phenological strategies. The most commonly researched phenologcial strategies are adaptation of mean timing and plasticity in timing. Bet-hedging, the avoidance of fitness variance, is at least as important in a climate with decreased predictability, yet comprehensive studies that include means, plasticity and bet-hedging are missing. We recently established a framework to describe evolutionary strategies as a 3-dimensional continuum along the axis of arithmetic mean optimization vs conservative bet-hedging, fixed vs. variable development, and phenotypic plasticity versus bet-hedging. These strategies can be defined by reaction norm properties, namely by their mean, the variance allocation within and among environments, and the total phenotypic variance.  We predicted that the choice along this three-dimensional continuum of strategies depends on environmental predictability, amplitude of environmental change, and on the mean environment.
We conducted a meta-analysis on 58 studies of insect diapause and extracted 433 logistic reaction norms, and correlated means and variance components with climate parameters. Three patterns emerged: First, mean diapause correlated with mean winter onset. Secondly, very few reaction norms were canalized, likely caused by strong study bias towards non-canalized genotypes. Thirdly, bet-hedging was rare and correlated only weakly with environmental predictability. Genotypes are thus most vulnerable to decreases in climate predictability.



# Methods  

## 1. Overview

We used climate station data to calculate mean winter onset for 25,340 locations. We then calculated winter predictability with three methods: First, we calculated the standard deviation in winter onset. This served as estimate of the reliability of day length as cue. Secondly, we estimated reliability of preceding autumn temperatures. For this we regressed temperatures of the last 30 days before winter onset for each year and calculated the between-years standard deviation of the slope. Thirdly, we determined the "colour of environmental noise" (Vasseur & Yodzis 2004), that is, the relative extent of long-frequency autocorrelations in temperatures.  
We then extracted photoperiodic response curves from 57 published studies (447 diapause reaction norms) along with their sampling locations. In these studies multiple populations of a species have been subjected to several day length conditions in climate chambers, and the percentage of diapausing individuals under each day length was reported. To reconstruct continuous reaction norms from this discontinuous data, we applied a Markov chain Monte Carlo algorithm to estimate lower and upper limit, inflection point and slope. Based on these parameters we calculated mean diapause timing, degree of canalization and variance composition, and correlated them with the climate variables.

## 2. climate data  
### 2.1. data preparation  
We used land surface temperature data from the Global Historical Climatology Network (GHCN-Daily) (Menne et al. 2012a, b). We extracted daily minimum and maximum temperatures from all climate stations (~12.6 million months with data, ~34,000 stations). We removed all days with incomplete data (either minimum or maximum temperature not recorded), all years in which more than half of the data points was missing, all stations that covered less than 3 years of data, and all stations from the southern hemisphere. This procedure left 10,991,727 months (3-244 years) in 26,804 climate stations. We then calculated the average of daily maximum and daily minimum temperature for each station to estimate daily mean temperature. 

### 2.2. winter onset and day length predictability  
To estimate winter onset in each year and station, we identified cold days with average temperatures below 10Â°C. We then determined winter onset as the fifth cold day after midsummer. Years in which winter did not arrive according to this definition were excluded, and stations with less than 3 years with winter onset removed. We calculated a weighted mean winter onset and a frequency weighed standard deviation of winter onset to account for differences in reliability across years. We obtained 25,340 estimates of mean winter onset, day length at winter onset and winter predictability in the northern hemisphere.

### 2.3 temperature predictability  
To calculate the predictability of winter based on preceding temperatures, we used the temperature recordings of the last 30 days before winter onset of each year. Years with less than 10 temperature recordings in the month preceding winter were excluded. We regressed daily mean temperature over time with a linear model, and recorded the slope estimate of each year. The slope of this regression describes the pace of seasonal change, and the between-years standard deviation of the slope determines whether the rate of change is consistent (predictable) across years. In total there were 25,136 estimates of predictability based on this method.  

As another method to calculate climate predictability, we calculated the â€œcolour of noiseâ€, based on the degree of long-frequency autocorrelation in the temperature data (Vasseur & Yodzis 2004). Randomly fluctuating (white-noise) environments can be defined as time series with no temporal autocorrelation, so preceding temperatures of any gap length (e.g. 1 day or 1 week earlier) have equally low explanatory power. In predictable (â€œred-noiseâ€) environments, on the other hand, the explanatory power depends on gap lengths, and this can be demonstrated by decomposing the time series with a Fourier transform, and estimating the influence of each frequency. We hence produced power spectral density plots for all stations (daily temperatures of multiple years). First, we detrended the data by substracting from each daily temperature estimate its station-wide mean. Missing values were replaced by linear interpolation. We then calculated the spectral density within the frequency range of 1/366 and 1/(2 months) with the function spectrum, using a standard smoothing algorithm (pgram), and estimated beta as the negative of the slope of log10(spectral density)~log10(frequency). Beta was only calculated if there were at least five frequency estimates. In total there were x estimates of beta, but only y estimates were based on 25 or more years of data and subsequently used.


### 2.4 Sensitivity of climate predictions to temperature threshold  
Arthropod thermal requirements vary among species, and our use of a 10Â°C temperature threshold was an arbitrary decision. It resulted in a global median winter onset around Oct 11, which is within the range of commonly reported phenological windows and threshold values (Halkett et al. 2004; Waldock et al. 2013). We systematically varied the temperature threshold between 5 and 15Â°C, and the number of days below this threshold between 1 and 10 days. 
## 3. Empirical data  

### 3.1 Rationale  
Our aim of the meta-analytic approach was to extract diapause reaction norms and quantify their position on the three axes mean, phenotypic variance and variance composition. We therefore searched for photoperiodic response curves (probability of induction vs. day length) from published studies. We used this data to reconstruct reaction norm shapes and calculated the variance components. Mean, phenotypic variance and variance composition were then correlated with climate parameters.


### 3.2. Eligibility criteria  
In our literature search for diapause reaction norms we concentrated on studies that measure photoperiodic response curves of arthropods. We excluded marine and intertidal organisms, because corresponding climate estimates were only available for terrestrial systems. Invertebrates with a larval stage in shallow water (e.g. mosquitoes) were nevertheless included. Studies with estimates for fewer than 3 populations were excluded, because in these cases the variance would be absorbed by the random term “study” which was included in the analysis. We also excluded all studies that measured diapause at less than four photoperiods. To maximize sample sizes, we did not restrict our analysis to any geographic location or publication language.

### 3.3. Search strategy    
We conducted two independent literature searches in the Web of Science core collection. First (26.11.2018) we limited the search terms to: 

TS = ((photoperiodic AND (geogr\* OR range)) OR (photoperiod\* AND latitud\*) OR (photoperiod\* AND longitud\*))

Secondly (28.11.2018), we used a wider range of search terms,

TS = (("day length" OR photoperiod\* OR diapaus\* OR hibern\* OR dorman\*) AND (geogr\* OR "range" OR latitud\* OR longitud\* OR cline$ OR clinal))

but filtered the output by arthropod-related terminology (Supplementary material S1). We found 1683 references in the first search, of which we judged 278 potentially relevant, and 57 met all eligibility criteria. In the second search we found further 2362 references (6179 before filtering), with 355 potentially relevant and 13 eligible articles. We did a forward-citation search on the 70 eligible articles of both searches on 4.12.2018 and found 790 new references, which included 117 potential and 4 eligible articles. A second forward-citation search on these four articles on 5.12.2018 brought 118 new articles, but none were relevant. One further article was found to be wrongly tagged as negative after the search was closed. Altogether there were 75 useful references (623 populations).  

### 3.4. Inclusion criteria  
12 articles (147 populations) were excluded because they were not accompanied by raw data, tables or figures that allowed further analysis, and the authors were deceased, did no longer have the raw data or did not respond to our emails. We further removed six articles (26 populations) that were otherwise not usable . From the remaining 57 studies we removed 43 further individual populations with less than three day length measurements, and five populations from the southern hemisphere, so 402 populations remained. Because some studies reported reaction norms for multiple lines from the same population, there were 447 reaction norms available, and these 447 reaction norms consisted of 3035 individual data points.

### 3.5. Data extraction  
The reaction norms in 49 of the 57 studies were presented as figures. In these cases we saved the figure and extracted the data with WebPlotDigitizer Version 3.12 (Rohatgi 2017). Where neccessary, the day length was then rounded or corrected to match the description in materials and methods of the respective study. Y-values  that were slightly above 100% or below 0% were set to 100% and 0% respectively.

Detailed information on numbers of individuals per day length estimate were rarely available (97 reaction norms), as numbers were either given as population-level means (26 reaction norms), as global average or range (291 reaction norms), or missed entirely (33 reaction norms). We wish to emphasize that a lack of detailed information should not be confused with an unweighted (“vote-count”) meta-analysis, because the sample size (day lengths per population) was always known. Rather, the missing information occurred on a lower level (points within population) than the level of replication (population). Where the data was provided, we recorded it for later weighing of the data points.


### 3.6. Effect size calculation  		
Insect diapause timing generally follows a logit-curve, which can be specified via four parameters:

p(x)=c+((d-c)  )/(1+exp^((b\*(x-e)))) 							(eq. 1)

In this equation p(x) is the frequency of diapausing individuals under day length x. e influences the inflection point of the curve, and hence directly represents the axis mean. c and d indicate the lower and upper diapause threshold, and b is the slope of the curve. To estimate the variance composition, we calculated variance between and among environments. The variance within each environment is that of a Bernoulli draw: px \* (1-px). Because multiple p were estimated along an environmental gradient (day length treatments), we define the variance within environments as: 

s_within^2 = sum(px \* (1- px))/n ;	n = number of day length treatments		(eq. 2) 

s_within^2 constitutes a potential diversified bet-hedging trait, and is maximized by a flat reaction norm at the 0.5 level. 
We define the variance among treatments as the squared standard deviation,

s_among^2 = sum((px -px_mean)^2) / n 						(eq.3)

This component may represent phenotypic plasticity and is maximized by a steep reaction norm. The relative contribution of variance among environments can then be defined as the ratio of the two components: 

r=  (s_among^2)/(s_among^2+ s_within^2 ) 							(eq. 4)

Lastly, phenotypic variance describes the magnitude of phenotypic variation, and can be regarded the sum of the two variance components,

s= s_among^2+ s_within^2						(eq. 5)

Phenotypic variance is zero for flat reaction norms at the 0 % level, and increases as the phenotype move away from 0% in some (s_among^2) or all (s_within^2) environments.

To derive midpoints and variance components along with a measure of reliability, we modelled each reaction norm as logistic curve according to eq. 1. Due to the data scarcity (on average seven data points per reaction norm), standard non-linear regression techniques did not always yield reasonable estimates, for example the slope could not be estimated when there was only one data point present on the sloped part of the reaction norm. Nevertheless, the range of the possible parameter space can be estimated with Markov chain Monte Carlo methods . We thus estimated the 4-dimensional credible parameter space and calculated the variance components based on this parameter space.


### 3.6.1 MCMC specifications  
We used rjags () to run Markov chain simulations on each of the 447 reaction norms. We ran 4 replicate chains with lengths of 11,000 iterations and discarded a burn-in of 1,000 iterations.  We specified our model with (eq. 1), and consequently chose the binomial density function to estimate the likelihood. If specified in the primary study, we used the sample sizes of each day length treatment as number of trials, otherwise we used the global average of the study (see section 3.4). For those studies that did not mention sample sizes, we used a global average of 100 trials for each of the data points. We implemented uninformative priors for all four parameters. These were:

b ~ unif {-100, 100}
c ~ unif {0, 1}
d ~ unif {c, 1}
e ~ unif {Dmin,Dmax}, with Dmin and Dmax being the range of applied day length treatments. 

The upper limit of the logit-function was constrained to be higher than the lower limit, because otherwise switching between the two equal solutions (positive slope, d > c and negative slope, c < d) would render the chain unidentifiable. Despite the relative data scarcity, the four replicate Marcov chains mixed well in nearly all cases, providing a well-defined frequency distribution (Supp S2).

### 3.6.2 Calculation of variance components  
This MCMC algorithm provided a 4-dimensional parameter space to define continuous reaction norms, and we calculated the variance components of those curves that fall within the credible intervals. To do so, we followed the trace of the MCMC algorithm. For each iteration step we sampled 1000 equally spaced day lengths around the proposed inflection point e ± 6 hours, and performed the variance calculations (eq. 2-5) on the proposed parameters b,c,d and e. Following the logic of the MCMC algorithm, we reported the 0.025 and 0.97.5 quantiles of the resulting frequency distribution as credible intervals. 

### 3.6.3 Merging with climate data  
To combine climate data and study site locations, we averaged the climate estimates from the 5 closest stations within a 5° radius (weighted by 1/euclidian distance). When the coordinates were not directly provided in the study, we used the coordinates of the quoted town or area. Town and area coordinates were made available by the WikiProject Geographical coordinates (https://en.wikipedia.org/wiki/Wikipedia:WikiProject_Geographical_coordinates) and the Geohack tool (https://www.mediawiki.org/wiki/GeoHack). 12 populations did not have any climate station nearby and were only used for correlations with latitude (see below), but not in any further analysis.

We converted the inflection point into julian days, by using the reported latitude of the sampling location and the daylength function from the package geosphere (Hijmans 2017). For 25 reaction norms the midpoint was at daylengths that do not naturally occur at the latitude at which the populations were sampled (21 were longer than midsummer days, 4 shorter than midwinter days). For these reaction norms we assumed that diapause induction occurs at midsummer and midwinter, respectively. Similarly, the credible intervals of 62 reaction norms crossed unrealistic values (47 midsummer, 9 midwinter, 6 both) and were truncated to midsummer and midwinter. In the analysis we refer to the unconverted inflection point as critical photoperiod, and to the converted inflection point as mean diapause timing. 


## 4. analysis  
We used linear mixed-effects models with a nested random structure (package metafor) to correlate the reaction norm properties with climate variables. As random terms we nested populations in species in order, ignoring both study ID and genus. Study ID was disregarded because most species were only represented by a single study, and those species that were represented by multiple studies usually contained the same first or lead authors (Table 1). Genus was disregarded because there were either only very few genera per order available (e.g. Diptera), or all species within an order were placed in different genera (Lepidoptera, Table 1). We weighed the reaction norm estimates by the reverse of the variance (credible interval ranges, divided by 2\*1.96 and squared), but truncated the intervals to prevent some estimates from obtaining nearly infinite weight. 

We performed the following models (credible interval lower limit truncation in brackets):  
0. Critical photoperiod was correlated with latitude  (10 minutes)  
1. Mean diapause timing was correlated with mean winter onset (1 week)  
2.  * The ratio of the variances (e.q. 4) was correlated with day length predictability (5%)  
    * The ratio of the variances (e.q. 4) was correlated with temperature predictability (5%)  
3. the residuals of model 1 were correlated with the residuals of models 3a and 3b.  
For all models we report an extension of marginal and conditional R² values (Nakagawa & Schielzeth 2014, MuMin), likelihood ratio test statistics and differences in AIC.

