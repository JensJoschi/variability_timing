
# Summary

Many organisms escape the adverse conditions of winter by a diapause response. Optimizing fitness by diapause is, however, challenging in stochastic environments. When winter onset is variable across years, a simple response to mean winter onset will produce suboptimal phenotypes in most years. Predicting winter onset via a reliable cue (phenotypic plasticity) may alleviate fitness constraints, but when winter onset is both variable and unpredictable, the best strategy is possibly to decrease fitness variance by spreading the risk, and investing in phenotypes with different diapause thresholds (diversified bet-hedging). Hence we expected that variability in diapause timing is determined by an interaction of environmental variability and predictability. 
We tested this hypothesis with a meta-analysis. First, we calculated winter variability (between-years standard deviation in winter onset) and predictability (“colour” of environmental noise, determined by power spectral density estimation) based on climate station data. To correlate environmental variability and predictability with physiological variability, we then searched for publications that study photoperiodic reaction norms of insects at more than two sites. The slopes in the reaction norms determine the temporal spread of diapause and hence provide an approximation of diapause variability. We correlated the slope estimates from 30 studies (x populations) with environmental variability and predictability.  
As expected, populations from northern latitudes shift their timing towards earlier diapause, progressing with approximately 50 minutes per 5 degrees latitude.  This shift in diapause correlated well with the latitudinal cline in winter onset (and associated changes in photoperiod) from the climate data. The analysis of slope ~ predictability * variability is not finished yet.



# Introduction

Timing is an important component of ecology. Diurnal and seasonal timing regulate individual fitness (Vaze & Sharma, 2013), interactions among individuals  (Poesel et al., 2006; Greives et al., 2015) species interactions (Wier et al., 2010; Ximenez-Embun et al., 2014; Martinez-Bakker & Helm, 2015; Mahendiran, 2016) and biogeography (Anderson & Walter, 2005; Dunbar & Shi, 2012). Being such an important trait, a whole research field (chronobiology) is dedicated to timing mechanisms. The field is traditionally multidisciplinary, and while many experiments are directed at physiology, there are close ties to ecology and evolution  (Marques & Waterhouse, 2004; Kronfeld-Schor et al., 2013). Despite being a great source of data with ecological relevance, ecolgists have been reluctant to incorporate chronobiological aspects, possibly due to the differences in terms and methodology (Visser et al., 2010). For example, many chronobiological studies envision timing as a trait that has a single optimum, and deviations from this optimum are regarded as maladaptive noise. This is in contrast to typical ecological approaches which attempt to explain individual variance by various ecological factors. The field of chronobiology has recently progressed to incorporate the adaptive value of individual heterogeneity and plasticity, and this shift in paradigms provides plenty of opportunitiest to refine the views on classically ecological questions (Helm et al., 2017). Nevertheless, the vast resources of chronobiological data remain nearly untapped.  	

Biological timekeeping is mostly about coping with the cyclically changing environment  (though further reasons for timekeeping exist, e.g. compass orientation and task partitioning; Paranjpe & Kumar Sharma, 2005), and hence tightly related to the ability of organisms ro react to change.  It is therefore not surprising that various forms of phenotypic plasticity (entrainment, masking) are key concepts in research on timing (Moore-Ede). Plasticity is clearly an important strategy to cope with change that is not on the scale of microevolutionary responses (Gienapp et al., 2008), but it is not the only mechanism to deal with environmental variability (Scheiner, interactions with dev instab.). A key limitation of phenotpyic plasticity is that it requires predictions about the environment, i.e. a tight correlation of an environmental signal and environmental change (Scheiner, 1993). This important limitation of plasticity has so far not been reckognized in chronobiology , because astronomical cycles are thought to provide reliable information about the change in environmental conditions.   

While diurnal change of day and night or the seasonal change in day length is indeed stable and perfectly predictable, other abiotic factors such as humidity and temperature are less strongly correlated to the astronomical cycles. This causes some fitness-relevant traits such as timing of first frost to vary between years with little predictability. Under such conditions with high fitness variance the best strategy to increase long-term (geometric mean) fitness is not necessarily the one that yields the highest arithmetic mean fitness, but may be one that minimizes the variance term (Starrfelt & Kokko, 2012) (Cohen, 1966). Strategies that reduce fitness variance at the cost of arithmetic mean fitness are called bet-hedging. Bet-hedgers may reduce between-years variance by either avoiding any risk (conservative bet-hedging), or by spreading the risk among the offspring and investing in a range of phenotypes (diversified bet-hedging). 

