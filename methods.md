
# Description of this file  
This file consists of two parts: First, a copy of summary and methods section from the manuscript draft. This section is updated only sporadically and may be outdated.Secondly, there is a detailed account of all methods that are in use. Methods that were abandoned are in a separate script (unused.md).


# Summary    

Many insects escape the adverse conditions of winter by diapause. Finding the optimal diapause timing is challenging as the optimal timing may be determined by mean winter onset, its variability, and predictability of the environment. Insects are known to use day length as main cue for mean winter onset, and plastic responses to temperature as secondary cue. It is, however, not known how insects deal with variable environments with little predictability. We hypothesized that 1) the timing of diapause closely tracks mean winter onset; and 2) that the variability in diapause timing increases with environmental variability, but decreases with environmental predictability. 
We tested these hypotheses with a meta-analysis. First, we calculated mean winter onset, winter variability and predictability for ~29,000 climate stations in the northern hemisphere. We then searched for publications that study photoperiodic reaction norms of insects at more than two sites (~30 studies, 8 orders, ~200 populations). We determined the inflection point and the slopes in the reaction norms, as these determine, resepectively, the mean and the temporal spread of diapause. We then correlated the inflection point with day length at mean winter onset, and the slope estimates with variability and predictability of the environment.  
As expected, populations from northern latitudes shift their timing towards earlier diapause, progressing with approximately 55 minutes per 5 degrees latitude. The day length at which insects respond correlated well with the day length at winter onset. Contrary to our hypotheses, however, the variability in diapause was neither explained by winter variability nor by winter predictability. We conclude that insect phenology can readily evolve in response to temperature across insect orders, but that it is vulnerable to changes in climatic variability. 




# Methods  

## 1. Overview  
We used climate station data to calculate mean winter onset and mean day length at winter onset for 25,340 locations. We then calculated winter predictability with three methods: First, we calculated the standard deviation in winter onset. This served as estimate of the reliability of day lenght as cue. Secondly, we estimated reliability of preceding autumn temperatures. For this we regressed temperatures of the last 30 days before winter onset for each year and calculated the between-years standard deviation of the slope. Thirdly, we determined the "colour of environmental noise" (Vasseur & Yodzis 2004), that is, the relative extent of long-frequency autocorrelations in temperatures.
We then extracted photoperiodic response curves (PRCs) from 27 published studies (169 populations) along with their sampling locations. We calculated four-parameter dose-response curves to obtain estimates of lower and upper diapause limit, critical day length (inflection point) and slope of the curves. We converted critical day lengths into julian days, and we calculated variances within and between day lengths. We then correlated mean timing and variance components with the climate variables:
0) critical day length was correlated with latitude
1) mean diapause timing was correlated with mean winter onset (mean timing)
2) mean diapause timing was correlated with an interaction of mean winter onset and day length predictability (conservative bet-hedging)
3) Between-treatments variance were correlated with day length predictability (adaptive plasticity)
4) Within-treatment variance was correlated with an interaction of day length and temperature predictabilities (bet-hedging)



## 2. climate data  
### 2.1. data preparation  
We used land surface temperature data from the Global Historical Climatology Network (GHCN-Daily) (Menne et al. 2012a, b). We extracted daily minimum and maximum temperatures from all climate stations (~12.6 million months with data, ~34,000 stations). We removed all days with incomplete data (either minimum or maximum temperature not recorded), all years in which more than half of the data points was missing, all stations that covered less than 3 years of data, and all stations from the southern hemisphere. This procedure left 10,991,727 months (3-244 years) in 26,804 climate stations. We then calculated the average of daily maximum and daily minimum temperature for each station to estimate daily mean temperature. 
 
### 2.2. winter onset and day length predictability  
To estimate winter onset in each year and station, we identified cold days with average temperatures below 10°C. We then determined winter onset as the fifth cold day after midsummer. Years in which winter did not arrive according to this definition were excluded, and stations with less than 3 years with winter onset removed. We calculated a weighted mean winter onset and a frequency weighed standard deviation of winter onset to account for differences in reliability across years. We obtained 25,340 estimates of mean winter onset, day length at winter onset and winter predictability in the northern hemisphere.

### 2.3 temperature predictability  
To calculate the predictability of winter based on preceding temperatures, we used the temperature recordings of the last 30 days before winter onset of each year. Years with less than 10 temperature recordings in the month preceding winter were excluded. We regressed daily mean temperature over time with a linear model, and recorded the slope estimate of each year. The slope of this regression describes the pace of seasonal change, and the between-years standard deviation of the slope determines whether the rate of change is consistent (predictable) across years. In total there were 25,136 estimates of predictability based on this method.  

As another method to calculate climate predictability, we calculated the “colour of noise”, based on the degree of long-frequency autocorrelation in the temperature data (Vasseur & Yodzis 2004). Randomly fluctuating (white-noise) environments can be defined as time series with no temporal autocorrelation, so preceding temperatures of any gap length (e.g. 1 day or 1 week earlier) have equally low explanatory power. In predictable (“red-noise”) environments, on the other hand, the explanatory power depends on gap lengths, and this can be demonstrated by decomposing the time series with a Fourier transform, and estimating the influence of each frequency. We hence produced power spectral density plots for all stations (daily temperatures of multiple years). First, we detrended the data by substracting from each daily temperature estimate its station-wide mean. Missing values were replaced by linear interpolation. We then calculated the spectral density within the frequency range of 1/366 and 1/(2 months) with the function spectrum, using a standard smoothing algorithm (pgram), and estimated beta as the negative of the slope of log10(spectral density)~log10(frequency). Beta was only calculated if there were at least five frequency estimates. In total there were x estimates of beta, but only y estimates were based on 25 or more years of data and subsequently used.


### 2.4 Sensitivity of climate predictions to temperature threshold  
Arthropod thermal requirements vary among species, and our use of a 10°C temperature threshold was an arbitrary decision. It resulted in a global median winter onset around Oct 11, which is within the range of commonly reported phenological windows and threshold values (Halkett et al. 2004; Waldock et al. 2013). We systematically varied the temperature threshold between 5 and 15°C, and the number of days below this threshold between 1 and 10 days. 

## 3. Empirical data  

### 3.1 Eligibility criteria  
In our literature search for diapause reaction norms we concentrated on studies that measure photoperiodic response curves (PRCs) of invertebrates. We excluded marine and intertidal organisms, because corresponding climate estimates were only available for terrestrial systems. Invertebrates with a larval stage in shallow water (e.g. mosquitoes) were nevertheless included. Studies with estimates for less than 3 populations (samples) were excluded, because in these cases the variance would be absorbed by the random term “study”, which was included in the analysis. We also excluded all studies that measured diapause at less than three photoperiods. To maximize sample sizes, we did not restrict our analysis to any geographic location or publication language.

### 3.2 Search strategy  

A full description of the search strategy can be found in Supplementary material S1. In short, we conducted two independent literature searches in the Web of Science core collection: First (19.02.2018) we limited the search terms to: 
TS = ((photoperiodic AND (geogr* OR range)) OR (photoperiod* AND latitud*) OR (photoperiod* AND longitud*))

Secondly (15.06.2018), we used a wider range of search terms,

TS = (("day length" OR photoperiod* OR diapaus* OR hibern* OR dorman*) AND (geogr* OR "range" OR latitud* OR longitud* OR cline$ OR clinal))
OR TI = (("day length" OR photoperiod* OR diapaus* OR hibern* OR dorman*) AND "populations"),

but filtered the output by arthropod-related terminology. We found 1638 references in the first search, of which we judged 377 potentially relevant, and 62 met all inclusion criteria. In the second search we found 2748 references, with 621 potentially relevant and 74 included articles. For both searches we did a full forward-citation search on all included articles, and we found 13 and 3 further references, respectively. The search results were largely congruent, and altogether there were 78 useful references (615 populations).

### 3.3 Inclusion criteria  
10 articles (110 populations) were not accompanied by raw data, tables or figures that allowed further analysis, and the authors were deceased, did no longer have the raw data or did not respond to our emails. These articles were hence excluded from analysis. From the remaining studies we only selected those populations with at least 2 estimates on the sloped part of the population’s PRC and two further estimates to define upper and lower limits, because otherwise the dose-response curve analysis would not allow for a meaningful slope estimate. Some PRCs were incomplete but nevertheless eligible for analysis, because the upper and lower limits of diapause could be interpolated from the remaining populations of a study (see below). We only included studies with at least 3 remaining populations. This procedure left 35 studies with 225 populations.



### 3.4. Data extraction  
One study (7 populations) reported the slope and midpoint directly, and 34 studies presented the raw data as tables (5 studies) or figures (29 studies). In the latter case we saved the figure and extracted the data with WebPlotDigitizer Version 3.12 (Rohatgi 2017). Where neccessary, the day length was then rounded or corrected to match the description in materials and methods of the respective study. Y-values that were slightly above 100% or below 0% were set to 100% and 0% respectively.

### 3.5 Dose-response curve modelling  
To estimate the midpoints and slopes we modelled diapause with binomial dose response curves in R (R Core Team n.d.). This analysis provides lower and upper bounds of photoperiodic induction (we constrained these to range from 0 to 100%), the slope, and the inflection point where 50 % of the individuals are induced (critical day length), so up to four parameters per slope were estimated. We expected that all populations of one species have the same lower and upper limit, which reduces the estimation to 2 parameters per slope, plus 2 global parameters per study. We also applied the alternative models with only one or no fixed global parameters .We chose the model with lowest AIC. If there were multiple models with an AIC difference less than 4, we used the most plausible model. [We recorded the standard error along with the estimates of slope, inflection point and upper and lower limits, using the robust sandwich estimation method, which allows deviating from the assumption that residual errors have constant variance (Zeileis 2006).]

