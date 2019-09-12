
# Description of this file  
This file consists of the methods from the manuscript preprint. This section is updated only sporadically and may be outdated. Methods that were abandoned are in a separate script (unused.md).


# Empirical data  

## Literature search  
In our literature search for diapause reaction norms we concentrated on studies that measure photoperiodic response curves of terrestrial arthropods, though invertebrates with a larval stage in shallow water (e.g. mosquitoes) were also included. We only used studies with estimates for at least three populations and four photoperiods. To maximize sample sizes, we did not restrict our analysis to any geographic location or publication language.
We conducted two independent literature searches in the Web of Science core collection (see Figure lit_search/prismascheme.png). First (26.11.2018) we limited the search terms to:   
TS = ((photoperiodic AND (geogr\* OR range)) OR (photoperiod\* AND latitud\*) OR (photoperiod\* AND longitud\*))  
We found 1683 references in the first search, of which we judged 278 potentially relevant, and 57 met all eligibility criteria. Secondly (28.11.2018), we used a wider range of search terms,  
TS = (("day length" OR photoperiod\* OR diapaus\* OR hibern\* OR dorman\*) AND (geogr\* OR "range" OR latitud\* OR longitud\* OR cline$ OR clinal))  
but excluded all articles that were found in the first search, as well as all review articles, retractions and corrections. We then filtered the 6179 results by research area and invertebrate-related terms. The original search strings can be found in supplementary Material S6. In short, we included:  
1.	all entomological articles (600 articles)  
2.	articles with invertebrate taxa (75 terms) named in title, keywords or abstract (838 articles)  
3.	zoological articles that name no vertebrate (61 terms) in the title (186 articles)  
4.	articles from ecology, evolutionary biology and genetics which name no vertebrate, plant or microbe (80 terms) in their title (523 articles).  
5. 	articles from relevant other topics (11 topics) that name no human psychological condition, vertebrate, plant or microbe (85 terms) in their title (267 articles)  
From these 2414 articles we excluded all references that name aquatic environments, unless they also named terrestrial environments. 2362 articles remained, with 355 potentially relevant and 13 eligible articles. We did a forward-citation search on the 70 eligible articles of both searches on 4.12.2018 and found 790 new references, which included 117 potential and 4 eligible articles. A second forward-citation search on these four articles on 5.12.2018 brought 118 new articles, but none were relevant. One further article was found to be wrongly tagged as negative after the search was closed. Altogether there were 75 useful references (623 populations).

## Inclusion criteria    
12 articles (147 populations) were excluded because they were not accompanied by raw data, tables or figures that allowed further analysis, and the authors were deceased, did no longer have the raw data or did not respond to our emails. We further removed six articles (26 populations) that were otherwise not usable. From the remaining 57 studies we removed 43 further individual populations with less than three day length measurements, and five populations from the southern hemisphere, so 402 populations remained. Because some studies reported reaction norms for multiple lines from the same population, there were 447 reaction norms available, and these 447 reaction norms consisted of 3035 individual data points.
 

## Data extraction  
The reaction norms in 49 of the 57 studies were presented as figures. In these cases we saved the figure and extracted the data with WebPlotDigitizer Version 3.12 (Rohatgi, 2017). Where necessary, the day length was then rounded or corrected to match the description in materials and methods of the respective study. Y-values that were slightly above 100% or below 0% were set to 100% and 0% respectively.
Detailed information on numbers of individuals per day length estimate were rarely available (97 reaction norms), as numbers were either given as population-level means (26 reaction norms), as global average or range (291 reaction norms), or missed entirely (33 reaction norms). We wish to emphasize that a lack of detailed information should not be confused with an unweighted (vote-count) meta-analysis, because the sample size (day lengths per population) was always known. Rather, the missing information occurred on a lower level (points within population) than the level of replication (population). Where the data was provided, we recorded it for later weighing of the data points.