Phenotypic plasticity and bet-hedging complement each other, because environments are generally neither perfectly predictable, nor perfectly unpredictable and an optimal strategy should strike a balance between plasticity and bet-hedging (Donaldson-Matasci et al., 2013; Grantham et al., 2016). Indeed, a mixed strategy of plasticity and bet-hedging can exist (Furness et al., 2015), and the two strategies may trade off against each other (Simons, 2014). We therefore hypothesized that among-individual variance in seasonal timing increases both with increasing variability and decreasing predictability of the environment. We adressed this question with a meta-analysis over a range of physiological studies on insect diapause. Multiple studies have recorded photoperiodic response curves (PRC) of insects along a latitudinal gradient, either to demonstrate the adaptive value of timing mechanisms (e.g. bradshaw) or to infer relations of circadian system and photoperiodism (e.g. veerman?). PRCs are reaction norms to photic cues, and usually follow a logit-function e.g. (Urbanski et al., 2012; Muona & Lumme, 2017) . There is a range of day lengths at which diapause is probabilistic among one mother’s offspring (Fig. 1A), and we argue that the slope of such a PRC acts as bet-hedging trait, because a flat slope allows mixing offspring types over a wider range of environmental conditions. Therefore variation in slope estimates among populations should be explained by variation in environmental variability and predictability. 



# Methods


We used the GHCN-Daily dataset (Menne et al., 2012), version 3.22 which includes weather station data from throughout the world (Menne et al., 2018) and calculated variability and predictability of winter onset at each location. We then extracted photoperiodic response curves from 30 published studies (?~150populations) along with their sampling locations, and estimated the slopes of these curves. Winter variability/predictability and slope estimates were then correlated.

 
## 1. climate data

### 1.1 overview

We used the mean of daily minimum and maximum temperatures to calculate daily average temperatures of ~5-50 years for each station. We then calculated winter onset in each year as the day on which temperatures falls below x °C for the yth time (starting the "year" in midsummer), and used standard devitation among years to estimate winter variability. To calculate winter predictability, we calculated the slope of temperatures of the last 30 days before winter onset, and used the between-years standard deviation in that slope. As a second estimate of predictability we then calculated the "colour of noise" according to (Vasseur), i.e. the slope coefficient in a power spectral density plot.

### 1.2. data preparation

We used two Perl scripts to read the GHCN daily dataset file by file and extract daily minimum and maximum temperatures from all climate stations (~12 million stations*months). The script removed all data flags, and saved the output in delimited format (using | as delimiter). All further analysis was conducted in R. We removed all incomplete cases (either minimum or maximum temperature not recorded), all stations with less than 18 months of data, and all stations from the southern hemisphere. We then calculated the average of daily maximum and daily minimum temperature to obtain an estimate of daily mean temperature. This procedure left data for 11,715,375 months in  28,963 climate stations. We removed all years in each station in which more than half of the data points was missing, and all stations that cover less than 3 years of data. 

### 1.2. winter variability
Starting from midsummer in each year and station, we counted the number of days where the temperature fell below a certain threshold x. Winter was assumed to arrive when x was reached for the yth time. We used four such parameter combinations (x=10,y=50; x=5,y=20; x=20,y=100; x= 5,y =0; all in decimal degrees) in different runs. Years in which winter did not arrive according to this definition were excluded, and stations with less than 3 occurences of winter were removed from analysis. Based on these data we calculated mean winter onset and standard deviation of winter onset for each station. Across all stations with recorded winter onsets, 80 % of the years had more than 350 days with data, and 87.5% had more than 300 days with data (check whether numbers changed)xxx. Nevertheless, we calculated a weighted mean winter onset and a frequency weighed standard deviation of winter onset to account for differences in reliability. We obtained x estimates of winter onset and y estimates of winter variability in the northern hemisphere.





### 1.3 winter predictability

To calculate the predictability of winter based on preceding temperatures, we used the temperature recordings of the last 30 days before winter onset of each year. Years with less than 10 temperature recordings in the month preceding winter were excluded. We regressed daily mean temperature over time with a linear model, and recorded the slope estimate of each year. The standard deviation in slopes was then used as predictability estimate. In total there were x estimates of predictability based on this method.  

As another method to calculate climate predictability, we adopted the approach of Vasseur ().  Taking all temperature information from one station (daily temperatures of multiple years), we calculated the power spectral density. First, we removed the seasonal trend by substracting from each daily temperature estimate the station-wide mean temperature of that day. Missing values were replaced by linear interpolation. We then calculated the spectral density within the frequency range of 1/366 and 1/(2 months) with the function spectrum, using the method "pgram", and estimated beta as the negative of the slope of log10(spectral density)~log10(frequency). Beta was only calculated if there were at least five frequency estimates. In total there were x estimates of beta, but only y estimates were based on 25 or more years of data and subsequently used.


## 2. empirical data

We extracted photoperiodic response curves from published studies, calculated four-parameter dose-response curves (or simplified versions of this, see 2.4) to obtain estimates of lower and upper diapause limit, critical day length (inflection point of logit-curve) and slope of the curves, and correlated the slope estimates with environmental parameters. 