[Three studies lacked vital data on upper or lower limits for some focal populations, but contained further populations that were excluded for lack of points on the sloped part. These other populations showed unambigously that the lower and upper limits were 0 and 100%. In these cases we performed a 2-parameter does-response curve to allow inclusion of the incomplete populations.]



Detailed information on number of individuals per point estimate was rarely available (70 populations, 10 studies), as sample sizes were either given as population-level means (4 populations, 1 study) or as global average or range (134 populations, 21 studies), or missed entirely (2 studies, 10 populations). We used all data that was provided to weigh the individual points of the PRC. We wish to emphasize that a lack of detailed information should not be confused with an unweighted (“vote-count”) meta-analysis, because the sample size (day lengths per population) was always known. Rather, the lack of weighing in the PRC estimates lead to slightly less accurate estimates, i.e. the missing information occurred on a lower level (points within population) than the level of replication (population).

During analysis we removed 7 studies (21 populations) and 29 further populations, because the fitted curves did no longer match the inclusion criteria. 28 Studies and 175 populations were left.

### 3.6 Effect size calculation  
We used the critical day length from the dose-response curves to calculate the julian day of winter onset. To do so, we used the reported latitude of the sampling location and the day length function from package geosphere (Hijmans 2017).

For each dose-response curve we calculated variance within treatments and variance among treatments. The variance of binomial estimates is n*p(1-p), with p= probability of induction and n = sample size. Sample sizes were always 1, because there was 1 estimate per day length.[not true, actually].  We defined the variance between treatments as the squared standard error, which is the standard deviation of the percentages divided by the square-root of the number of treatments. Because these formulas are developed for discrete treatments, but the dose response curves are continuous, we calculated diapause percentages for 1000 equally spaced day lengths around inflection point +- 4h. We then calculated the sum of the treatment variances, these values ranged from 0 to 250 (0.5*(1-0.5)*1000). The between-treatment variance simplified to (sd/100)^2. 

Meta-analysis models differ from regular mixed-effects models in that the data points (effect sizes of each study) are weighed by their reliability. Usually the models are weighed by the inverse of the effect size variance, but this was not feasible for the variance components. [Moreover, populations with a low number and an unbalanced distribution of data points (e.g. only at 5% and 95% induction) caused partial overfitting of the dose-response models and resulted in unrealistically low standard errors (Fig. S1), so that the least reliable studies would obtain highest weights. ]We therefore weighed the studies by the number of day length treatments that contributed to the slope of the fitted curve. This is similar to a sample size- weighing approach, only without the caveat that sample sizes are not comparable across studies. 

## 4. Statistical analysis  
Our analysis is based on 175 populations from 28 studies, which covers 24 species from 16 genera and 8 orders. To obtain estimates of mean winter onset and its predictability for the study site locations, we averaged the estimates from the 5 closest stations within a 5° radius (weighted by 1/euclidian distance). When the coordinates were not directly provided in the study, we used the coordinates of the quoted town or area. Town and area coordinates were made available by the WikiProject Geographical coordinates (https://en.wikipedia.org/wiki/Wikipedia:WikiProject_Geographical_coordinates) and the Geohack tool (https://www.mediawiki.org/wiki/GeoHack).

We then correlated mean timing and variance components with the climate variables:
2) mean diapause timing was correlated with an interaction of mean winter onset and day length predictability 
3) Between-treatments variance was correlated with day length predictability 
4) Within-treatment variance was correlated with an interaction of day length and temperature predictabilities 

In addition we correlated critical day length with latitude to allow a comparison with earlier studies. We used binomial mixed-effects models with a random structure of “study” nested in “genus” nested in “order” (“species” explained zero variance) for all models, and sample size-based weighing as described in section 3.6.



For all analyses we report 1) estimates of the fixed effects along with their standard errors; 2) pseudo-R² values (nakagawa shielzeth) 3) LRT results


### 4. Package information  
The data from the studies was extracted with WebPlotDigitizer version 3.12 (Rohatgi 2017). For processing the climate variables and statistical models we used Perl version 5.22.1, and R version 3.4.4 (R Core Team n.d.). The data was manipulated with the packages textreadr (Rinker 2017), Rcurl (Duncan Temple Lang and the CRAN team 2018), data.table (Dowle & Srinivasan 2017), imputeTS (Moritz 2018), magrittr (Bache & Wickham 2014), and the tidyverse core packages (Wickahm 2017).
The day length calculations were perfomed with the package geosphere (Hijmans 2017). The dose-response curve analyses were made with the package drc (Ritz et al. 2015), its standard errors were computed with the packages sandwich (Zeileis 2006) and lmtest (Zeileis & Hothorn 2002), and the mixed-effects models were made with the package metafor (Viechtbauer 2010).

The history of this research project (including a full description of all tests and approaches) can be found at https://github.com/JensJoschi/variability_timing



# details  

## climate data  
### preparation  
Two Perl scripts extracted daily minimum and maximum temperatures from all climate stations. The scripts opened each .txt file, searched for lines that include TMAX (or TMIN), removed all data flags, and saved the output in delimited format (using | as delimiter). All further analysis was conducted in R.

### winter onset  
Across all stations with recorded winter onsets, 68.5 % of the years had more than 350 days with data, and 85.1% had more than 300 days with data.


## empirical data  

### first search  

I searched the web of science database for "(photoperiodic AND (geogr\* OR range)) OR (photoperiod\* AND latitud\*) OR(photoperiod\* AND longitud\*)" on 19.2.2018. This search yielded 1628 unique  results. I added articles to the study that I knew or which were cited in these articles but that did not match the keywords (total: 1638). 
I classified the studies as plant/animal, Vertebrate/invertebrate, and water/terrestrial based on journal titles (journal names including e.g. “plant”, “ento*”, “fish” or “bird”), manuscript titles, abstract or full text.  366 studies concentrated on terrestrial invertebrates. We screened the full text of these candidate studies to determine whether PRCs were recorded, and if so, how many photoperiods and populations were measured. We selected all studies with PRC estimates of more than 2 populations and 2 photoperiods (62 studies) for a forward-citation search on April 3rd 2018. We found 762 further articles(586 new), and selected those that met the stricter inclusion criteria (at least 3 populations and 3 day lengths). 11 articles were included for another forward-search. A forward search on these 11 articles on April 12th (182 refs, 94 new) brought 1 new study, and following its 20 citations on April 16th yielded another article. Its 14 citations (April 16th) yielded no further article. 
notes [oct 1 2018]: the two articles from 2nd(3rd) levels forward search are not included in datasets because they have only 3 day lengths anyway. 

### second search  
The search procedure (filtering in excel) was not very transparent, and some critical key words were missing ("day length"!). I thus did another search:
I searched the web of science core collection on jun 15 2018 with the search string
"TS = (("day length" OR photoperiod* OR diapaus* OR hibern* OR dorman* ) AND (geogr* OR "range" OR latitud* OR longitud* OR cline$ OR clinal)) OR TI = (("day length" OR photoperiod* OR diapaus* OR hibern* OR dorman*) AND "populations")" and excluded book and article reviews, notes, rectration notices and retracted papers. 
This search provided **7665** results. To reduce the number of hits, we subsequently searched individual research areas with different criteria:
1. we used all **847** hits from the area "entomology". 
2. We filtered all remaining studies for the area "zoology", and included all **458** studies which name an invertebrate taxon (85 search criteria) _or_ name no vertebrate taxon (61 criteria). In addition we included studies from invertebrate-specific journals that were not tagges as "zoology" (**14** hits). 
3. We filtered all remainings studies for the areas Ecology, Evolutionary Biology, Genetics, Biodiversity & Conservation and Soil Science. We included all **994** studies that name an invertebrate taxon (85 criteria), _or_ name no vertebrates, no micro-organisms, no plant-specific terms, no aquatic environments and no genetic methods (83 terms).
4. We filtered all remainings studies for the areas Agriculture, Plant Sciences, Forestry and Food Science Technology, and included all studies (**50**) with invertebrate taxa in the titles (85 criteria).
5. We filtered all remainings studies for the areas "other topics", "physiology", "Parasitology", "behavioral Sciences" and "infectious diseases", thus leaving out various unrelated ares (e.g. medicine, engineering). within these areas, we included all studies that name an invertebrate taxon, _or_ name no vertebrates, no microbes, no human diseases, no aqutic environments and no plant-specific terms (8 terms) (**418** studies). 
Altogether we found 2,748 studies.

The exact search strings (and number of hits):
\#1: TS = (("day length" OR photoperiod* OR diapaus* OR hibern* OR dorman* ) AND (geogr* OR "range" OR latitud* OR longitud* OR cline$ OR clinal)) (7665)  
## entomology
\#2: #1 and SU = "entomology" (847)

## zoology
\#3: #1 NOT #2 AND SU = "Zoology" NOT TI =( marine* OR aquat* OR limno* OR water OR palaeo* OR $vertebra* OR *fish* OR $amphib* OR $salientia* OR $anura* OR $caudata OR $salamand* OR newt$ OR $gymnophion* OR frog$ OR tadpole$ OR toad$ OR $reptil* OR $crocodil* OR *sauria* OR $squamat* OR $lizard* OR $lacert* OR $gekko* OR $serpent* OR $snake* OR $testudin* OR $turtle* OR $tortois* OR $mammal* OR $rodent* OR $sciurid* OR $hamster* OR *mouse* OR *mice* OR $squirrel* OR $rabbit* OR $hare OR $hares OR $chiropt* OR $bat OR $bats OR $myotis OR $sorciomorpha OR $soricid* OR $talpid* OR $shrew* OR $marmot* OR $mole OR $moles OR $primat* OR $carnivora OR $ursid* OR $ursus OR $felid OR $felids OR "$sea lion" OR "$fur seal" OR "$elephant seal" OR $marsupi* OR $goat* OR $sheep* OR $deer OR $cattle OR estrus OR suprachiasm*) (426)

