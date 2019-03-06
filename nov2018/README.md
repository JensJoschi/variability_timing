

# Summary    

Global change alters season onset due to rises in mean temperature and temperature variability, and whether species can persist will critically depend on the evolability of phenological strategies. The most commonly researched phenologcial strategies are adaptation of mean timing and plasticity in timing. Bet-hedging, the avoidance of fitness variance, is at least as important in a climate with decreased predictability, yet comprehensive studies that include means, plasticity and bet-hedging are missing. We recently established a framework to describe evolutionary strategies as a 3-dimensional continuum along the axis of arithmetic mean optimization vs conservative bet-hedging, fixed vs. variable development, and phenotypic plasticity versus bet-hedging. These strategies can be defined by reaction norm properties, namely by their mean, the variance allocation within and among environments, and the total phenotypic variance.  We predicted that the choice along this three-dimensional continuum of strategies depends on environmental predictability, amplitude of environmental change, and on the mean environment.
We conducted a meta-analysis on 58 studies of insect diapause and extracted 433 logistic reaction norms, and correlated means and variance components with climate parameters. Three patterns emerged: First, mean diapause correlated with mean winter onset. Secondly, very few reaction norms were canalized, likely caused by strong study bias towards non-canalized genotypes. Thirdly, bet-hedging was rare and correlated only weakly with environmental predictability. Genotypes are thus most vulnerable to decreases in climate predictability.


See methods.md for details on methods.


# Structure  
The main folder contains a detailed description of methods and this readme file. Subfolders:

* __clim_read__: includes 2 perl scripts to extract temperature data (daily min and max) from the GHCN-D dataset by NOAA, and the output of the scripts as .txt file
* __clim_calc__: includes an R script to calculate mean winter onset and winter predictability based on the temperature data, and intermediate outputs of the scripts (.txt and .RData)
    * __output__: outputs of the R script for various parameter combinations, saved as .txt files
* __lit_search__: search terms, web of Science results, and excel file (search_2018_11.xlsx) with screening, eligibility and inclusion of studies; the excel file also has a tab with extracted data (see lit-extract/reaction-norms)
* __lit_figs__: figures and data from studies
* __lit_extract__: R script to do MCMC analysis and get variance composition and means with credible intervals, csv input file (based on extract tab in search_2018_11.xlsx), and .txt results file
    *  __reaction_norms__: data extracted with webplotdigitizer
* __analysis__: R script to correlate variance composition and means with climate data

Not all files are uploaded to github due to their size and potential copyright issues.



## workflow  

To reproduce the analysis fully, the following steps have to be taken:
* get the raw data from NOAA server and unpack (.tar.gz) it (12 gb)
* use the scripts "conversion_tmax.pl" and "conversion_tmin.pl" (make sure to have raw data in correct subfolder relative to these scripts). This takes ~30 min and produces a 5gb file
* use the "calc_all.rmd" R script to calculate mean winter, variability and predictability. 
    * First, run the chunks that produce the workspace and the "temp.txt" (1.5 gb). This takes a few hours. 
    * Then run the remaining chunk. Either set thresholds of choice manually (e.g. 10°, 5days), or run the full loop. The script takes ~30 min per threshold, and produces a 3mb file for each threshold  

* the literature search is described in the .docx file and in "methods.md", downloaded search results are are in same folder. The excel file "search_2018_11.xlsx" has in the tab "combined" all eligible studies. Further details on this file are in the readme of folder __lit_search__ 
* running webplotdigitizer on the figures from the eligible studies (folder "lit_figs") or getting raw data directly from tables gave the .txt files in "lit_extract/reaction_norms"
* the tab "extract" in "search_2018_11.xlsx" has these data, plus additional metadata from the articles (species, latitude/longitude). Filter on "include" to only add relevant populations and day lengths to analysis  
* the script "varcomps.rmd" in "lit_extract" does the mcmc analysis and produces "mcmcresults.txt". It also creates forest plots (with frequency distributions of the parameters) for all variables
* "analysis_new.rmd" in "analysis" does the analysis based on "mcmcresults.txt" and the climate dataset


 