### 2.1 Eligibility criteria
We concentrated on studies that measure PRCs of invertebrates. We excluded marine and intertidal organisms, because the climate estimates apply only to terrestrial systems. Invertebrates with a larval stage in shallow water (e.g. mosquitoes) were nevertheless included. Studies with estimates for less than 3 populations were excluded, because the inclusion of “study” as random term in the analysis diminishes the return (in degrees of freedom) for smaller studies. We also excluded all studies that measured diapause at three or fewer photoperiods, and all studies with less than 2 estimates on the sloped part of the population’s PRC, because such studies would not allow for a meaningful slope estimate by dose-response curve analysis. 
To maximize sample sizes, we did not restrict our analysis to any geographic location or publication language. We restricted our search, however, to publications after 1965, because earlier publications (usually in russian language) were difficult to obtain, and those which we obtained (figures in danilevskii) reported only estimates for few populations, and with too few data points to be included in analysis.  

### 2.2. search method
We searched the web of science database for "(photoperiodic AND (geogr* OR range)) OR (photoperiod* AND latitud*) OR(photoperiod* AND longitud*)" on 19.2.2018. This search yielded 1627 unique  results. We added a few further articles to the study that did not match the keywords (total: 1641). We classified the studies as plant/animal, Vertebrate/invertebrate, and water/terrestrial based on journal titles (based on journal names including e.g. “plant”, “ento*”, “fish” or “bird”), manuscript titles, abstract or full text.  (x studies) Concentrated on terrestrial invertebrates. We screened the full text to determine whether PRCs were recorded, and if so, how many photoperiods and populations were measured. We selected all studies with PRC estimates of more than 2 populations and 2 photoperiods (61 studies) for a forward-citation search on April 3rd 2018. We found 762 further articles, 11 of which were included for another forward-search. A forward search on these 11 articles on April 12th (94 new citations) brought 1 new study, and following its 20 citations on April 16th yielded another article. Its 14 citations (April 16th) yielded no further article. 
In addition to this literature search, we contacted (x) authors for unpublished material (x studies), and reviewed the data in Danilevskii 1965 (y studies). 
After applying the strict criteria described in 2.1 on all potentially eligible studies, 30 studies with x populations remained for inclusion.


### 2.3 Raw data extraction

For all studies that were included, we noted study species, sample sizes and coordinates (if available), and saved the PRCs as .png files. We then extracted the data from the figures using WebPlotDigitizer Version 3.12 (Rohatgi, 2017). When raw data was avaiulable (x % of all cases) we used this data to test the error rate of manual extraction (todo, but small according to initial tests). Where neccessary, the day length was then rounded or corrected to match the description in materials and methods of the respective study. For example the points on the x-axis were in some cases not continous as the axis would suggest (e.g. x-axis in (Paolucci et al., 2013) mixes 1h intervals with 2h intervals), or points were plotted next to each other for better visibility  (Riihimaa Ari et al., 2004). Y-values that were slightly above 100% or below 0% were set to 100% and 0% respectively. in one figure of (Urbanski et al., 2012), 1 data point that appeared in the figure but did not exist in the available raw data was deleted.


### 2.4. Effect size calculation

To estimate the slopes we modelled diapause with binomial dose response curves in R. This analysis provides lower and upper bounds of photoperiodic induction (we constrained these to range from 0 to 100%), the slope, and the inflection point where 50 % of the individuals are induced (critical day length), so up to four parameters per slope were estimated. We expected that all populations of one species have the same lower and upper limit, which reduces the estimation to 2 parameters per slope, plus 2 global parameters. We also applied the alternative models with only one or no fixed global parameters, so the following models were applied on each study (sorted by plausibility): 

1. upper and lower parameter fixed at study mean (requires 2 df plus 2 df per population)
2. upper parameter fixed (requires 1 df plus 3 per population)
3. lower parameter fixed (requires 1 df plus 3 per population)
4. both limits vary (requires 4 df per population)

Model 2 may results from conservative bet-hedging (some populations have non-zero diapause regardless of season, to hedge against early winter), while model 3 is the risk-prone opposite (some non-diapausing offspring exist even late in the season to hope for late winter, see halkett et al 2004).

All analyses were conducted on the 30 studies where the slopes could be reliably estimated, i.e. with at least 2 points on the slope part (this could include the highest point of one population if that was still below a study-wide upper limit). We fitted all models, provided there were at least 3 residual df left, and chose those with lowest AIC. If there were multiple models with an AIC difference less than 2, we used the most plausible model. If necessary for model convergence, we removed the box constraints (diapause ranging between 0 and 100%), provided the resulting estimates were reasonable (e.g. lower limit = -0.02%, or s.e. of estimte going slightly over the limit).
Where detailed information on sample sizes was available (% of all cases), we weighted diapause estimates by number of trials. We also recorded the standard error, using a robust sandwich estimation method (Zeileis, 2006).
When the coordinates were not directly provided in the study, we used the coordinates of the quoted town or area. Town and area coordinates were made available by the WikiProject Geographical coordinates and the Geohack tool (Dispenser et al., 2018). 