\#4: #1 NOT #2 AND SU = "Zoology" AND TI = ((marine* OR aquat* OR limno* OR water) AND terrest* NOT ($vertebra* OR *fish* OR $amphib* OR $salientia* OR $anura* OR $caudata OR $salamand* OR newt$ OR $gymnophion* OR frog$ OR tadpole$ OR toad$ OR $reptil* OR $crocodil* OR *sauria* OR $squamat* OR $lizard* OR $lacert* OR $gekko* OR $serpent* OR $snake* OR $testudin* OR $turtle* OR $tortois* OR $mammal* OR $rodent* OR $sciurid* OR $hamster* OR *mouse* OR *mice* OR $squirrel* OR $rabbit* OR $hare OR $hares OR $chiropt* OR $bat OR $bats OR $myotis OR $sorciomorpha OR $soricid* OR $talpid* OR $shrew* OR $marmot* OR $mole OR $moles OR $primat* OR $carnivora OR $ursid* OR $ursus OR $felid OR $felids OR "$sea lion" OR "$fur seal" OR "$elephant seal" OR $marsupi* OR $goat* OR $sheep* OR $deer OR $cattle OR estrus OR suprachiasm*)) (1)

\#5: #1 not #2 not #3 and SU = zoology AND TI =(invertebrat* OR worm* OR annelid* OR platyhelminth* OR nematod* OR mollusc* OR gastropod* OR slug* OR snail* OR arthropod* OR chelicer* OR arachnid* OR aranea* OR acari OR tetranych* OR ixod* OR opilion* OR spider* OR *scorpio* OR tick$ OR mite$ OR harvestmen OR crustace* OR malostraca* OR isopod* OR woodlice OR oniscid* OR armadillium OR myriapod* OR chilopod* OR diplopod* OR pauropod* OR symphyla OR millipede* OR centipede* OR hexapod* OR collembol* OR springtail* OR insect$ OR blattodea OR *ptera OR mantodea OR odonata OR phasmatodea OR psocodea OR thysanura OR zygentoma OR psyllid* OR stenorrhyn* OR cockroach* OR beetle$ OR earwig* OR *fly OR *flies OR droso* OR mosquit* OR *bug$ OR aphid* OR adelgid* OR phyllox* OR *wasp$ OR (*bee OR *bees) OR (ant OR ants) OR mantis OR grasshopper* OR locust* OR cricket* OR louse OR lice OR flea$ OR moth$ OR thrip* OR silverfish ) NOT TI = (paleo* or $chiroptera*) (17)

\#6: 
#1 not #2 AND SO =(journal¹) NOT SU = zoology   (14)

\#7: #3 OR #4 OR #5 OR #6  (458)


## ecology

\#8: #1 not #2 not #7 AND SU = (ENVIRONMENTAL SCIENCES ECOLOGY  OR EVOLUTIONARY BIOLOGY OR GENETICS HEREDITY OR BIODIVERSITY CONSERVATION OR SOIL SCIENCE NOT Zoology) (1521)

\#9: #8 AND TI = (invertebrat* OR worm* OR annelid* OR platyhelminth* OR nematod* OR mollusc* OR gastropod* OR slug* OR snail* OR arthropod* OR chelicer* OR arachnid* OR aranea* OR acari OR tetranych* OR ixod* OR opilion* OR spider* OR *scorpio* OR tick$ OR mite$ OR harvestmen OR crustace* OR malostraca* OR isopod* OR woodlice OR oniscid* OR armadillium OR myriapod* OR chilopod* OR diplopod* OR pauropod* OR symphyla OR millipede* OR centipede* OR hexapod* OR collembol* OR springtail* OR insect$ OR blattodea OR *ptera OR mantodea OR odonata OR phasmatodea OR psocodea OR thysanura OR zygentoma OR psyllid* OR stenorrhyn* OR cockroach* OR beetle$ OR earwig* OR *fly OR *flies OR droso* OR mosquit* OR *bug$ OR aphid* OR adelgid* OR phyllox* OR *wasp$ OR (*bee OR *bees) OR (ant OR ants) OR mantis OR grasshopper* OR locust* OR cricket* OR louse OR lice OR flea$ OR moth$ OR thrip* OR silverfish ) NOT TI = (paleo* or $chiroptera*) (251)

\#10: #8 NOT #9 NOT TI = (marine* OR aquat* OR limno* OR water OR palaeo* OR $vertebra* OR *fish* OR $amphib* OR $salientia* OR $anura* OR $caudata OR $salamand* OR newt$ OR $gymnophion* OR frog$ OR tadpole$ OR toad$ OR $reptil* OR $crocodil* OR *sauria* OR $squamat* OR $lizard* OR $lacert* OR $gekko* OR $serpent* OR $snake* OR $testudin* OR $turtle* OR $tortois* OR $mammal* OR $rodent* OR $sciurid* OR $hamster* OR *mouse* OR *mice* OR $squirrel* OR $rabbit* OR $hare OR $hares OR $chiropt* OR $bat OR $bats OR $myotis OR $sorciomorpha OR $soricid* OR $talpid* OR $shrew* OR $marmot* OR $mole OR $moles OR $primat* OR $carnivora OR $ursid* OR $ursus OR $felid OR $felids OR "$sea lion" OR "$fur seal" OR "$elephant seal" OR $marsupi* OR $goat* OR $sheep* OR $deer OR $cattle OR estrus OR suprachiasm*OR microb* OR bacteria* OR fung* OR *ceae OR bloom OR yield OR germination OR molecular OR simulation OR QTL OR spring OR cell* OR tiller OR cultivar* OR bud* OR chill* OR (tree NEAR phenology)) (743)

\#11: #10 OR #9 (994)

## plant journals  
\#12: #1 AND SU = (AGRICULTURE OR PLANT SCIENCES OR FORESTRY OR FOOD SCIENCE TECHNOLOGY NOT (Entomology OR Zoology OR ECOLOGY OR EVOLUTIONARY BIOLOGY OR GENETICS HEREDITY OR BIODIVERSITY CONSERVATION OR SOIL SCIENCE)) AND TI = (invertebrat* OR worm* OR annelid* OR platyhelminth* OR nematod* OR mollusc* OR gastropod* OR slug* OR snail* OR arthropod* OR chelicer* OR arachnid* OR aranea* OR acari OR tetranych* OR ixod* OR opilion* OR spider* OR *scorpio* OR tick$ OR mite$ OR harvestmen OR crustace* OR malostraca* OR isopod* OR woodlice OR oniscid* OR armadillium OR myriapod* OR chilopod* OR diplopod* OR pauropod* OR symphyla OR millipede* OR centipede* OR hexapod* OR collembol* OR springtail* OR insect$ OR blattodea OR *ptera OR mantodea OR odonata OR phasmatodea OR psocodea OR thysanura OR zygentoma OR psyllid* OR stenorrhyn* OR cockroach* OR beetle$ OR earwig* OR *fly OR *flies OR droso* OR mosquit* OR *bug$ OR aphid* OR adelgid* OR phyllox* OR *wasp$ OR (*bee OR *bees) OR (ant OR ants) OR mantis OR grasshopper* OR locust* OR cricket* OR louse OR lice OR flea$ OR moth$ OR thrip* OR silverfish ) NOT TI = (paleo* or $chiroptera*) (50)

## other  
\#13: #1 NOT SU = (AGRICULTURE OR PLANT SCIENCES OR FORESTRY OR FOOD SCIENCE TECHNOLOGY OR Entomology OR Zoology OR ECOLOGY OR EVOLUTIONARY BIOLOGY OR GENETICS HEREDITY OR BIODIVERSITY CONSERVATION OR SOIL SCIENCE) (2179)

\#14: #13 AND SU = (SCIENCE TECHNOLOGY OTHER TOPICS OR LIFE SCIENCES BIOMEDICINE OTHER TOPICS OR PHYSIOLOGY OR PARASITOLOGY OR BEHAVIORAL SCIENCES OR INFECTIOUS DISEASES) (655)

\#15: #14 AND TI = (invertebrat* OR worm* OR annelid* OR platyhelminth* OR nematod* OR mollusc* OR gastropod* OR slug* OR snail* OR arthropod* OR chelicer* OR arachnid* OR aranea* OR acari OR tetranych* OR ixod* OR opilion* OR spider* OR *scorpio* OR tick$ OR mite$ OR harvestmen OR crustace* OR malostraca* OR isopod* OR woodlice OR oniscid* OR armadillium OR myriapod* OR chilopod* OR diplopod* OR pauropod* OR symphyla OR millipede* OR centipede* OR hexapod* OR collembol* OR springtail* OR insect$ OR blattodea OR *ptera OR mantodea OR odonata OR phasmatodea OR psocodea OR thysanura OR zygentoma OR psyllid* OR stenorrhyn* OR cockroach* OR beetle$ OR earwig* OR *fly OR *flies OR droso* OR mosquit* OR *bug$ OR aphid* OR adelgid* OR phyllox* OR *wasp$ OR (*bee OR *bees) OR (ant OR ants) OR mantis OR grasshopper* OR locust* OR cricket* OR louse OR lice OR flea$ OR moth$ OR thrip* OR silverfish ) NOT TI = (paleo* or $chiroptera*) (97)

\#16: #14 NOT #15 (321)