## Calculation of mean and variance composition
The published reaction norms reported the change of diapause percentages with day length. Day length depends, however, on latitude, and thus is not a direct indicator of phenology. Hence, we converted day lengths into julian days, by using the reported latitude of the sampling location and the daylength function from the package geosphere (Hijmans, 2017). For 310 reaction norms one or more day length treatments were outside naturally occurring day lengths given the latitude in which the populations were sampled. 588 day length treatments were longer than midsummer days and 140 were shorter than midwinter days; in total this affected 728 day length treatments, or 24% of the data. We assumed that these artificial day lengths represent diapause incidence at midsummer and midwinter, respectively, but removed 22 reaction norms that became severely distorted by this assumption. All further analysis except the correlation of critical photoperiod with latitude are based on the converted reaction norms. 

We specified the reaction norm shape via four parameters:

p(x)=c+((d-c) )/(1+exp^((b\*(x-e)))) 						(eq. 1)

In this equation p(x) is the frequency of diapausing individuals under julian day x. e influences the inflection point of the curve, and hence directly represents the axis mean. c and d indicate the lower and upper diapause threshold, and b is the slope of the curve. The variance composition can then be defined as the ratio of variance between and among environments (Fig. 1). The variance within each environment is that of a Bernoulli draw: px\* (1-px). Because a reaction norm consists of multiple p along an environmental gradient (day length treatments), we define the variance within environments as: 

s\_within^2 = sum(px\*(1-pi))/n	; n = number of treatments			(eq. 2) 

s\_within^2 constitutes a potential diversified bet-hedging trait and is maximized by a flat reaction norm at the 0.5 level. 
We define the variance among treatments as the squared standard deviation,

s\_among^2 = sum( (px -pxmean)^2)/n							(eq.3)

This component may represent phenotypic plasticity and is maximized by a steep reaction norm. The variance composition can then be defined as the ratio of the two components: 

r=  (s\_among^2)/(s\_among^2+ s\_within^2 ) 							(eq. 4)

Lastly, phenotypic variance describes the magnitude of phenotypic variation, and can be regarded the sum of the two variance components,

s\_P^2= s\_among^2+ s\_within^2						(eq. 5)

Phenotypic variance is zero for flat reaction norms at the 0 % level, and increases as the phenotype move away from 0% in some (s\_among^2) or all (s\_within^2) environments.  
We derived midpoints and variance composition from reaction norms, but the data was relatively scarce (on average seven data points per reaction norm). Hence standard non-linear regression techniques did not always yield reasonable estimates, for example the slope could not be estimated when there was only one data point present on the sloped part of the reaction norm. Nevertheless, the range of the possible parameter space can be estimated with Markov chain Monte Carlo methods. We thus estimated the 4-dimensional credible parameter space and calculated the variance components based on this parameter space.

## MCMC specifications  
We used rjags (Plummer, 2018) to run Markov chain simulations on each of the 447 reaction norms. We ran 4 replicate chains with lengths of 11,000 iterations and discarded a burn-in of 1,000 iterations. We specified our model with (eq. 1), and consequently chose the binomial density function to estimate the likelihood. If specified in the primary study, we used the sample sizes of each day length treatment as number of trials, otherwise we used the global average of the study. For those studies that did not mention sample sizes, we used a global average of 100 trials for each of the data points. We implemented uninformative priors for all four parameters. These were:

b ~ unif {-100, 100}
c ~ unif {0, 1}
d ~ unif {c, 1}
e ~ unif {Dmin, Dmax}, with Dmin and Dmax being the range of applied day length treatments, converted in julian days. 

The upper limit of the logit-function was constrained to be higher than the lower limit, because otherwise switching between the two equal solutions (positive slope, d > c and negative slope, c < d) would render the chain unidentifiable. Despite the relative data scarcity, the four replicate Marcov chains mixed well in nearly all cases, providing a well-defined frequency distribution (Supp S2). We repeated the analyses on the untransformed day length reaction norms to obtain a critical day length estimate that is comparable to those obtained in earlier studies.

The MCMC algorithms provided a 4-dimensional parameter space to define continuous reaction norms, and we calculated the variance components of those curves that fall within the credible intervals. To do so, we followed the trace of the MCMC algorithm. For each iteration step we sampled 1000 equally spaced day lengths around the proposed inflection point e ± 100 days, and performed the variance calculations (eq. 2-5) on the proposed parameters b,c,d and e. Following the logic of the MCMC algorithm, we reported the 0.025 and 0.975 quantiles of the resulting frequency distribution as credible intervals. 