## 3) Statistical analysis

### 3.1. correlation of CDL and latitude/mean winter onset
### 3.2. correlation of slope with predictability and variablity
	slope ~ sd_slopes * sd_winter + 1|study/species, weights = 1/se
### 3.3. exploratory analyses
slope ~ beta * sd_winter + 1|study/species, weights = 1/se
subsets by family

## 4. Further information
I used Perl version 5.22.1, and R version 3.4.4 (R Core Team, 2018). The data was manipulated with the packages textreadr, Rcurl, data.table (Dowle & Srinivasan, 2017; Rinker, 2017; Duncan Temple Lang and the CRAN team, 2018) and the tidyverse packages  (Wickham, 2017) readr, tidyr, dplyr, stringr and magrittr (Wickahm; Bache & Wickham, 2014; Wickham, Francois, et al., 2017; Wickham, Hester, et al., 2017; Wickham & Henry, 2018). To interpolate between climate stations I used the package geomapdata (Lees,s. 2012).  The data from the empirical studies was extracted with WebPlotDigitizer version 3.12 (Rohatgi, 2017).
The dose-response curve analyses were made with the package drc (Ritz et al., 2015) , its standard errors were computed with the packages sandwich (Zeileis, 2006) and lmtest (Zeileis & Hothorn, 2002), and the correlation of variability and slope estimates was computed with package lme4 (Bates et al., 2007).
The history of this research project (including a full description of all tests and approaches) can be found at github.com/Jensjoschi/variabilitytiming. 
Results


# Diskussion (or rather, text blocks that could be included somewhere)
 Moreover, biological time-keeping is frequently not perfectly temperature-compensated (that is, time measuring depends partly on temperature; (Lamb & Pointing, 1972), so organisms can adapt their timing in warmer years.

The arrival of winter is variable and hence difficult to predict, which should favour bet-hedging responses (Halkett et al., 2004). I thus assume that the width of the range with random offspring determination, i.e. the slope of the photoperiodic response curve, can serve as bet-hedging trait to cope with variability in winter onset. Moreover, as the timing is partially adjusted via phenotypic plasticity, organisms in relatively predictable environments should have less need to rely on bet-hedging, and are expected to have a steeper slope regardless of environmental variability.  

Providing empirical evidence for bet-hedging is a challenge, as one would have to demonstrate that variability is not random noise but has long-term fitness consequences. One reasonably good line of evidence would be to demonstrate a covariation of environmental and physiological variability (Simons, 2011) across genotypes. We hence conducted a meta-analysis. First we derived photoperiodic response curves from 350 populations from over 60 published studies. Secondly, we calculated variability and predictability of winter onset, using a network of 30,000 climate stations. Thirdly, we correlated the slope of the PRCs with environmental variability and predictability.

It is therefore not surprising that the ability to track environmental change (called entrainment) is one of the three criteria that classically constitue the definition of a circadian rhythm (citation herexxx).  The ecological/evolutionary equivalent of this concept is phenotypic plasticity, the ability of one genotype to produce several phenotypes. Phenotypic plasticity is one of the strategies to cope with change that is not on the scale of microevolutionary responses (Gienapp et al., 2008), and it has important evolutionary consequences, as it drives long-term genotypic change (Price et al., 2003) and contributes to evolution and speciation (Bradshaw, 1965; Laland et al., 2015)()P . Plasticity may, however, be associated with significant costs and constrains (DeWitt et al., 1998; Murren et al., 2015). In particular, only predictable change that is correlated to a reliable signal can be tackled with phenotypic plasticity (Scheiner, 1993). This important limitation of plasticity has so far not been reckognized in chronobiology , because astronomical cycles are thought to provide reliable information about the change in environmental conditions.   
The relationship among bet-hedging and (partial) predictability can be illustrated by a refined view of a reaction norm (Fig. 1). A phenotypic reaction norm sees the phenotype as function of some environmental state.  In the easiest case of two discrete polyphenisms, the change in phenotypes can be approximated by a logit-curve. Actually, the environment is rarely sampled directly, so the reaction norm should be a (phenotype~cue) function, with a cue that is correlated to the environmental state.
An imperfect correlation of cue and environment is particularly problematic for logit-functions: If the position on the x-axis(environmental state) is not determined correctly, the phenotype is easily mismatched. Centering the logit-curve around the cue that is on average equal to  the environmental switch-point will yield the highest arithmetic mean fitness, but it ignores fitness variance (the phenotype will often be mismatched). In principle, there are two strategies to increase geometric mean fitness. First, one could rely on other cues to increase the correlation of the (compound) cue and the environment. This option may, however, not always be available. A second strategy to increase geometric mean fitness is to make the phenotype-cue curve less steep: Only a fraction of each phenotype is expressed along a larger range of environments, so at least some phenotypes will match with the environment. This increases the number of mismatched phenotypes and hence reduces arithmetic mean fitness, but also reduces fitness correlations among the offspring and thus may increase geometric mean fitness – We call this diversified bet-hedging. If the two environments are unequal (1 harsh, 1 good), it may also be an alternative to shift along the x-axis, so that the harsh-environment phenotype (e.g. diapausing stages or seed dormancy) occurs more often than it should on average. This reduces mean fitness but also fitness variance (conservative bet-hedging). Phrased like this, bet-hedging can be defined as the shape of the reaction norm. 

Fig 1: illustration of bet-hedging as attribute of phenotypic reaction norms. A) logistic phenotypic reaction norm, as is common for two-state polyphenisms. An organisms relies on a cue to switch between two states. Red: organism with a flat slope in reaction norm. Need to work on visualisation.
B) fitness of organism with steep (black) and flat (red) slope in stable and fluctuating environments. All ofspring of the non-hedging (black) population have the same fitness, because they switch synchronously when environments change. This causes the line to go extinct when facing a “bad” year. The offspring of the bet-hedging lines differ in fitness, depending on the amount of mismatch with the environment. This causes lower fitness in stable environments, but also lower fitness variance in fluctuating conditions. 