\#17: #2 OR #7 OR #11 OR #12 OR #15 OR #16 (2747)



¹
journal = all journals including invertebrat*, nemato*, arthropod*, acar*, arachn*, spider, tick*, mite* , crustace* , isopod* , myriapod*, insect*, coleopt*, hymenopt*, dipter*, lepidopt*, neuropt*, orthopt*, trichopt*, odonat*, beetl*, fly, butterfl*, droso*, bee, bees, ant, ants, locust*, moth, thrip*, ento*, biocontrol*, pest*.
 full search term
 SO =( ADVANCES IN INVERTEBRATE REPRODUCTION 5 OR AFRICAN INVERTEBRATES OR BIOAVAILABILITY OF METALS IN TERRESTRIAL ECOSYSTEMS IMPORTANCE OF PARTITIONING FOR BIOAVAILABILITY TO INVERTEBRATES MICROBES "AND" PLANTS OR BIODIVERSITY OF MICROORGANISMS "AND" INVERTEBRATES ITS ROLE IN SUSTAINABLE AGRICULTURE OR DEVELOPMENT OF SEA URCHINS ASCIDIANS "AND" OTHER INVERTEBRATE DEUTEROSTOMES EXPERIMENTAL APPROACHES OR ECOTOXICOLOGY OF METALS IN INVERTEBRATES OR EIGHTH INTERNATIONAL CONFERENCE ON INVERTEBRATE "AND" FISH TISSUE CULTURE OR ENDOCRINE DISRUPTION IN INVERTEBRATES ENDOCRINOLOGY TESTING "AND" ASSESSMENT OR INTERNATIONAL JOURNAL OF INVERTEBRATE REPRODUCTION OR INTERNATIONAL JOURNAL OF INVERTEBRATE REPRODUCTION "AND" DEVELOPMENT OR INVERTEBRATE "AND" VERTEBRATE EYE DEVELOPMENT OR INVERTEBRATE BIOLOGY OR INVERTEBRATE DIOXYGEN CARRIERS OR INVERTEBRATE IMMUNITY OR INVERTEBRATE NEUROSCIENCE OR INVERTEBRATE REPRODUCTION DEVELOPMENT OR INVERTEBRATE SYSTEMATICS OR INVERTEBRATE TAXONOMY OR ISJ INVERTEBRATE SURVIVAL JOURNAL OR JOURNAL OF INVERTEBRATE PATHOLOGY OR NEUROBIOLOGY "AND" ENDOCRINOLOGY OF SELECTED INVERTEBRATES OR OTHER 99 THE CONSERVATION "AND" BIODIVERSITY OF INVERTEBRATES OR PESTICIDES "AND" NON TARGET INVERTEBRATES OR PHYLOGENETIC ASPECTS OF NEUROPEPTIDES FROM INVERTEBRATES TO HUMANS OR RECENT DEVELOPMENTS IN INVERTEBRATE REPELLENTS OR REGULATION OF SEASONAL CYCLES IN INVERTEBRATE OR REPRODUCTION "AND" DEVELOPMENT OF MARINE INVERTEBRATES OR RESTOCKING "AND" STOCK ENHANCEMENT OF MARINE INVERTEBRATE FISHERIES OR STRUCTURE "AND" FUNCTION OF INVERTEBRATE OXYGEN CARRIERS OR USE OF AQUATIC INVERTEBRATES AS TOOLS FOR MONITORING OF ENVIRONMENTAL HAZARDS OR WORKSHOP ON ECOLOGICAL CORRIDORS FOR INVERTEBRATES STRATEGIES OF DISPERSAL "AND" RECOLONISATION IN TODAY S AGRICULTURAL "AND" FORESTRY LANDSCAPES PROCEEDINGS OR ADVANCES IN MOLECULAR PLANT NEMATOLOGY OR ANNALS OF APPLIED NEMATOLOGY OR ANTHELMINTIC RESISTANCE IN NEMATODES OF FARM ANIMALS OR BIOLOGY "AND" MANAGEMENT OF THE SOYBEAN CYST NEMATODE OR FUNDAMENTAL "AND" APPLIED NEMATOLOGY OR JOURNAL OF NEMATOLOGY OR NEMATODES "AND" THE BIOLOGICAL CONTROL OF INSECT PESTS OR NEMATOLOGICA OR NEMATOLOGY OR NEMATOLOGY MONOGRAPHS "AND" PERSPECTIVES OR PAKISTAN JOURNAL OF NEMATOLOGY OR PINEWOOD NEMATODE BURSAPHELENCHUS XYLOPHILUS OR PLANT NEMATODE INTERACTIONS A VIEW ON COMPATIBLE INTERRELATIONSHIPS VOL 73 OR PROCEEDING OF THE FOURTH INTERNATIONAL CONGRESS OF NEMATOLOGY OR RUSSIAN JOURNAL OF NEMATOLOGY OR JOURNAL OF MOLLUSCAN STUDIES OR MOLLUSCAN NEUROBIOLOGY OR MOLLUSCAN RESEARCH OR MOLLUSCAN SHELLFISH DEPURATION OR SLUG "AND" SNAIL PESTS IN AGRICULTURE OR SLUGS SNAILS AGRICULTURAL VETERINARY ENVIRONMENTAL PERSPECTIVES OR APPLICATIONS OF GENETICS TO ARTHROPODS OF BIOLOGICAL CONTROL SIGNIFICANCE OR ARTHROPOD NATURAL ENEMIES IN ARABLE LAND I OR ARTHROPOD NATURAL ENEMIES IN ARABLE LAND II OR ARTHROPOD PLANT INTERACTIONS OR ARTHROPOD STRUCTURE DEVELOPMENT OR ARTHROPOD SYSTEMATICS PHYLOGENY OR ARTHROPODA SELECTA OR BIOLOGY OF GALL INDUCING ARTHROPODS OR GALLING ARTHROPODS "AND" THEIR ASSOCIATES ECOLOGY "AND" EVOLUTION OR IRANIAN JOURNAL OF ARTHROPOD BORNE DISEASES OR JOURNAL OF ARTHROPOD BORNE DISEASES OR MONITORING "AND" INTEGRATED MANAGEMENT OF ARTHROPOD PESTS OF SMALL FRUIT CROPS OR SENSORY SYSTEMS "AND" COMMUNICATION IN ARTHROPODS OR ACARID PHYLOGENY "AND" EVOLUTION ADAPTATION IN MITES "AND" TICKS OR ACAROLOGIA OR ACAROLOGY XIII PROCEEDINGS OF THE INTERNATIONAL CONGRESS OR EXPERIMENTAL "AND" APPLIED ACAROLOGY OR EXPERIMENTAL APPLIED ACAROLOGY OR INTERNATIONAL JOURNAL OF ACAROLOGY OR MODERN ACAROLOGY VOLS 1 "AND" 2 OR SYSTEMATIC "AND" APPLIED ACAROLOGY OR TRENDS IN ACAROLOGY OR ARACHNE OR EUROPEAN ARACHNOLOGY 2000 OR JOURNAL OF ARACHNOLOGY OR ADVANCES IN INSECT PHYSIOLOGY VOL 40 SPIDER PHYSIOLOGY "AND" BEHAVIOUR PHYSIOLOGY OR ADVANCES IN INSECT PHYSIOLOGY VOL 41 SPIDER PHYSIOLOGY "AND" BEHAVIOUR BEHAVIOUR OR 3RD INTERNATIONAL CONFERENCE ON TICKS "AND" TICK BORNE PATHOGENS INTO THE 21ST CENTURY PROCEEDINGS OR ACARID PHYLOGENY "AND" EVOLUTION ADAPTATION IN MITES "AND" TICKS OR TICKS "AND" TICK BORNE DISEASES OR 2014 IEEE INTERNATIONAL CONFERENCE ON MOOC INNOVATION "AND" TECHNOLOGY IN EDUCATION MITE OR 2015 IEEE 3RD INTERNATIONAL CONFERENCE ON MOOCS INNOVATION "AND" TECHNOLOGY IN EDUCATION MITE OR ACARID PHYLOGENY "AND" EVOLUTION ADAPTATION IN MITES "AND" TICKS OR PROCEEDINGS OF THE 2013 IEEE INTERNATIONAL CONFERENCE IN MOOC INNOVATION "AND" TECHNOLOGY IN EDUCATION MITE OR BIODIVERSITY CRISIS "AND" CRUSTACEA OR CRUSTACEAN INTEGUMENT OR CRUSTACEAN ISSUES OR CRUSTACEAN SEXUAL BIOLOGY OR CRUSTACEANA OR CRUSTACEANA MONOGRAPHS OR EXCEPTIONALLY PRESERVED CONCHOSTRACANS "AND" OTHER CRUSTACEANS FROM THE UPPER CARBONIFEROUS OF IRELAND OR FRONTIERS IN CRUSTACEAN NEUROBIOLOGY OR JOURNAL OF CRUSTACEAN BIOLOGY OR MODERN APPROACHES TO THE STUDY OF CRUSTACEA OR BIOLOGY OF TERRESTRIAL ISOPODS V PROCEEDINGS OR ISOPOD SYSTEMATICS "AND" EVOLUTION OR ACTA MYRIAPODOLOGICA OR ACTES DES COLLOQUES INSECTES SOCIAUX OR ACTES DES COLLOQUES INSECTES SOCIAUX VOL 11 OR ACTES DES COLLOQUES INSECTS SOCIAUX VOL 12 OR ADVANCES IN INSECT PHYSIOLOGY OR ADVANCES IN INSECT PHYSIOLOGY INSECT INTEGUMENT "AND" COLOUR OR ADVANCES IN INSECT PHYSIOLOGY INSECT MECHANICS "AND" CONTROL OR ADVANCES IN INSECT PHYSIOLOGY VOL 24 OR ADVANCES IN INSECT PHYSIOLOGY VOL 25 OR ADVANCES IN INSECT PHYSIOLOGY VOL 26 OR ADVANCES IN INSECT PHYSIOLOGY VOL 27 OR ADVANCES IN INSECT PHYSIOLOGY VOL 28 OR ADVANCES IN INSECT PHYSIOLOGY VOL 29 OR ADVANCES IN INSECT PHYSIOLOGY VOL 31 OR ADVANCES IN INSECT PHYSIOLOGY VOL 32 OR ADVANCES IN INSECT PHYSIOLOGY VOL 33 OR ADVANCES IN INSECT PHYSIOLOGY VOL 35 OR ADVANCES IN INSECT PHYSIOLOGY VOL 36 OR ADVANCES IN INSECT PHYSIOLOGY VOL 37 OR ADVANCES IN INSECT PHYSIOLOGY VOL 39 OR ADVANCES IN INSECT PHYSIOLOGY VOL 40 SPIDER PHYSIOLOGY "AND" BEHAVIOUR PHYSIOLOGY OR ADVANCES IN INSECT PHYSIOLOGY VOL 41 SPIDER PHYSIOLOGY "AND" BEHAVIOUR BEHAVIOUR OR ADVANCES IN INSECT PHYSIOLOGY VOL 43 INSECT GROWTH DISRUPTORS OR ADVANCES IN INSECT PHYSIOLOGY VOL 49 OR AQUATIC INSECTS OR ARCHIVES OF INSECT BIOCHEMISTRY "AND" PHYSIOLOGY OR BIOLOGICAL CONTROL OF NATIVE "OR" INDIGENOUS INSECT PESTS CHALLENGES CONSTRAINTS "AND" POTENTIAL OR BIOLOGICAL CONTROL OF SOCIAL FOREST "AND" PLANTATION CROPS INSECTS OR BULLETIN OF INSECTOLOGY OR CURRENT OPINION IN INSECT SCIENCE OR DISEASES "AND" INSECTS IN FOREST NURSERIES OR ECOLOGY "AND" EVOLUTION OF GALL FORMING INSECTS OR ECOLOGY SURVEY "AND" MANAGEMENT OF FOREST INSECTS PROCEEDINGS OR ENDOCRINE INTERACTIONS OF INSECT PARASITES "AND" PATHOGENS OR ENVIRONMENTAL IMPACTS OF MICROBIAL INSECTICIDES NEED "AND" METHODS FOR RISK ASSESSMENT OR EVALUATION OF GENETICALLY ALTERED MEDFLIES FOR USE IN STERILE INSECT TECHNIQUES PROGRAMMES OR FIELD BOUNDARY HABITATS IMPLICATIONS FOR WEED INSECT "AND" DISEASE MANAGEMENT OR FRUIT FLIES "AND" THE STERILE INSECT TECHNIQUE OR GENETICS "AND" MOLECULAR BIOLOGY OF RHYTHMS IN DROSOPHILA "AND" OTHER INSECTS OR GENOMICS PHYSIOLOGY "AND" BEHAVIOUR OF SOCIAL INSECTS OR I INTERNATIONAL SYMPOSIUM ON PYRETHRUM THE NATURAL INSECTICIDE SCIENTIFIC "AND" INDUSTRIAL DEVELOPMENTS IN THE RENEWAL OF A TRADITIONAL INDUSTRY OR INSECT OR INSECT BIOCHEMISTRY OR INSECT BIOCHEMISTRY "AND" MOLECULAR BIOLOGY OR INSECT CHEMICAL ECOLOGY OR INSECT CONSERVATION "AND" DIVERSITY OR INSECT EPIGENETICS OR INSECT EVOLUTION IN AN AMBERIFEROUS "AND" STONE ALPHABET OR INSECT HORMONES VOL 73 OR INSECT IMMUNITY OR INSECT JUVENILE HORMONE RESEARCH OR INSECT LIFE CYCLE POLYMORPHISM THEORY EVOLUTION "AND" ECOLOGICAL CONSEQUENCES FOR SEASONALITY "AND" DIAPAUSE CONTROL OR INSECT LIPIDS CHEMISTRY BIOCHEMISTRY "AND" BIOLOGY OR INSECT MIDGUT "AND" INSECTICIDAL PROTEINS OR INSECT MIGRATION TRACKING RESOURCES THROUGH SPACE "AND" TIME OR INSECT MOLECULAR BIOLOGY OR INSECT NEUROCHEMISTRY "AND" NEUROPHYSIOLOGY 1989 OR INSECT NEUROCHEMISTRY "AND" NEUROPHYSIOLOGY 1993 OR INSECT NICOTINIC ACETYLCHOLINE RECEPTORS OR INSECT PHEROMONE RESEARCH OR INSECT PHEROMONES "AND" OTHER BEHAVIOUR MODIFYING CHEMICALS APPLICATIONS "AND" REGULATION OR INSECT PLANT INTERACTIONS OR INSECT PLANT INTERACTIONS IN A CROP PROTECTION PERSPECTIVE OR INSECT POPULATIONS IN THEORY "AND" IN PRACTICE OR INSECT SCIENCE OR INSECT SCIENCE "AND" ITS APPLICATION OR INSECT SYSTEMATICS EVOLUTION OR INSECT VIRUSES BIOTECHNOLOGICAL APPLICATIONS OR INSECTES SOCIAUX OR INSECTICIDE ACTION OR INSECTICIDES MECHANISMS OF ACTION "AND" RESISTANCE OR INSECTS OR INSECTS OF WINDBREAKS "AND" RELATED PLANTINGS DISTRIBUTION IMPORTANCE "AND" MANAGEMENT OR INSECTS PLANTS 89 OR INTEGRATED MANAGEMENT "AND" DYNAMICS OF FOREST DEFOLIATING INSECTS PROCEEDINGS OR INTERNATIONAL JOURNAL OF INSECT MORPHOLOGY EMBRYOLOGY OR INTERNATIONAL JOURNAL OF TROPICAL INSECT SCIENCE OR JOURNAL OF INSECT BEHAVIOR OR JOURNAL OF INSECT CONSERVATION OR JOURNAL OF INSECT PATHOLOGY OR JOURNAL OF INSECT PHYSIOLOGY OR JOURNAL OF INSECT SCIENCE OR MECHANISMS "AND" DEPLOYMENT OF RESISTANCE IN TREES TO INSECTS OR MICROBIAL INSECTICIDES NOVELTY "OR" NECESSITY OR MOLECULAR ACTION OF INSECTICIDES ON ION CHANNELS OR MOLECULAR MECHANISMS OF INSECTICIDE RESISTANCE OR NEMATODES "AND" THE BIOLOGICAL CONTROL OF INSECT PESTS OR ORIENTAL INSECTS OR PACIFIC INSECTS OR PANICLE INSECT PESTS OF SORGHUM "AND" PEARL MILLET OR PHYTOCHEMICAL ECOLOGY ALLELOCHEMICALS MYCOTOXINS "AND" INSECT PHEROMONES "AND" ALLOMONES OR POPULATION DYNAMICS IMPACTS "AND" INTEGRATED MANAGEMENT OF FOREST DEFOLIATING INSECTS PROCEEDINGS OR PROCEEDINGS OF THE 4TH MEETING OF IUFRO WORKING PARTY 7 03 04 DISEASE "AND" INSECTS IN FOREST NURSERIES OR PROCEEDINGS OF THE FIRST MEETING OF IUFRO WORKING PARTY S2 07 09 DISEASES "AND" INSECTS IN FOREST NURSERIES OR PROGRESS "AND" PROSPECTS IN INSECT CONTROL OR PYRETHROIDS FROM CHRYSANTHEMUM TO MODERN INDUSTRIAL INSECTICIDE OR RECENT ADVANCES IN THE CHEMISTRY OF INSECT CONTROL II OR REGULATION OF INSECT REPRODUCTION IV OR STERILE INSECT TECHNIQUE FOR TSETSE CONTROL "AND" ERADICATION OR TARGET RECEPTORS IN THE CONTROL OF INSECT PESTS PT I OR TARGET RECEPTORS IN THE CONTROL OF INSECT PESTS PT II OR TRANSACTIONS OF THE CONFERENCE ON SOCIAL INSECTS OR WESTVIEW STUDIES IN INSECT BIOLOGY OR YELLOW BIOTECHNOLOGY I INSECT BIOTECHNOLOGIE IN DRUG DISCOVERY "AND" PRECLINICAL RESEARCH OR YELLOW BIOTECHNOLOGY II INSECT BIOTECHNOLOGY IN PLANT PROTECTION "AND" INDUSTRY OR COLEOPTERISTS BULLETIN OR JOURNAL OF HYMENOPTERA RESEARCH OR PROCEEDINGS OF THE SECOND INTERNATIONAL CONGRESS OF DIPTEROLOGY OR JOURNAL OF RESEARCH ON THE LEPIDOPTERA OR JOURNAL OF THE LEPIDOPTERISTS SOCIETY OR NOTA LEPIDOPTEROLOGICA OR RADIATION INDUCED F1 STERILITY IN LEPIDOPTERA FOR AREA WIDE CONTROL OR SHILAP REVISTA DE LEPIDOPTEROLOGIA OR ADVANCES IN NEUROPTEROLOGY OR PURE "AND" APPLIED RESEARCH IN NEUROPTEROLOGY OR TRANSACTIONS OF THE IX INTERNATIONAL ORTHOPTIC CONGRESS OR TRANSACTIONS OF THE VIITH INTERNATIONAL ORTHOPTIC CONGRESS OR PROCEEDINGS OF THE 13TH INTERNATIONAL SYMPOSIUM ON TRICHOPTERA OR INTERNATIONAL JOURNAL OF ODONATOLOGY OR ODONATOLOGICA OR APPLICATION OF SEMIOCHEMICALS FOR MANAGEMENT OF BARK BEETLE INFESTATIONS PROCEEDINGS OF AN INFORMAL CONFERENCE OR CARABID BEETLES ECOLOGY "AND" EVOLUTION OR INTEGRATING CULTURAL TACTICS INTO THE MANAGEMENT OF BARK BEETLE "AND" REFORESTATION PESTS PROCEEDINGS OR MOUNTAIN PINE BEETLE SYMPOSIUM CHALLENGES "AND" SOLUTIONS OR PINE BARK BEETLES OR PROCEEDINGS FROM THE THIRD WORKSHOP ON GENETICS OF BARK BEETLES "AND" ASSOCIATED MICROORGANISMS OR PROCEEDINGS OF A WORKSHOP ON BARK BEETLE GENETICS CURRENT STATUS OF RESEARCH OR PROCEEDINGS OF THE SYMPOSIUM ON MANAGEMENT OF WESTERN BARK BEETLES WITH PHEROMONES RESEARCH "AND" DEVELOPMENT OR SAPROXYLIC BEETLES THEIR ROLE "AND" DIVERSITY IN EUROPEAN WOODLAND "AND" TREE HABITATS PROCEEDINGS OF THE 5TH SYMPOSIUM "AND" WORKSHOP OR FLY OR FLY MODELS OF HUMAN DISEASES OR FLY NEUROMUSCULAR JUNCTION STRUCTURE "AND" FUNCTION SECOND EDITION OR FRUIT FLY PESTS OR ECOLOGY "AND" CONSERVATION OF BUTTERFLIES OR BRAIN DEVELOPMENT IN DROSOPHILA MELANOGRASTER OR GENETICS "AND" MOLECULAR BIOLOGY OF RHYTHMS IN DROSOPHILA "AND" OTHER INSECTS OR NEUROMUSCULAR JUNCTIONS IN DROSOPHILA OR RECENT ADVANCES IN THE USE OF DROSOPHILA IN NEUROBIOLOGY "AND" NEURODEGENERATION OR AMERICAN BEE JOURNAL OR BEE PRODUCTS OR BEE WORLD OR GLEANINGS IN BEE CULTURE OR HAZARDS OF PESTICIDES TO BEES 11TH INTERNATIONAL SYMPOSIUM OF THE ICP PR BEE PROTECTION GROUP OR HAZARDS OF PESTICIDES TO BEES 12TH INTERNATIONAL SYMPOSIUM OF THE ICP PR BEE PROTECTION GROUP OR ASIAN BEES "AND" BEEKEEPING OR BEHAVIOUR "AND" PHYSIOLOGY OF BEES OR HAZARDS OF PESTICIDES TO BEES OR HAZARDS OF PESTICIDES TO BEES 11TH INTERNATIONAL SYMPOSIUM OF THE ICP PR BEE PROTECTION GROUP OR HAZARDS OF PESTICIDES TO BEES 12TH INTERNATIONAL SYMPOSIUM OF THE ICP PR BEE PROTECTION GROUP OR ANT COLONY OPTIMIZATION "AND" SWARM INTELLIGENCE PROCEEDINGS OR ANT PLANT INTERACTIONS OR EXOTIC ANTS OR SWARM INTELLIGENCE ANTS 2012 OR SWARM INTELLIGENCE ANTS 2014 OR BIOLOGICAL CONTROL OF LOCUSTS "AND" GRASSHOPPERS OR CONTROL OF LOCUSTS OR NEW STRATEGIES IN LOCUST CONTROL OR DIAMONDBACK MOTH "AND" OTHER CRUCIFER PESTS OR ENVIRONMENTAL DAMAGE HEALTH RISKS "AND" ACTIONS TO CONTROL THE OAK PROCESSIONARY MOTH IN FORESTRY "AND" URBAN GREEN OR MANAGEMENT OF DIAMONDBACK MOTH "AND" OTHER CRUCIFER PESTS OR PROCEEDINGS US DEPARTMENT OF AGRICULTURE INTERAGENCY GYPSY MOTH RESEARCH REVIEW 1990 OR INTERNATIONAL SYMPOSIUM ON TOSPOVIRUSES "AND" THRIPS OF FLORAL "AND" VEGETABLE CROPS OR THRIPS BIOLOGY "AND" MANAGEMENT OR ACTA ENTOMOLOGICA BOHEMOSLOVACA OR ACTA ENTOMOLOGICA MUSEI NATIONALIS PRAGAE OR ACTA ENTOMOLOGICA SINICA OR ACTA ENTOMOLOGICA SLOVENICA OR ACTA PHYTOPATHOLOGICA ET ENTOMOLOGICA HUNGARICA OR AFRICAN ENTOMOLOGY OR AGRICULTURAL "AND" FOREST ENTOMOLOGY OR ANNALES DE LA SOCIETE ENTOMOLOGIQUE DE FRANCE OR ANNALES ENTOMOLOGICI FENNICI OR ANNALS OF THE ENTOMOLOGICAL SOCIETY OF AMERICA OR ANNUAL REVIEW OF ENTOMOLOGY OR ANNUAL REVIEW OF ENTOMOLOGY VOL 56 OR ANNUAL REVIEW OF ENTOMOLOGY VOL 57 OR ANNUAL REVIEW OF ENTOMOLOGY VOL 58 OR ANNUAL REVIEW OF ENTOMOLOGY VOL 59 2014 OR ANNUAL REVIEW OF ENTOMOLOGY VOL 60 OR ANNUAL REVIEW OF ENTOMOLOGY VOL 61 OR ANNUAL REVIEW OF ENTOMOLOGY VOL 62 OR ANNUAL REVIEW OF ENTOMOLOGY VOL 63 OR APPLIED ENTOMOLOGY "AND" ZOOLOGY OR AUSTRAL ENTOMOLOGY OR AUSTRALIAN JOURNAL OF ENTOMOLOGY OR BULLETIN OF ENTOMOLOGICAL RESEARCH OR CANADIAN ENTOMOLOGIST OR COMMUNICATIONS OF THE DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE VOL 8 PTS 4 6 OR COMMUNICATIONS OF THE GERMAN SOCIETY FOR GENERAL "AND" APPLIED ENTOMOLOGY VOL 12 NOS 1 6 FEB 2000 OR COMMUNICATIONS OF THE GERMAN SOCIETY FOR GENERAL "AND" APPLIED ENTOMOLOGY VOL 19 OR COMMUNICATIONS OF THE GERMAN SOCIETY FOR GENERAL "AND" APPLIED ENTOMOLOGY VOL 8 PTS 1 3 OR COMMUNICATIONS OF THE GERMAN SOCIETY FOR GENERAL "AND" APPLIED ENTOMONOLOGY VOL 9 NO 4 6 SEPTEMBER 1995 OR DEUTSCHE ENTOMOLOGISCHE ZEITSCHRIFT OR ECOLOGICAL ENTOMOLOGY OR ENTOMOLOGIA EXPERIMENTALIS ET APPLICATA OR ENTOMOLOGIA GENERALIS OR ENTOMOLOGICA AMERICANA OR ENTOMOLOGICA FENNICA OR ENTOMOLOGICA GERMANICA OR ENTOMOLOGICA SCANDINAVICA OR ENTOMOLOGICAL NEWS OR ENTOMOLOGICAL RESEARCH OR ENTOMOLOGICAL RESEARCH IN MEDITERRANEAN FOREST ECOSYSTEMS OR ENTOMOLOGICAL SCIENCE OR ENTOMOLOGY "AND" APPLIED SCIENCE LETTERS OR ENTOMOLOJI DERNEGI YAYINLARI OR ENTOMON OR ENTOMOPHAGA OR ENTORNO GEOGRAFICO OR ENVIRONMENTAL ENTOMOLOGY OR EUROPEAN JOURNAL OF ENTOMOLOGY OR EXPERIMENTAL "AND" APPLIED ENTOMOLOGY PROCEEDINGS OF THE NETHERLANDS ENTOMOLOGICAL SOCIETY N E V VOL 1 OR FLORIDA ENTOMOLOGIST OR GENETICS "AND" MOLECULAR BIOLOGY OF ENTOMOPATHOGENIC FUNGI OR GREAT LAKES ENTOMOLOGIST OR INTERNATIONAL JOURNAL OF ENTOMOLOGY OR JAPANESE JOURNAL OF APPLIED ENTOMOLOGY "AND" ZOOLOGY OR JEROME BOSCH "AND" ITS ENTOURAGE "AND" OTHER STUDIES OR JEROME BOSCH ET SON ENTOURARGE ET AUTRES ETUDES OR JOURNAL OF AGRICULTURAL "AND" URBAN ENTOMOLOGY OR JOURNAL OF AGRICULTURAL ENTOMOLOGY OR JOURNAL OF APPLIED ENTOMOLOGY OR JOURNAL OF APPLIED ENTOMOLOGY ZEITSCHRIFT FUR ANGEWANDTE ENTOMOLOGIE OR JOURNAL OF ASIA PACIFIC ENTOMOLOGY OR JOURNAL OF ECONOMIC ENTOMOLOGY OR JOURNAL OF ENTOMOLOGICAL SCIENCE OR JOURNAL OF ENTOMOLOGY SERIES A GENERAL ENTOMOLOGY OR JOURNAL OF ENTOMOLOGY SERIES A PHYSIOLOGY BEHAVIOUR OR JOURNAL OF ENTOMOLOGY SERIES B TAXONOMY OR JOURNAL OF ENTOMOLOGY SERIES B TAXONOMY SYSTEMATICS OR JOURNAL OF MEDICAL ENTOMOLOGY OR JOURNAL OF THE AUSTRALIAN ENTOMOLOGICAL SOCIETY OR JOURNAL OF THE ENTOMOLOGICAL RESEARCH SOCIETY OR JOURNAL OF MEDICAL ENTOMOLOGY OR JOURNAL OF THE ENTOMOLOGICAL SOCIETY OF SOUTHERN AFRICA OR JOURNAL OF THE GEORGIA ENTOMOLOGICAL SOCIETY OR JOURNAL OF THE KANSAS ENTOMOLOGICAL SOCIETY OR JOURNAL OF THE NEW YORK ENTOMOLOGICAL SOCIETY OR LATIN AMERICAN PROJECT ON BIOGEOGRAPHY "AND" SYSTEMATIC ENTOMOLOGY OR MEDICAL "AND" VETERINARY ENTOMOLOGY OR MEMOIRS OF THE ENTOMOLOGICAL SOCIETY OF CANADA OR MESSAGES FROM THE GERMAN SOCIETY FOR GENERAL "AND" APPLIED ENTOMOLOGY VOL 18 OR MITTEILUNGEN DER DEUTSCHEN GESELLSCHAFT FUER ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE OR MITTEILUNGEN DER DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND AGEWANDTE ENTOMOLOGIE BAND 11 HEFT 1 6 DEZEMBER 1997 OR MITTEILUNGEN DER DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE OR MITTEILUNGEN DER DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE BAND 10 HEFT 1 6 DEZEMBER 1995 OR MITTEILUNGEN DER DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE BAND 12 HEFT 1 6 FEB 2000 OR MITTEILUNGEN DER DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE BAND 9 HEFT 1 3 1994 OR MITTEILUNGEN DER DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE BD 18 OR MITTEILUNGEN DER DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE BD 19 OR MITTEILUNGEN DER DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE BD 20 OR MITTEILUNGEN DER DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE VOL 16 OR NEOTROPICAL ENTOMOLOGY OR NEW ZEALAND ENTOMOLOGIST OR PAN PACIFIC ENTOMOLOGIST OR PAPERS FROM THE DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE VOL 7 PTS 1 3 OR PAPERS FROM THE DEUTSCHEN GESELLSCHAFT FUR ALLGEMEINE UND ANGEWANDTE ENTOMOLOGIE VOL 7 PTS 4 6 OR PHYSIOLOGICAL ENTOMOLOGY OR PRIBES 2000 PROYECTO IBEROAMERICANO DE BIOEGOGRAFIA Y ENTOMOLOGIA SISTEMATICA OR PROCEEDINGS OF THE ENTOMOLOGICAL SOCIETY OF ONTARIO OR PROCEEDINGS OF THE ENTOMOLOGICAL SOCIETY OF WASHINGTON OR PROCEEDINGS OF THE HAWAIIAN ENTOMOLOGICAL SOCIETY OR PROCEEDINGS OF THE ROYAL ENTOMOLOGICAL SOCIETY OF LONDON SERIES A GENERAL ENTOMOLOGY OR PROCEEDINGS OF THE ROYAL ENTOMOLOGICAL SOCIETY OF LONDON SERIES B TAXOMONY OR PROCEEDINGS OF THE SECTION EXPERIMENTAL "AND" APPLIED ENTOMOLOGY OF THE NETHERLANDS ENTOMOLOGICAL SOC NEV VOL 4 1993 OR PROCEEDINGS OF THE SECTION EXPERIMENTAL "AND" APPLIED ENTOMOLOGY OF THE NETHERLANDS ENTOMOLOGICAL SOCIETY N E V VOL 11 1999 OR PROCEEDINGS OF THE SECTION EXPERIMENTAL "AND" APPLIED ENTOMOLOGY OF THE NETHERLANDS ENTOMOLOGICAL SOCIETY N E V VOL 2 1991 OR PROCEEDINGS OF THE SECTION EXPERIMENTAL "AND" APPLIED ENTOMOLOGY OF THE NETHERLANDS ENTOMOLOGICAL SOCIETY N E V VOL 3 1992 OR PROCEEDINGS OF THE SECTION EXPERIMENTAL "AND" APPLIED ENTOMOLOGY OF THE NETHERLANDS ENTOMOLOGICAL SOCIETY N E V VOL 5 1994 OR PROCEEDINGS OF THE SECTION EXPERIMENTAL "AND" APPLIED ENTOMOLOGY OF THE NETHERLANDS ENTOMOLOGICAL SOCIETY N E V VOL 6 1995 OR PROCEEDINGS OF THE SECTION EXPERIMENTAL "AND" APPLIED ENTOMOLOGY OF THE NETHERLANDS ENTOMOLOGICAL SOCIETY N E V VOL 7 1996 OR PROCEEDINGS OF THE SECTION EXPERIMENTAL "AND" APPLIED ENTOMOLOGY OF THE NETHERLANDS ENTOMOLOGICAL SOCIETY N E V VOL 8 1997 OR PROCEEDINGS OF THE SECTION EXPERIMENTAL "AND" APPLIED ENTOMOLOGY OF THE NETHERLANDS ENTOMOLOGICAL SOCIETY NEV OR PROCEEDINGS OF THE XXIV NORDIC CONGRESS OF ENTOMOLOGY OR REPORT OF THE GERMAN SOCIETY FOR GENERAL "AND" APPLIED ENTOMOLOGY OR REVISTA BRASILEIRA DE ENTOMOLOGIA OR REVISTA COLOMBIANA DE ENTOMOLOGIA OR REVISTA DE LA SOCIEDAD ENTOMOLOGICA ARGENTINA OR SERIES ENTOMOLOGICA OR SOUTHWESTERN ENTOMOLOGIST OR SYSTEMATIC ENTOMOLOGY OR THOMAS SAY PUBLICATIONS IN ENTOMOLOGY PROCEEDINGS OR TRANSACTIONS OF THE AMERICAN ENTOMOLOGICAL SOCIETY OR TRANSACTIONS OF THE ROYAL ENTOMOLOGICAL SOCIETY OF LONDON OR TURKIYE ENTOMOLOJI DERGISI TURKISH JOURNAL OF ENTOMOLOGY OR ZEITSCHRIFT FUR ANGEWANDTE ENTOMOLOGIE JOURNAL OF APPLIED ENTOMOLOGY OR BIOCONTROL OR BIOCONTROL SCIENCE OR BIOCONTROL SCIENCE "AND" TECHNOLOGY OR ENHANCING BIOCONTROL AGENTS "AND" HANDLING RISKS OR RECENT DEVELOPMENTS IN BIOCONTROL OF PLANT PATHOGENS OR ADVANCES IN AGROCHEMICALS ION CHANNELS "AND" G PROTEIN COUPLED RECEPTORS GPCRS AS TARGETS FOR PEST CONTROL VOL 1 ION CHANNELS "AND" GAP JUNCTIONS OR ADVANCES IN AGROCHEMICALS ION CHANNELS "AND" G PROTEIN COUPLED RECEPTORS GPCRS AS TARGETS FOR PEST CONTROL VOL 2 GPCRS "AND" ION CHANNELS OR ADVANCES IN POTATO PEST OR ANZEIGER FUR SCHADLINGSKUNDE JOURNAL OF PEST SCIENCE OR BIORATIONAL PEST CONTROL AGENTS OR BIOREGULATORS FOR CROP PROTECTION "AND" PEST CONTROL OR BOTYU KAGAKU SCIENTIFIC PEST CONTROL OR CANADIAN PEST MANAGEMENT SOCIETY PROCEEDINGS OR EGYPTIAN JOURNAL OF BIOLOGICAL PEST CONTROL OR EMERGING TECHNOLOGIES FOR INTEGRATED PEST MANAGEMENT OR FIFTEENTH VERTEBRATE PEST CONFERENCE PROCEEDINGS OR FOREST PEST MANAGEMENT INSTITUTE INFORMATION REPORT OR FOURTEENTH VERTEBRATE PEST CONFERENCE OR I INTERNATIONAL CONFERENCE ON POSTHARVEST PEST "AND" DISEASE MANAGEMENT IN EXPORTING HORTICULTURAL CROPS PPDM2012 OR IDENTIFICATION "AND" CHARACTERIZATION OF PEST ORGANISMS OR INTEGRATED PEST MANAGEMENT IN THE SAHEL OR INTERNATIONAL JOURNAL OF PEST MANAGEMENT OR JOURNAL OF INTEGRATED PEST MANAGEMENT OR JOURNAL OF PEST SCIENCE OR LIGHT ACTIVATED PEST CONTROL OR NATURAL "AND" ENGINEERED PEST MANAGEMENT AGENTS OR NATURALLY OCCURING PEST BIOREGULATORS OR NEUROPEPTIDE SYSTEMS AS TARGETS FOR PARASITE "AND" PEST CONTROL OR NINETEENTH VERTEBRATE PEST CONFERENCE PROCEEDINGS OR PEST CONTROL OR PEST CONTROL INTO THE 90S PROBLEMS "AND" CHALLENGES OR PEST CONTROL SUSTAINABLE AGRICULTURE OR PEST MANAGEMENT "AND" THE AFRICAN FARMER OR PEST CONTROL WITH ENHANCED ENVIRONMENTAL SAFETY OR PEST MANAGEMENT "AND" THE AFRICAN FARMER OR PEST MANAGEMENT "AND" THE ENVIRONMENT IN 2000 OR PEST MANAGEMENT FUTURE CHALLENGES VOLS 1 "AND" 2 PROCEEDINGS OR PEST MANAGEMENT SCIENCE OR PEST MANAGEMENT WITH NATURAL PRODUCTS OR PESTICIDES "AND" ALTERNATIVES INNOVATIVE CHEMICAL "AND" BIOLOGICAL APPROACHES TO PEST CONTROL OR PHYTOCHEMICALS FOR PEST CONTROL OR PROCEEDINGS CONE "AND" SEED PEST WORKSHOP OR PROCEEDINGS OF THE FORTY FOURTH NEW ZEALAND WEED "AND" PEST CONTROL CONFERENCE OR PROCEEDINGS OF THE FORTY SECOND NEW ZEALAND WEED "AND" PEST CONTROL CONFERENCE 1989 OR PROCEEDINGS OF THE FORTY THIRD NEW ZEALAND WEED "AND" PEST CONTROL CONFERENCE OR PROCEEDINGS OF THE NEW ZEALAND WEED "AND" PEST CONTROL CONFERENCE OR PROCEEDINGS OF THE THIRTY NINTH ANNUAL MEETING OF THE CANADIAN PEST MANAGEMENT SOCIETY OR PROCEEDINGS OF THE VIITH INTERNATIONAL SYMPOSIUM ON PROTECTED CULTIVATION IN MILD WINTER CLIMATES PRODUCTION PEST MANAGEMENT "AND" GLOBAL COMPETITION VOLS 1 "AND" 2 OR PROCEEDINGS VERTEBRATE PEST CONFERENCE OR PROFESSIONAL SOCIETIES "AND" ECOLOGICALLY BASED PEST MANAGEMENT PROCEEDINGS OR SIXTEENTH VERTEBRATE PEST CONFERENCE OR SUCCESSFUL IMPLEMENTATION OF INTEGRATED PEST MANAGEMENT FOR AGRICULTURAL CROPS OR TROPICAL PEST MANAGEMENT OR TWENTIETH VERTEBRATE PEST CONFERENCE PROCEEDINGS OR WHITEFLIES THEIR BIONOMICS PEST STATUS "AND" MANAGEMENT OR WORLD REVIEW OF PEST CONTROL )