# 2. climate data  
We used land surface temperature data from the Global Historical Climatology Network GHCN-Daily (Menne et al., 2012a,b). We extracted daily minimum and maximum temperatures from ~34,000 climate stations and then calculated daily mean temperature as the average of the extremes. After cleaning the data to stations in the northern hemisphere and with at least 3 years of data with 180 temperature records, the data consisted of 10,991,727 months (3-244 years) in 26,804 climate stations. 
To estimate winter onset in each year and station, we identified cold days with average temperatures below 10°C. We then determined winter onset as the fifth cold day after midsummer. Years in which winter did not arrive according to this definition were excluded, and stations with less than 3 years with winter onset removed. We calculated a weighted mean winter onset and a frequency weighed standard deviation of winter onset to account for differences in reliability (days with eligible data) across years. We obtained 25,340 estimates of mean winter onset, day length at winter onset and winter predictability in the northern hemisphere.
Initial data handling was performed with a perl script, whereas all further analysis was conducted in R version 3.4.3 (R Core Team), using R base functions and convenience functions (Bache & Wickham, 2014; Dowle & Srinivasan, 2017; Rinker, 2017; Wickahm, 2017; Becker et al., 2018; Duncan Temple Lang and the CRAN team, 2018; Garnier, 2018).

 
## Merging with empirical data  
To combine climate data and study site locations, we averaged the climate estimates from the 5 closest stations within a 5° radius (weighted by 1/Euclidian distance). When the coordinates were not directly provided in the study, we used the coordinates of the quoted town or area. Town and area coordinates were made available by the WikiProject Geographical coordinates (https://en.wikipedia.org/wiki/Wikipedia:WikiProject_Geographical_coordinates) and the Geohack tool (https://www.mediawiki.org/wiki/GeoHack). 10 populations did not have any climate station nearby and were only used for correlations with latitude, but not in any further analysis.

# 3. Analysis  
We used linear mixed-effects models with a nested random structure (Viechtbauer, 2010) to correlate the reaction norm properties with climate variables. The random effects were nested on five levels (population/study/species/genus/order), but we simplified the random structure to populations/species/order, ignoring both study ID and genus. Study ID was disregarded because most species were only represented by a single study, and those species that were represented by multiple studies usually contained the same first or lead authors and applied the same methods (Table 1). Genus was disregarded because there were either only very few genera per order available (e.g. Diptera), or all species within an order were placed in different genera (Lepidoptera, Table 1). We weighed the reaction norm estimates by the inverse of the variance (credible interval ranges, divided by 2\*1.96 and squared), but truncated the intervals at the lower limit to a biologically meaningful value to prevent some estimates from obtaining nearly infinite weight. 

 
We performed the following models (credible interval truncation in brackets):
0a) Critical photoperiod was correlated with latitude, using the day length reaction norms (10 minutes)
0b) Mean diapause timing was correlated with latitude, using the julian day reaction norms (1 week)
1) arithmetic mean optimization: Mean diapause timing was correlated with mean winter onset (1 week)
2) phenotypic plasticity / diversified bet-hedging: The ratio of the variances (e.q. 4) was correlated with winter predictability (5%)
3) conservative bet-hedging: the residuals of model 1 were correlated with winter predictability (5%). 
We used the full dataset (447 reaction norms) for model 0a), but removed all reaction norms that were not convertible into julian days or had no nearby climate stations (415 remaining) for all other models. 
We assumed a gaussian distribution for all models, though we logit-transformed variance ratios prior to analysis. For all models we report partial R² values, calculated as proportion of variance reduction at each random level. This is an extension of a commonly used pseudo-R² value (Raudenbush, 2009). In addition, we provide likelihood ratio test statistics. Model 3 was conducted without the nested random terms, because their effect was already accounted for by model 1.  

 
## Sensitivity of climate predictions to temperature threshold  
Arthropod thermal requirements vary among species, and our use of a 10°C temperature threshold was an arbitrary decision. It resulted in a global median winter onset around Oct 11, which is within the range of commonly reported phenological windows and threshold values (Halkett et al., 2004; Waldock et al., 2013). To explore the sensitivity of our meta-analysis to the arbitrary threshold, we systematically varied it between 0 and 15°C, and calculated the R² profiles of models 1 and 2.
 