### Risk of bias

# References

Anderson KJ & Walter J (2005) The broad‐scale ecology of energy expenditure of endotherms. Ecology Letters 8:310–318. 

Bache SM & Wickham H (2014) magrittr: A Forward-Pipe Operator for R. 

Bates D, Mächler M, Bolker B & Walker S (2007) Fitting Linear Mixed-Effects Models Using lme4. Journal of Statistical Software 67.

Beer K, Joschinski J, Sastre AA, Krauss J & Helfrich-Förster C (2017) A damping circadian clock drives weak oscillations in metabolism and locomotor activity of aphids ( Acyrthosiphon pisum ). Scientific Reports 7:14906.

Bradshaw AD (1965) Evolutionary Significance of Phenotypic Plasticity in Plants (EW Caspari & JM Thoday). Advances in Genetics 13:115–155.

Charmantier A, McCleery RH, Cole LR, Perrins C, Kruuk LEB & Sheldon BC (2008) Adaptive Phenotypic Plasticity in Response to Climate Change in a Wild Bird Population. Science 320:800–803.

Cohen D (1966) Optimizing reproduction in a randomly varying environment. Journal of Theoretical Biology 12:119–129.

DeWitt TJ, Sih A & Wilson DS (1998) Costs and limits of phenotypic plasticity. Trends in Ecology & Evolution 13:77–81.

Donaldson-Matasci MC, Bergstrom CT & Lachmann M (2013) When Unreliable Cues Are Good Enough. The American Naturalist 182:313–327.

Dowle M & Srinivasan A (2017) data.table: Extension of `data.frame`.

Dunbar RIM & Shi J (2012) Time as a constraint on the distribution of feral goats at high latitudes. Oikos 122:403–410.

Duncan Temple Lang and the CRAN team (2018) RCurl: General Network (HTTP/FTP/...) Client Interface for R.

Fox RJ & Bellwood DR (2011) Unconstrained by the clock? Plasticity of diel activity rhythm in a tropical reef fish, Siganus lineatus. Functional Ecology 25:1096–1105.

Furness AI, Lee K & Reznick DN (2015) Adaptation in a variable environment: Phenotypic plasticity and bet-hedging during egg diapause and hatching in an annual killifish. Evolution 69:1461–75.

Gienapp P, Teplitsky C, Alho JS, Mills JA & Merilä J (2008) Climate change and evolution: disentangling environmental and genetic responses. Molecular Ecology 17:167–178.

Grantham ME, Antonio CJ, O’Neil BR, Zhan YX & Brisson JA (2016) A case for a joint strategy of diversified bet hedging and plasticity in the pea aphid wing polyphenism. Biology Letters 12:20160654.
Greives TJ, Kingma S, Bart K, Kim M, Martin W, Kees O, Christa M A, A. F Glen, Giulia B, Michaela H & Keith S (2015) Costs of sleeping in: circadian rhythms influence cuckoldry risk in a songbird. Functional Ecology 29:1300–1307.

Halkett F, Harrington R, Hullé M, Kindlmann P, Menu F, Rispe C & Plantegenest M (2004) Dynamics of Production of Sexual Forms in Aphids: Theoretical and Experimental Evidence for Adaptive “Coin‐Flipping” Plasticity. The American Naturalist 163:E112–E125.