We screened the titles of the 2748 articles to filter out articles which were clearly not suited for meta-analysis (e.g. not based on terrestrial invertebrates), which reduced the dataset to 621 articles. We then assessed the full text of the articles, and excluded all articles with less than 3 populations or less than 3 day lengths measured. 74 articles remained.

we did a forward citation search on these 74 articles on jul 16 2018 and found 866 articles (609 new references, 257 duplicates from earlier search). We filtered again by title, after which 197 references remained. 197 references were appropriate based on their title, and 3 articles measured at least 3 populations and day lengths (based on full text). Another forward citation search on these 3 articles on July 23th 2018 revealed 73 unique articles, including 36 novel references (not duplicates of earlier search), but none of these were relevant. In total, we found 77 articles. 


#### comparison
The 75 articles found by the first search included 5 false positives, and the 77 articles from the second search included 7 false positives. Thus, 70 references remained in each search. After combining these two datasets, 78 unique articles (624 populations) remained. 


#### inclusion

we received data for 2 studies (kimura_geogr and kimura_BJLS) on 14.11.2018. this changes the numbers a bit, so the numbers below are slightly off.
We additionally received data for ichijo on 17.11.2018

Multiple articles did not contain raw data or figures, or the raw data in figures was not unambigously linked to the populations (use of same symbols for all populations). In 12 cases the data could not be retrieved (todo), and the studies had to be removed from analysis (179 populations). 445 populations remained.
9 articles (52 populations) had only three day lengths, and this is not enough to calculate the slope. 
The calculation of reliable slope estimates required in general at least four day length measurements, with two points on the sloped part of the reaction norm and two points defining upper and lower limits (though upper or lower limits could be imputed in 3 cases; see below).
24 studies (98 populations) did not fulfil these requirements for three populations and were removed. Moreover, 106 of the remaining 295 populations were removed, leaving 33 studies with 189 populations.



