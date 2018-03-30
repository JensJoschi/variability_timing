
#Summary    

Many organisms escape the adverse conditions of winter by a diapause response, usually relying on day length as main cue for winter onset, and on autumn temperature for fine-tuning. Natural environments are stochastic,  however, and winter onset is both variable across years (i.e. correlates only weakly with day length), and difficult to predict based on preceding autumn temperatures.  Because long-term (geometric mean) fitness is maximized by performing consistently under variable conditions and avoiding extinction, it should be adaptive to spread the risk in time by investing in phenotypes with different diapause thresholds (diversified bet-hedging). With increasing cue reliability the need to rely on bet-hedging should be reduced. Hence, we expected that variability in diapause timing is determined by an interaction of environmental variability and predictability.   
We tested this hypothesis with a meta-analysis. First, we calculated winter variability and predictability based on weather data for 30,000 locations. To correlate the environment with physiological variability, we then searched for publications that study photoperiodic response curves (PRCs) of insects at more than two sites (60 studies with 350-450 locations). We calculated the slopes of the PRCs with four-parameter dose response curves, expecting that they correlate with environmental variability and predictability.      
As expected, populations from northern latitudes shift their timing towards earlier diapause, progressing with approximately 50 minutes per 5 degrees latitude. However, contrary to our hypothesis, we found no evidence for a more graded diapause response in less predictable climates, indicating that day length measurement is no general bet-hedging trait across insect genera. But analysis is not finished yet    


#Methods    


To calculate winter onset and environmental predictability at various locations, I used the GHCN-Daily dataset (Menne et al., 2012), version 3.22 which includes weather station data from throughout the world (Menne et al., 2018). I interpolated between the point estimates, using a linear model (variability ~ latitude + longitude + altitude) and a topographic map of the world. I then extracted phase response curves from 60 published studies (350 populations) along with their sampling locations, and estimated the slopes of these curves. The slope estimates were then correlated to the estimated predictability and variability of winter arrival.


## climate data

 Three attempts to calculate winter variability/predictability were made (only 3rd one is interesting)

#### I followed the definition of (Halkett et al., 2004) and defined winter onset as the point where a regression line from august to December crosses 12°C. Winter variability was then defined as standard deviation in winter onset.

I used a Perl script to read the GHCN daily dataset file by file (~100,000 stations), and extracted daily average temperatures. The script removed all data flags, and saved the output in delimited format (using | as delimiter). The full dataset has 3,078,174 lines, one for each station and month with a  temperature average read. All further analysis was conducted in R. 
I concentrated only on data from the northern hemisphere, ignored stations with less than six months of data, all years prior to 1950, and all years with data for less than 20 days. To calculate winter predictability, I then calculated standard deviation between years for each station, removing those stations for which only 1 year of data exists. This variability estimate for approximately 9000 stations was on average based on 25 years per station (median: 22) and included 2880 days (1,013,142 station-months). 
With proximity to the equator the slope of the temperature regression flattens, and the calculated winter onset approaches infinity.  I therefore used only latitudes north of 20°N. Moreover, I excluded stations with winter onset later than +500 days or earlier than -500 days (0.5% of the dataset). Nevertheless, this approach biases the variability estimates towards flatter slopes with decreasing latitude, and was therefore discontinued. 

#### The second approach was to find the xth day were the temperature falls below y°C, and then use standard deviation of the julian date (weighted by sample size).
I used the same Perl script as before.

For an initial quality control I applied a non-linear least-square regression on all data of each station. I expected the temperature to follow a sine wave ( t(x) = A * cos (x * 2*pi/omega + phi) + C), where omega is the period of 1 year, and fixed at 372 days (12*31 days for coding efficiency). This curve is determined by the following parameters: 
- a constant C that defines the average temperature throughout the year. It was expected to be approximately 20°C to 30°C;
- the amplitude A, which quantifies the difference between winter and summer temperatures. A should decrease with proximity to the poles.
- the phase angle phi. Phi defines at what time of the year maximum temperatures occur. It should be close to midsummer in all stations of the northern hemisphere, and around midwinter in the southern hemisphere.  This corresponds to phase angles of 170/372 *(2*pi) = 2.87, and  368/372*(2*pi)=6.22, respectively.

I used A=400, phi = pi/2, C = 200 as starting values (temperatures are given in decimal degrees), and retried with up to two different starting value combinations upon convergence failure (A = 40, phi = pi, C = 200; A = 40, phi = 2*pi, C = 200). For all trials I used the port algorithm as optimizer, upper bounds of A=500, phi =2*pi and C=400, and lower bounds of A= 0, phi = 0 and C= -400.

I then calculated winter arrival, concentrating only on the northern hemisphere. Starting from midsummer, I counted the number of days where the temperature fell below a certain threshold x. Winter was assumed to arrive when x was reached for the yth time. I used four such parameter combinations (x=10,y=50; x=5,y=20; x=20,y=100; x= 5,y =0; all in decimal degrees) in different runs. 
I excluded years with less than 100 days of data, and stations with less than 3 winter onsets. Across all stations with recorded winter onsets, 80 % of the years had more than 350 days with data, and 87.5% had more than 300 days with data. Nevertheless, I calculated a weighted mean winter onset and a frequency weighed standard deviation of winter onset to account for differences in reliability. 
Because most climate stations have temperature data for only approx. 10 years, this approach was also discontinued.



#### The third approach uses the same idea as the second (x days below y degrees), but applies it to daily minimum/maximum temperatures, which were about 10 times more frequently recorded.     