Helm B, Visser ME, Schwartz W, Kronfeld-Schor N, Gerkema M, Piersma T & Bloch G (2017) Two sides of a coin: ecological and chronobiological perspectives of timing in the wild.
 Philosophical Transactions of the Royal Society of London. Series B, Biological Sciences 372.

Kronfeld-Schor N, Bloch G & Schwartz WJ (2013) Animal clocks: when science meets nature. Proceedings. Biological Sciences 280:20131354.

Laland KN, Uller T, Feldman MW, Sterelny K, Müller GB, Moczek A, Jablonka E & Odling-Smee J (2015) The extended evolutionary synthesis: its structure, assumptions and predictions. Proceedings of the Royal Society B: Biological Sciences 282:20151019.

Lamb RJ & Pointing PJ (1972) Sexual morph determination in the aphid, Acyrthosiphon pisum. Journal of Insect Physiology 18:2029–2042.

Lees JM (2012) geomapdata: Data for topographic and Geologic Mapping.

Mahendiran M (2016) Coexistence of three sympatric cormorants (Phalacrocorax spp.); partitioning of time as an ecological resource. Royal Society Open Science 3:160175.

Marques MD & Waterhouse J (2004) Rhythms and Ecology — Do Chronobiologists Still Remember Nature? Biological Rhythm Research 35:1–2.

Martinez-Bakker M & Helm B (2015) The influence of biological rhythms on host-parasite interactions. Trends in Ecology & Evolution 30:314–326.

Menne MJ, Durre I, Korzeniewski B, McNeal S, Thomas K, Yin X, Anthony S, Ray R, Vose R., Gleason BE & Houston TG (2018) Global Historical Climatology Network -  Daily (GHCN-Daily).

Menne MJ, Durre I, Vose RS, Gleason BE & Houston TG (2012) An Overview of the Global Historical Climatology Network-Daily Database. Journal of Atmospheric and Oceanic Technology 29:897–910.

Muona O & Lumme V (2017) Geographical variation in the reproductive cycle and photoperiodic diapause of drosophila phalerata and d. transversa (drosophilidae:diptera). Evolution 35:158–167.

Murren CJ, Auld JR, Callahan H, Ghalambor CK, Handelsman CA, Heskel MA, Kingsolver JG, Maclean HJ, Masel J, Maughan H, Pfennig DW, Relyea RA, Seiter S, Snell-Rood E, Steiner UK & Schlichting CD (2015) Constraints on the evolution of phenotypic plasticity: limits and costs of phenotype and plasticity. Heredity 115:293–301.

NOAA (1988) Data Announcement 88-MGG-02, Digital relief of the Surface of the Earth.

Paolucci S, van de Zande L & Beukeboom LW (2013) Adaptive latitudinal cline of photoperiodic diapause induction in the parasitoid Nasonia vitripennis in Europe. Journal of Evolutionary Biology 26:705–718.

Paranjpe DA & Kumar Sharma V (2005) Evolution of temporal order in living organisms. Journal of Circadian Rhythms 3:7.

Poesel A, Kunc HP, Foerster K, Johnsen A & Kempenaers B (2006) Early birds are sexy: male age, dawn song and extrapair paternity in blue tits, Cyanistes (formerly Parus) caeruleus. Animal Behaviour 72:531–538.

Price TD, Qvarnstrom A & Irwin DE (2003) The role of phenotypic plasticity in driving genetic evolution. Proceedings of the Royal Society B: Biological Sciences 270:1433–1440.

R Core Team (2018) R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria.

Riihimaa Ari, Kimura Masahito T., Lumme Jaakko & Lakovaara Seppo (2004) Geographical variation in the larval diapause of Chymomyza costata (Diptera; Drosophilidae). Hereditas 124:151–164.

Rinker TW (2017) textreadr: Read Text Documents into R version 0.7.0. Buffalo, New York.

Ritz C, Baty F, Streibig JC & Gerhard D (2015) Dose-Response Analysis Using R. PLOS ONE 10:e0146021.

Rohatgi A (2017) WebPlotDigitizer. Austin, Texas, USA.

Scheiner SM (1993) Genetics and Evolution of Phenotypic Plasticity. Annual Review of Ecology and Systematics 24:35–68.

Simons AM (2011) Modes of response to environmental change and the elusive empirical evidence for bet hedging. Proceedings of the Royal Society B: Biological Sciences 278:1601–1609.

Simons AM (2014) Playing smart vs. playing safe: the joint expression of phenotypic plasticity and potential bet hedging across and within thermal environments. Journal of Evolutionary Biology 27:1047–1056.

Spoelstra K, Verhagen I, Meijer D & Visser ME (2018) Artificial light at night shifts daily activity patterns but not the internal clock in the great tit (Parus major). Proc. R. Soc. B 285:20172751.