### drc analysis

the following models were applied on each study (sorted by plausibility):

1. upper and lower parameter fixed at study mean (requires 2 df plus 2 df per population)
2. upper parameter fixed (requires 1 df plus 3 per population)
3. lower parameter fixed (requires 1 df plus 3 per population)
4. both limits vary (requires 4 df per population)

 We recorded the standard error along with the estimates of slope, inflection point and upper and lower limits, using a robust sandwich estimation method (Zeileis, 2006). 

Three studies lacked vital data on upper or lower limits for some focal populations, but contained further populations that were excluded for lack of points on the sloped part.  These other populations showed unambigously that the lower and upper limits were 0 and 100%. In these cases we performed a 2-parameter drc (with limits from 0-100%) to allow inclusion of the incomplete populations. 

During analysis we removed 7 studies (21 populations) and 22 further populations, because the fitted curves did no longer match the inclusion criteria (2 points on sloped part). 25 Studies and 139 populations were left. We added the study with 7 populations, which provided estimates of mean and slope directly, levaing 26 studies and 146 populations.

table of all decisions made:
i|study         |best   |chosen |impossible   |notes
1|chen          |1,3,4  |1      |
2|gomi          |LL.2   |LL.2   |all          |mod 1 would have missing data for 2 pops
3|gotoh         |3                            |consider removing ishikawa     
4|hashimoto     |1,3    |1                    |nagaoka and okayama removed            
5|ito           |2,4    |2                    |WA removed
6|kimura_geogr_1|4      |3                    |ON,OI and MY removed;drm3 used despite deltaAIC = 5, because evidence from 3 further pops for common c
7|kimura_geogr_2|1,2,3  |1                    |IW removed
8|koveos        |4                            |thessaloniki1 and padua removed
9|kurota        |3    |3      |4   
10|lankinen     |3    |3      |             |evidence for 1/3 from 8 further pops; dietikon2 removed
11|lehmann      |NA    |NA      |             |removed
12|lumme        |2,4  |2
13|lushai       |NA  |NA                      |removed
14|murata       |NA    |NA                      |removed
15|musolin      |NA   |NA                     |removed
16|nechols      |LL.2 |LL.2                 |mod 1 would have NA for 1 pop, evidence from 7 further pops
17|paolucci     |1-4  |1                    |SCH looks odd
18|riihima      |2    |2      |             |removed oulo2
19|ryan         |1,2,3|1      |4
20|shimizu      |3,4  |3                    |SPR removed
21|shintani     |LL.2 |LL.2                 |mod1 would have NAs, evidence from 8 further pops
22|shroyer      |2    
23|so           |NA   |NA                   |removed
24|suwa         |1    |1      |             |removed all pops except 7,10,16,20; consider removing completely
25|tyukmaeva    |3,4  |3                    |removed lathi1,lathi3
26|ujiye        |NA    |NA      |NA         |removed
27|urbanski     |3    |3      |4              |1 and 2 without box constraints (bc fit is soo bad), 4 has NA for 1 pop
28|vaznunes     |3    |3      |4            |removed S1,S2,T2
29|wang         |1,3  |1
30|yoshida      |3    |3
31|kimura_evol  |NA   |NA                   |removed
32|takeda       |1,3,4|1                    |consider removing
33|noda         |3    |3      |             |removed dl<9; removed ishigaki
34|kimura_BJLS  |1    |1                    |
35|kimura_BJLS_2|3    |3                    |removed Setana
36|kimura_BJLS_3|1,3  |1
37|kimura_BJLS_4|1,2,3|1
38|ichijo       |3    |3                    |removed SA, ON