Two new Perl scripts extracted daily minimum and maximum temperatures from all climate stations, and the daily mean was calculated in R from those values for all days and stations. This approach yielded a considerably bigger dataset (~12 million stations*months).    
As before, I calculated Amplitude, phase angle and annual average with a non-linear least-square regression, weighted mean winter and weighted standard deviation in winter onset. In addition, I calculated the correlation of temperature at winter onset with temperature 1,2, or three weeks before winter onset. However, as the correlation was on average 0, this procedure was dropped.     

I then calculated winter predictability: The last 31 days before winter onset of each year were aggregated and pearsons R was calculated. The climate at one station was considered predictable (high R) if 1) temperature declined more or less linearly, 2) the slope was consistent across years, and 3) there was little day-to-day variation.



## empirical data

I searched the web of science database for "(photoperiodic AND (geogr* OR range)) OR (photoperiod* AND latitud*) OR(photoperiod* AND longitud*)". on 19.2.2018, This search yielded 1627 unique  results. The results were merged in an excel-file. I added articles to the study that I knew or which were cited in these articles but that did not match the keywords (total: 1641). Still need to do a forward citation search though.
I classified the studies as plant/animal, Vertebrate/invertebrate, and water/terrestrial by filtering for different keywords (e.g. plant,flower, ento*, fish, bird) in journal titles. Articles that appeared in more general journals were classified manually (according to title, abstract or full text).


Concentrating on terrestrial invertebrates, I selected only studies that measured photoperiodic response curves of more than two populations, and over at least 3 photoperiods.  61 studies with 364-450 populations fulfilled these criteria (Table 1) (5 studies with a total of 90 populations did not show any PRCs but I may be able to retrieve them if I write to the authors). These 61 studies examined PRCs of 47 species (T.urticae and some Drosophila species were adressed in several studies) of 9 orders (1 species per study, except in one case). For these, I noted study species, sample sizes, coordinates and altitude (if available), and saved the PRCs as .png files. I then extracted the data from the figures using WebPlotDigitizer Version 3.12 (Rohatgi, 2017). When raw data was avaiulable (x % of all cases) I used this data to test the error rate of manual extraction (todo, but small according to initial tests). Where neccessary,  the day length was then rounded or corrected to match the description in materials and methods of the respective study. For example the points on the x-axis were in some cases not continous as the axis would suggest (e.g. x-axis in (Paolucci et al., 2013) mixes 1h intervals with 2h intervals), or points were plotted next to each other for better visibility  (Riihimaa Ari et al., 2004). Y-values that were slightly above 100% or below 0% were set to 100% and 0% respectively. in one figure of (Urbanski et al., 2012), 1 data point that appeared in the figure but did not exist in the available raw data was deleted.


To estimate the slopes  I modelled diapause with four-parameter binomial dose response curves in R. This analysis provides lower and upper bounds of photoperiodic induction (I constrained these to range from 0 to 100%), the slope, and the point where 50 % of the individuals are induced (critical day length). Where detailed information on sample sizes was available (% of all cases), I weighted diapause estimates by number of trials. I also recorded the the standard error, using a robust sandwich estimation method (Zeileis, 2006).


## Statistical analysis

I correlated winter predictability (R²) with latitude, longitude and square-root-transformed altitude in a linear model. The model estimates were then used to interpolate to the sampling sites of the empirical studies. To do so, I used 1) the coordinates that were quoted in the studies, or, if not available coordinates of the quoted town or area; 2) the altitudes that were quoted in the studies, or if not available, the altitude of the available coordinates. This altitude was derived from a topographic map of the world with a resolution of 5 minutes in latitude and longitude (NOAA, 1988).
I used a mixed-effects model to correlate the estimated predictability at  the sampling locations with the slopes of the empirical PRCs. The influence of each of the 350 populations was weighted by the inverse of the standard error of the slope estimate; study identity was used as random term. An alternative appraoch would be to use study species as random term, and ignoring study id (doing both could be complicated). This approach would allow including studies with only 1 population. 

I used Perl version 5.22.1, and R version 3.4.4 (R Core Team, 2018). The data was manipulated with the packages textreadr, Rcurl, data.table (Dowle & Srinivasan, 2017; Rinker, 2017; Duncan Temple Lang and the CRAN team, 2018) and the tidyverse packages  (Wickham, 2017) readr, tidyr, dplyr, stringr and magrittr (Wickahm; Bache & Wickham, 2014; Wickham, Francois, et al., 2017; Wickham, Hester, et al., 2017; Wickham & Henry, 2018). To interpolate between climate stations I used the package geomapdata (Lees, 2012).  The data from the empirical studies was extracted with WebPlotDigitizer version 3.12 (Rohatgi, 2017).
The dose-response curve analyses were made with the package drc (Ritz et al., 2015) , its standard errors were computed with the packages sandwich (Zeileis, 2006) and lmtest (Zeileis & Hothorn, 2002), and the correlation of variability and slope estimates was computed with package lme4 (Bates et al., 2007).



# Results    


## climate data
Mean winter correlated with latitude and altitude. Environmental predictability was reasonably well explained by latitude,longitude and altitude (R² = 0.25). Standard deviation in winter onset was quite erratic, and not correlated with any variable (did not use for analysis yet). 


## empirical data
The critical day length ( julian date on which 50 % offspring are diapausing) increased with latitude, by about 1 hour per 5°N (Fig. 2). This is close to published values of 1h to 1.5 hours per 5 ° Latitude (Danileevski 1986).  



##correlation slopes~ predictability*variability
interaction still to do. At the moment only slopes~ predictability. This is not significant.
Also on to -do list: using not the model predictions but nearest climate station.


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



