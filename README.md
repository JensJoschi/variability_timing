
# Summary    

Many insects escape the adverse conditions of winter by diapause. Finding the optimal diapause timing is challenging as the optimal timing may be determined by mean winter onset, its variability, and predictability of the environment. Insects are known to use day length as main cue for mean winter onset, and plastic responses to temperature as secondary cue. It is, however, not known how insects deal with variable environments with little predictability. We hypothesized that 1) the timing of diapause closely tracks mean winter onset (which is different from a linear diapause-latitude relationship); and 2) that the variability in diapause timing increases with environmental variability, but decreases with environmental predictability. 
We tested these hypotheses with a meta-analysis. First, we calculated mean winter onset, winter variability (between-years standard deviation in winter onset) and predictability (standard deviation in slopes of a temperature-time regression) for ~29,000 climate stations in the northern hemisphere. We then searched for publications that study photoperiodic reaction norms of insects at more than two sites (30 studies, 10 orders, 174 populations). We determined the inflection point and the slopes in the reaction norms, as these determine, resepectively, the mean and the temporal spread of diapause. We then correlated the inflection point with mean winter onset, and the slope estimates with variability and predictability of the environment.  
As expected, populations from northern latitudes shift their timing towards earlier diapause, progressing with approximately 50 minutes per 5 degrees latitude.  This shift in diapause correlated well with the latitudinal cline in winter onset (and associated changes in photoperiod) from the climate data. Contrary to our hypotheses, however, the variability in diapause was neither explained by winter variability nor by winter predictability. We conclude that insect phenology can readily evolve in response to temperature across insect orders, but that it is vulnerable to changes in climatic variability. 


See also methods.md for details.


# Structure  
The main folder contains a detailed description of methods, a draft of a manuscript and other high-level stuff. 

* __01climate_data__: calculations of winter onset, variability and predictability. 
  * __01raw__: (nearly) empty becasue the dataset is too big for github (get it at noaa). 
  * __02processing__: does calculation
    * __001data_conversion__: uses PERL scripts to select data and make it R-readable
    * __002calculation_predictability__: various ways to calculate climate variables
      * __0001 sd(winteronset)__: old and irrelevant
      * __0002coldsum__: old and irrelevant
      * __0003coldsum_minmax__ relevant calculation
  * __03output__: results from climate data calculation
* __02studies__: extraction of CDL and slopes from empirical data
  * __00raw__: literature search results, their metadata and assessment which ones are eligible
    * __figs__: jpg of figures from eligible studies
  * __01extracted_data__: scripts and results from data extraction
    * __coords__: the raw data from extraction
    * __formatted__: old and irrelevant
  * __02output__: results from dose-response curve analysis, to be used in metaanalysis
* __03analysis__: The actual meta-analysis
* __04figs__: old and irrelevant

# important files  
## descriptions  
* There should be a readme file in each subfolder. 
* In addition, the file methods.md has a concise description of the methods, and a more detailed description with all tests ever applied. 
* The file draft.md has a preliminary paper draft, that is updated from time to time.

## datasets  
Below is a list of all important (intermediate) results (_plus time to reproduce these if applicable_)
* the raw data from NOAA is not uploaded(12 gb)
* the processed raw data is also not uploaded (5 gb; _30 min_)
* the workspace after calculating daily means and kicking out southern hemisphere is also not uploaded (500mb; _30 min_)
* results.txt in climatedata/output has mean winter onset, variability and predictability for parameter combination (x=5,y=10) (3 mb, _12 h_)
* results_94.txt has the same data but for the parameter combination used in paper (3 mb, _12 h_)
* studies/raw/savedrecs*.txt are the raw results from literature search (2 mb)
* filtered_list.xlsx has the raw results with metadata and evaluation whether useful or not (1.3mb)
* forward*.txt has raw results form forward citation search
* forwardsearch2.ods has studies and metadata from forward-citation search
* studies/extracted/coords/*.txt are the extracted raw data from studies
* studies/extracted/extracted.xlsx has studies, metadata and results from data extraction
* studies/output/slopes.txt are the results from dose-response curve analysis (effect sizes)

## scripts and analyses  
* climatedata/processing/conversion/conversion_tmax.pl and _tmin.pl are the PERL scripts to make raw climate data r-friendly
* climate/processing/predictability/0003/coldsum_minmax is the R script to calculate mean winter, variability, predictability (based on x=5,y=10)
* same folder, minmax_94 calculates winter as used in the paper
* studies/extracted/slopes.rmd does dose-response curve analysis to get effect sizes from studies
* analysis/analysis.rmd and analysis.md are the meta-analysis models, main results and figures