Starrfelt J & Kokko H (2012) Bet-hedging - a triple trade-off between means, variances and correlations. Biological Reviews 87:742–755.

Tufto J (2015) Genetic evolution, plasticity, and bet-hedging as adaptive responses to temporally autocorrelated fluctuating selection: A quantitative genetic model: EVOLUTIONARY RESPONSES TO FLUCTUATING SELECTION. Evolution 69:2034–2049.

Urbanski J, Mogi M, O’Donnell D, DeCotiis M, Toma T & Armbruster P (2012) Rapid Adaptive Evolution of Photoperiodic Response during Invasion and Range Expansion across a Climatic Gradient. The American Naturalist 179:490–500.

Vaze KM & Sharma VK (2013) On the adaptive significance of circadian clocks for their owners. Chronobiology International 30:413–433.

Visser ME, Caro SP, Oers K van, Schaper SV & Helm B (2010) Phenology, seasonal timing and circannual rhythms: towards a unified framework. Philosophical Transactions of the Royal Society of London B: Biological Sciences 365:3113–3127.

Wickahm H stringr: Simple, Consistent Wrappers for Common String Operations.

Wickham H (2017) re.

Wickham H, Francois R, Henry L & Müller K (2017) dplyr: A Grammar of Data  Manipulation.

Wickham H & Henry L (2018) tidyr: Easily Tidy Data with “spread()” and “gather()”   Functions.

Wickham H, Hester J & Francois R (2017) readr: Read Rectangular Text Data.

Wier AM, Nyholm SV, Mandel MJ, Massengo-Tiassé RP, Schaefer AL, Koroleva I, Splinter-BonDurant S, Brown B, Manzella L, Snir E, Almabrazi H, Scheetz TE, Bonaldo M de F, Casavant TL, Soares MB, Cronan JE, Reed JL, Ruby EG & McFall-Ngai MJ (2010) Transcriptional patterns in both host and bacterium underlie a daily rhythm of anatomical and metabolic change in a beneficial symbiosis. Proceedings of the National Academy of Sciences 107:2259–2264.

Ximenez-Embun MG, Zaviezo T & Grez A (2014) Seasonal, spatial and diel partitioning of Acyrthosiphon pisum (Hemiptera: Aphididae) predators and predation in alfalfa fields. Biological Control 69:1–7.

Zeileis (2006) Object-oriented Computation of Sandwich Estimators. Journal of Statistical Software 9.

Zeileis A & Hothorn T (2002) Diagnostic Checking in Regression Relationships. R News 2:7–10.



# alternative introduction

Organisms need to cope with heterogeneous and fluctuating environments. Being able to adapt flexibly to a range of environmental conditions is thus crucial for survival. Phenotypic plasticity, the ability of one genotype to produce several phenotypes, is the most prevalent mode of dealing with fluctuating conditions (Gienapp et al., 2008). 

Phenotypic plasticity drives long-term genotypic change (Price et al., 2003), contributes to evolution and speciation (Bradshaw, 1965; Laland et al., 2015) and buffers organisms against environmental change (Charmantier et al., 2008). An optimal organism would obviously be perfectly plastic, and respond directly to any change in conditions with the most appropriate phenotype. Plasticity may, however, be associated with significant costs and constrains (DeWitt et al., 1998; Murren et al., 2015). In particular, only predictable change that is correlated to a reliable signal can be tackled with phenotypic plasticity (Scheiner, 1993). Phenotypic plasticity is therefore ill-suited to deal with quickly fluctuating conditions (Tufto, 2015), bso unpredictable conditions call for other strategies.

A fixed response in unpredictably changing conditions is potentially detrimental, because the otherwise high-performing lineage may fail in a single year and thus achieve an overall fitness of zero. More generally, a genotype that is only adapted to the mean condition of a variable environment experiences fitness variance between years (Starrfelt & Kokko, 2012). This fitness variance entails costs, because reproduction as a multiplicative process needs to be calculated based on the geometric mean, and the geometric mean decreases with variance (Cohen, 1966). Therefore the best strategy in an unpredictable environment may not be the one that yields the highest arithmetic mean fitness, but one that minimizes the between-years variance. Strategies that reduce fitness variance at the cost of arithmetic mean fitness are called bet-hedging. Bet-hedgers may reduce between-years variance by either avoiding any risk (conservative bet-hedging), or by spreading the risk among the offspring and investing in a range of phenotypes (diversified bet-hedging). 