Our strict inclusion criteria ensured that all 162 populations have at least two data points on the sloped part. However, populations with data only at the extremes of the slope (e.g. 5% and 95%) nevertheless resulted in unrealistically low standard errors. The inverse variance, which is needed to determine the weight of each study, hence ranged over 5 orders of magnitude (10^0 - 10^(-5)), with lowest values mostly on the least reliable studies.
We looked at funnel plots (s.e. vs residuals of the models 1) CDL~lat, random = ID/genus/order, unit weight; 2) slope ~ 1, same random, unit weight), and they showed that points with high standard errors spread less around expectation than points with low standard errors (i.e. the funnel goes wrong way). especially for slope estimates with s.e. between 0 and 20. For higher s.e. it becomes better (spread proportional to s.e.)

Constraining the analysis to populations with three data points on the sloped part would bias the selection to populations with flat slopes, while halving the dataset and not fully mitigating the problem. Instead, we capped the inverse variance at 10 times the median inverse variance. This affected 15 populations for the slope estimates, 

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

[this is before  integration of kimuras data]
 
We tried a different weighing, based on the no. of points on the sloped part. We counted all points on sloped part plus first point on the upper and lower limit. These are the points that mostly define shape of drc. It was manually done by counting the points on the fittted curves.These funnel plots look much better, because they are in the right direction now. The shading "funnel" is missing in these plots, because it cannot be calculated with sample sizes only. See also ?funnel. 

 

#### analysis

The correct statistical approach should be:

estimate ~ climate data, random = (order/genus/species/study), 

with the estimate weighted by the inverse of its variance. The funnel plots showed however that inverse variance does not work, so I take the number of points on the sloped part as sample-size weighing (see manuscript and drc script). Usually meta-analyses are conducted with metafor, because this package can weigh each data point by its inverse variance, whereas lme/lmer make the weights proportional to an unknown constant. In this case the lme/lmer version is correct though, because the sample size should be only proportional to inverse variance. This means however that I² calculation is not possible. I tried both lme and metafor. Estimates and relative contributions of each random level were similar, as were LRT test results. 


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