# Supplementary material S6: Search terms  
```text
Below are the exact search terms, with search ID and number of hits.
#1 TS = ((photoperiodic AND (geogr* OR range)) OR (photoperiod* AND latitud*) OR (photoperiod* AND longitud*)) 1684
	#2 (TS = (("day length" OR photoperiod* OR diapaus* OR hibern* OR dorman* ) AND (geogr* OR "range" OR latitud* OR longitud* OR cline$ OR clinal)) not #1) AND DOCUMENT TYPES: (Article OR Abstract of Published Item OR Art Exhibit Review OR Bibliography OR Biographical-Item OR Book OR Book Chapter OR Book Review OR Chronology OR Dance Performance Review OR Data Paper OR Database Review OR Discussion OR Early Access OR Editorial Material OR Excerpt OR Fiction, Creative Prose OR Film Review OR Hardware Review OR Item About an Individual OR Letter OR Music Performance Review OR Music Score OR Music Score Review OR News Item OR Note OR Poetry OR Proceedings Paper OR Record Review OR Reprint OR Script OR Software Review OR TV Review, Radio Review OR TV Review, Radio Review Video OR Theater Review) 6179

#3 #2 and SU = "entomology" 600
	#4 #2 not #3 AND TS =(invertebrat* OR worm* OR annelid* OR platyhelminth* OR nematod* OR mollusc* OR gastropod* OR slug* OR snail* OR arthropod* OR chelicer* OR arachnid* OR aranea* OR acari OR tetranych* OR ixod* OR opilion* OR spider* OR *scorpio* OR tick$ OR mite$ OR harvestmen OR crustace* OR malostraca* OR isopod* OR woodlice OR oniscid* OR armadillium OR myriapod* OR chilopod* OR diplopod* OR pauropod* OR symphyla OR millipede* OR centipede* OR hexapod* OR collembol* OR springtail* OR insect$ OR blattodea OR *ptera OR mantodea OR odonata OR phasmatodea OR psocodea OR thysanura OR zygentoma OR psyllid* OR stenorrhyn* OR cockroach* OR beetle$ OR earwig* OR *fly OR *flies OR droso* OR mosquit* OR *bug$ OR aphid* OR adelgid* OR phyllox* OR *wasp$ OR (*bee OR *bees) OR (ant OR ants) OR mantis OR grasshopper* OR locust* OR cricket* OR louse OR lice OR flea$ OR moth$ OR thrip* OR silverfish ) NOT TI = (paleo* or $chiroptera*)  838

	#5 #2 not #3 not #4 AND SU = "Zoology" NOT TI =( palaeo* OR $vertebra* OR *fish* OR $amphib* OR $salientia* OR $anura* OR $caudata OR $salamand* OR newt$ OR $gymnophion* OR frog$ OR tadpole$ OR toad$ OR $reptil* OR $crocodil* OR *sauria* OR $squamat* OR $lizard* OR $lacert* OR $gekko* OR $serpent* OR $snake* OR $testudin* OR $turtle* OR $tortois* OR $mammal* OR $rodent* OR $sciurid* OR $hamster* OR *mouse* OR *mice* OR $squirrel* OR $rabbit* OR $hare OR $hares OR $chiropt* OR $bat OR $bats OR $myotis OR $sorciomorpha OR $soricid* OR $talpid* OR $shrew* OR $marmot* OR $mole OR $moles OR $primat* OR $carnivora OR $ursid* OR $ursus OR $felid OR $felids OR "$sea lion" OR "$fur seal" OR "$elephant seal" OR $marsupi* OR $goat* OR $sheep* OR $deer OR $cattle OR estrus OR suprachiasm*) 186

	#6 #2 not #3 not #4 AND SU = (ENVIRONMENTAL SCIENCES ECOLOGY OR EVOLUTIONARY BIOLOGY OR GENETICS HEREDITY OR BIODIVERSITY CONSERVATION OR SOIL SCIENCE NOT Zoology) NOT TI = ( palaeo* OR $vertebra* OR *fish* OR $amphib* OR $salientia* OR $anura* OR $caudata OR $salamand* OR newt$ OR $gymnophion* OR frog$ OR tadpole$ OR toad$ OR $reptil* OR $crocodil* OR *sauria* OR $squamat* OR $lizard* OR $lacert* OR $gekko* OR $serpent* OR $snake* OR $testudin* OR $turtle* OR $tortois* OR $mammal* OR $rodent* OR $sciurid* OR $hamster* OR *mouse* OR *mice* OR $squirrel* OR $rabbit* OR $hare OR $hares OR $chiropt* OR $bat OR $bats OR $myotis OR $sorciomorpha OR $soricid* OR $talpid* OR $shrew* OR $marmot* OR $mole OR $moles OR $primat* OR $carnivora OR $ursid* OR $ursus OR $felid OR $felids OR "$sea lion" OR "$fur seal" OR "$elephant seal" OR $marsupi* OR $goat* OR $sheep* OR $deer OR $cattle OR estrus OR suprachiasm*OR microb* OR bacteria* OR fung* OR *ceae OR bloom OR yield OR germination OR molecular OR simulation OR QTL OR spring OR cell* OR tiller OR cultivar* OR bud* OR chill* OR (tree NEAR phenology)) 523

	#7 #2 not #3 not #4 not #5 not #6 NOT SU = (ENTOMOLOGY OR ZOOLOGY OR ENVIRONMENTAL SCIENCES ECOLOGY OR EVOLUTIONARY BIOLOGY OR GENETICS HEREDITY OR BIODIVERSITY CONSERVATION OR SOIL SCIENCE OR AGRICULTURE OR PLANT SCIENCES OR FORESTRY OR FOOD SCIENCE TECHNOLOGY) AND SU =(SCIENCE TECHNOLOGY OTHER TOPICS OR LIFE SCIENCES BIOMEDICINE OTHER TOPICS OR ENDOCRINOLOGY METABOLISM OR NEUROSCIENCES NEUROLOGY OR PHYSIOLOGY OR REPRODUCTIVE BIOLOGY OR INFECTIOUS DISEASES OR BEHAVIORAL SCIENCES OR ANATOMY MORPHOLOGY OR HEMATOLOGY OR HEALTH CARE SCIENCES SERVICES ) NOT TI = (human OR sleep* OR disorder OR depress* OR palaeo* OR $vertebra* OR *fish* OR $amphib* OR $salientia* OR $anura* OR $caudata OR $salamand* OR newt$ OR $gymnophion* OR frog$ OR tadpole$ OR toad$ OR $reptil* OR $crocodil* OR *sauria* OR $squamat* OR $lizard* OR $lacert* OR $gekko* OR $serpent* OR $snake* OR $testudin* OR $turtle* OR $tortois* OR $mammal* OR $rodent* OR $sciurid* OR $hamster* OR *mouse* OR *mice* OR $squirrel* OR $rabbit* OR $hare OR $hares OR $chiropt* OR $bat OR $bats OR $myotis OR $sorciomorpha OR $soricid* OR $talpid* OR $shrew* OR $marmot* OR $mole OR $moles OR $primat* OR $carnivora OR $ursid* OR $ursus OR $felid OR $felids OR "$sea lion" OR "$fur seal" OR "$elephant seal" OR $marsupi* OR $goat* OR $sheep* OR $deer OR $cattle OR estrus OR suprachiasm*OR microb* OR bacteria* OR fung* OR *ceae OR bloom OR yield OR germination OR molecular OR simulation OR QTL* OR arabidopsis OR spring OR cell* OR tiller OR cultivar* OR bud* OR chill* OR (tree NEAR phenology)) 267

	#8 (#3 or #4 or #5 or #6 or #7 AND TS = (terrest*) ) or (#3 or #4 or #5 or #6 or #7 not TS = (marine* OR aquat* OR limno* OR water )) 2362


```
 