Bet-hedging strategies are beneficial in entirely unpredictable environments, whereas phenotypic plasticity is best-suited for perfectly predictable environments. Both scenarios are unrealistic, however, because conditions in natural environments are associated with partially predictive cues, and an optimal strategy should strike a balance between plasticity and bet-hedging (e.g. Donaldson-Matasci et al., 2013; Grantham et al., 2016). Indeed, a mixed strategy of plasticity and bet-hedging can exist (Furness et al., 2015), and the two strategies trade off against each other (Simons, 2014). The relationship among bet-hedging and (partial) predictability can be illustrated by a refined view of a reaction norm (Fig. 1). A phenotypic reaction norm sees the phenotype as function of some environmental state.  In the case of two discrete polyphenisms, the change in phenotypes can be approximated by a logit-curve (the environment should be discrete as well). Actually, the environment is rarely sampled directly, so the reaction norm should be a (phenotype~cue) function, with a cue that is correlated to the environmental state.

An imperfect correlation of cue and environment is particularly problematic for logit-functions: If the position on the x-axis(environmental state) is not determined correctly, the phenotype is easily mismatched. Centering the logit-curve around the cue that is on average equal to  the environmental switch-point will yield the highest arithmetic mean fitness, but  it ignores fitness variance (the phenotype will often be mismatched). A better strategy to increase geometric mean is to make the phenotype-cue curve less steep: Only a fraction of each phenotype is expressed along a larger range of environments, so at least some phenotypes will match with the environment. This increases the number of mismatched phenotypes and hence reduces arithmetic mean fitness, but also reduces fitness correlations among the offspring and thus may increase geometric mean fitness – We call this diversified bet-hedging. If the two environments are unequal (1 harsh, 1 good), it may also be an alternative to shift along the x-axis, so that the harsh-environment phenotype (e.g. diapausing stages or seed dormancy) occurs more often than it should on average. This reduces mean fitness but also fitness variance (conservative bet-hedging). Phrased like this, bet-hedging can be defined as the shape of the reaction norm. 

Fig 1: illustration of bet-hedging as attribute of phenotypic reaction norms. A) logistic phenotypic reaction norm, as is common for two-state polyphenisms. An organisms relies on a cue to switch between two states. Red: organism with a flat slope in reaction norm. Need to work on visualisation.
B) fitness of organism with steep (black) and flat (red) slope in stable and fluctuating environments. All ofspring of the non-hedging (black) population have the same fitness, because they switch synchronously when environments change. This causes the line to go extinct when facing a “bad” year. The offspring of the bet-hedging lines differ in fitness, depending on the amount of mismatch with the environment. This causes lower fitness in stable environments, but also lower fitness variance in fluctuating conditions. 


The canonical and best-studied example of diversified bet-hedging is that of annual desert plants: Rainfall in deserts is entirely unpredictable, so the environment fluctuates between drought years and wet years. Variability in seed germination ensures that not all seeds enter the vulnerable seedling stage at once. Some dormant seeds can thus survive to the next year in drought years (Cohen, 1966).  Expressed as reaction norm slopes: The germination probability is not a steep logit-curve, but a nearly flat curve that spreads germination over several years. 
One potential alternative model is a multivoltine insect that grows exponentially over summer, but needs to time diapause so that an early onset of winter does not drive all offspring to extinction. Such a system shares the key characteristics with the classical case of desert annuals: Insects that diapause already early in the year trade safe overwintering against a loss in exponential growth and are insofar comparable to seeds that remain dormant for several years. In contrast to the desert annual case, however, the onset of harsh conditions is partially predictable, as insects may rely on the autumnal drop in temperature as partially reliable cue. 

It has been shown experimentally that the response to short days frequently follows a logit-curve (photoperiodic response curve, Dixon & Glen, 1971; Lamb & Pointing, 1972; Fig. 1),urbanski and bradshaw instead) and there is a range of day lengths at which diapause is probabilistic among one mother’s offspring (c.f. Fig. 1A). The arrival of winter is variable and hence difficult to predict, which should favour bet-hedging responses (Halkett et al., 2004). I thus assume that the width of the range with random sex determination, i.e. the slope of the photoperiodic response curve, can serve as bet-hedging trait to cope with variability in winter onset. Moreover, the timing is partially adjusted via phenotypic plasticity, as warm temperature can delay the photoperiodic response (Lamb & Pointing, 1972). In relatively predictable environments the organisms hence need to rely less on bet-hedging, and are expected to have a steeper slope regardless of environmental variability.  The photoperiodic response of insects hence includes both a potential bet-hedging response and partial predictability.

Providing empirical evidence for bet-hedging is a challenge, as one would have to demonstrate that variability is not random noise but has long-term fitness consequences. One reasonably good line of evidence would be to demonstrate a covariation of environmental and physiological variability (Simons 2011) across genotypes. We hence conducted a meta-analysis. First we derived photoperiodic response curves from 350 populations from over 60 published studies. Secondly, we calculated variability and predictability of winter onset, using a network of 30,000 climate stations. Thirdly, we correlated the slope of the PRCs with environmental variability and predictability.