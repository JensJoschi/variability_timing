
# Summary    

Global change alters selection on phenology, due to rises in temperature means, variability and predictability. Species persistence will depend on how phenology evolves, which may encompass according changes in means, variability (bet-hedging) or plasticity.
We conducted a meta-analysis of arthropod diapause timing across species and climatic gradients. We calculated means and slopes of day length reaction norms for 146 populations in 8 orders. We correlated means and slopes of diapause with mean, variability and predictability of winter onset, which we derived from climate station data.
While timing of diapause and winter onset correlated closely, the slopes were neither explained by winter variability nor by predictability. Insect phenology hence responds readily to mean change, but is vulnerable to altered climate variability and predictability.
.

See final/short_draft.pdf  for a full description, or methods.md for further details on methods.


# Structure  
The main folder contains a detailed description of methods and this readme file. The folder final has copies of all important scripts for a full analysis as well as a draft of a manuscript. Because not all steps of analysis are done, the final folder may be slightly outdated.

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
    * __figs__: old and irrelevant
    * __new_figs__:jpg of figures from eligible studies
  * __01extracted_data__: scripts and results from data extraction
    * __coords__:  old and irrelevant
    * __new__:the raw data from extraction
    * __formatted__: old and irrelevant
  * __02output__: results from dose-response curve analysis, to be used in metaanalysis
* __03analysis__: The actual meta-analysis
* __04figs__: old and irrelevant
* __final__: Copies of all important scripts



## workflow  

To reproduce the analysis fully, the following steps have to be taken:
* get the raw data from NOAA server and unpack (.tar.gz) it (12 gb)
* use the scripts conversion_tmax.pl and _tmin.pl to make extract relevant raw data and make it readable for R (make sure to have raw data in correct subfolder relative to these scripts). This takes ~30 min and produces a 5gb file
* use the calc_all R script to calculate mean winter, variability and predictability. 
    * First, run the chunks that produce the workspace and the temp.txt (1.5 gb). This takes a few hours. 
    * Then run the remaining chunk. Either set thresholds of choice manually (e.g. 10°, 5days), or run the full loop. The script takes ~30 min per threshold, and produces a 3mb file for each threshold
* the literature search as indicated in methods gave the output that can be found in the subfolder "literature". populations.ods has all steps from screening to inclusion for analysis:
  * tab search1 has the 1628 results from first search, a paper by kimura, and the 10 "other" results (13, but 3 are not relevant). The kimura paper used to be under other, but is actually found in forward-citation search
    * Filtering the columns "animal" (a + ap), "vertebrate" (i + iv), "water" (blank) gives the 366 potential refs (careful, count only to 1629, remaining are forward search results)
    * filtering for "forward search" (x) gives 61 refs that were used for forward search. Ryan was not in Web of science yet, so it is eligible but not included for forward search, making 62.
  * tabs search_1_forward_1 and _forward_2 have results from forward-citation searches. 
    * Filter "exists" (0) gives 585 results, because kimura has a (1). makes a total of 586
    * Filter "usable" (yes) makes 11 results 
    * same strategy for the forward_2 tab will give 1 further result
    * The results from the further 2 forward searches are not in dataset because they led to no new included article
  * the results from all foward searches are also added to tab search1
  * the tab search2 has 2748 results, and then 3 further results from forward search. 
    * filtering for "title" (p) gives the 621 potential articles
    * filtering for "pops" (>2) and "dls" (>2) gives 74 eligible articles
  * search_2_forward_1 and _forward_2 have the forward citation results, filtering for "usable" (y) gives 3 and 0 results, respectively
  * the tab has two datasets, with 73 and 77 results. These are the eligible studies of each search (2 are missing in search one, these are the higher level forward searches which both have less than 4 dls and are not included)
    * removing false positives with filter on "inclusion" gives 68(70) results in 1st dataset, and 70 in second dataset
  * the tab combined has 77 results, split into 4 categories. This includes one false positive, but misses the two higher-level forward search results with 3 DL. Not counting the 3DL categories, there are 70 unique results. 
  * the inclusion tab has the same 76 results (false positive removed), and filtering inclusion for "directly" and "yes" gives 33 studies. The sum of the pops-left column is 189 populations
  * the tab extract has meta-data added for these studies. Filter on include-data for "x" to only add relevant populations and day lengths to analysis
* the file for_slopes_new.csv has a copy of the inlcuded data for analysis in R. 
* The R-script slopes_new.Rmd can be used to make the DRC analysis. It creates the output slopes.txt, which is subsequently saved as slopes_clean.txt (55 kb)
* The R-script analysis_new.rmd combines slopes.txt and results_x_y.txt (from climate data) and does the full meta analysis. It requires the locations.txt from the NOAA server. This script also includes all figures.


