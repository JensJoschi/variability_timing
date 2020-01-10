

# Summary    

Many organisms escape from lethal climatological conditions by entering a resistant resting stage called diapause, and it is essential that this strategy remains optimally timed with seasonal change. Climate change therefore exerts selection pressure on phenology, which is expected to cause the evolution of mean diapause timing, but also phenotypic plasticity and bet-hedging strategies. Especially the latter as a strategy to cope with unpredictability is so far little considered in the context of climate change, and it is unknown whether it can readily evolve. 
Contemporary patterns of phenological strategies across a geographic range may provide information about their evolvability. We thus extracted 458 diapause reaction norms from 60 studies. First, we correlated mean diapause timing with mean winter onset. Then we partitioned the reaction norm variance into a temporal component (phenotypic plasticity) and among-offspring variance (diversified bet-hedging) and correlated this variance composition with predictability of winter onset. Contrary to our expectation, mean diapause timing correlated only weakly with mean winter onset, as populations at high latitudes failed to track early onsets. Variance among offspring was also limited and correlated only weakly with environmental predictability, indicating little scope for bet-hedging. We conclude that constraints may limit the evolution of phenology in a rapidly changing climate.


A manuscript resulting from this project can be found on BioRxiv, https://doi.org/10.1101/752881 


# Structure  
The main folder contains additional approaches that have fallen out of use (unused.md); version of the GHCND and climate station summary; and this readme file. Subfolders:

* __clim_read__: includes 2 perl scripts to extract temperature data (daily min and max) from the GHCN-D dataset by NOAA, and the output of the scripts as .txt file
* __clim_calc__: includes an R script to calculate mean winter onset and winter predictability based on the temperature data, and intermediate outputs of the scripts (.txt and .RData)
    * __output__: outputs of the R script for various parameter combinations, saved as .txt files
* __lit_search__: search terms, web of Science results, and excel file (search_2019_12.xlsx) with screening, eligibility and inclusion of studies; the excel file also has a tab with extracted data (see lit-extract/reaction-norms)
* __lit_figs__: figures and data from studies
* __lit_extract__: R script to do MCMC analysis and get variance composition and means with credible intervals, csv input file (based on extract tab in search_2019_12.xlsx), and .txt results file
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

* the literature search is described in the preprint, downloaded search results are in the folder "lit_search". The excel file "search_2019_12.xlsx" has in the tab "combined" all eligible studies. Further details on this file are in the readme of folder __lit_search__ 
* running webplotdigitizer on the figures from the eligible studies (folder "lit_figs") or getting raw data directly from tables gave the .txt files in "lit_extract/reaction_norms"
* the tab "extract" in "search_2019_12.xlsx" has these data, plus additional metadata from the articles (species, latitude/longitude). Filter on "include" to only add relevant populations and day lengths to analysis  
* the script "varcomps.rmd" in "lit_extract" does the mcmc analysis and produces "mcmcresults.txt". It also creates forest plots (with frequency distributions of the parameters) for all variables
* "analysis_new.rmd" in "analysis" does the analysis based on "mcmcresults.txt" and the climate dataset


To only redo the analysis: 
* get the data from clim_calc_output (climate data)
* (get the data varcomp.csv from lit_extract)
* (run the script varcomp.rmd from lit_extract to get mcmcresults.txt)
* run analysis_new.rm in analysis to do the correlation of climate data and mcmcresults.txt.



 
