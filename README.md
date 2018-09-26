
# Summary    

Global change alters selection on phenology, due to rises in temperature means, variability and predictability. Species persistence will depend on how these traits evolve, which may encompass changes in means timing, its variability (bet-hedging) or plasticity.
We conducted a meta-analysis of arthropod diapause timing across species and climatic gradients. We calculated means and slopes of day length reaction norms for 200 populations in 8 orders. We correlated means and slopes of diapause with mean, variability and predictability of winter onset, which we derived from climate station data.
While timing of diapause and winter onset correlated closely, the slopes were neither explained by winter variability nor by predictability. Insect phenology hence responds readily to mean change, but is vulnerable to altered variability and predictability.

See draft.md for a full description, or methods.md for further details on methods.


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
