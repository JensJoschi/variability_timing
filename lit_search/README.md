# Content  

This folder contains the literature search for the project. The search algorithm can be found in the preprint (https://www.biorxiv.org/content/10.1101/752881v1). The .txt files are the WOS outputs, saved in batches of 500 references. The excel file is a merge of these .txt files, and contains screening, eligibility and inclusion results, as well as the extracted raw data from the studies.

# Details on search_2019_12.xlsx   
The tabs "search1" and "search2" contain the search results of the two literature searches (i.e. the .txt files). "s1_s2" merges all eligible articles. The forward citation search is based on these 73 studies, and can be found in "forward". "Forward" has further 5 references, and the search based on these five articles is found in "forward2". "Combined" puts these tabs together. "Extract" adds metadata and raw data extracted from figures. The columns in the first 5 tabs generally correspond to the WOS saves (the .txt files), but in addition there are a few added columns to allow filtering for eligible articles:
* In tab "search 1", columns BQ:CD can be used to filter the results:
    * "title_animal" describes whether the article is, judging from the title, about animals (a), plants (p), does not mention either(n), or mentions both(b). 
    * "title_vert" does the same to distinguish between vertebrates (v), invertebrates (i) and none(n).
    * "title_water" marks aquatic organisms (x) and endoparasites. 
    * after filtering for terrestrial invertebrates, the titles were assessed again for suitability. Colum "title_usable" distinguishes usable ones (x) from irrelevant ones (n). Filtering this for "x" (no blanks) will give the 308 potentially relevant articles (make sure to unselect other filters, or select also "n" in title_animal)
    * "pops" and "n_pp" describe number of populations and photoperiods judging from the full text. Usually these were found in first part of methods section or could be glimpsed from the figures. Sometimes they were described in the abstract already. Excluding 0-2 pops and 0-3 photoperiods gives 63 articles
    * "full_usable" marks three further articles that are not usable, see notes column. that makes 60 eligible articles
* in search 2 relevant articles can be similarly filtered. Screening in this case needs not remove plant studies and aquatic animals because the search procedure took care of that.
    * Columns BQ:BV store the extra columns from the Scielo/Russian/Korean database that do not exist in the WOS core collection (and are therefore mostly left empty)
    * "possible" filters articles with eligible titles (p). 420 articles have relevant titles
    * "dls" and "pops" can be used to filter articles with at least 3 populations and 4 day lengths. this leaves 289 articles. 
    * "usable" describes whether the article is eligible (y) or not (n). It leaves 13 eligible articles.
* tab s1_s2 merges all eligible studies (73 entries)
* tab "forward" is again a WOS output, but this time with two additional columns, "DT" (column o) can filter for article types, and column "exists" (column BW) marks duplicates. 5 articles remain.
* the same column is in "forward2" in column BP. no eligible articles.
* the tab "combined" has the 78 articles that can be found by filtering the preceding tabs (60+13+5). It adds several columns to the dataset:
    * "notes" includes information about raw data retrieval and incomplete reaction norms
    * "inclusion" marks articles that cannot be included for lack of raw data and other reasons. 60 articles remain.
    * "pops" has the number of populations per study, summing to 464 (if excluding those with no data).
    * "exclude_pop" gives information about pops that need to be excluded, "pops_removed" states how many populations were removed, and "pops_left" gives the number of remaining populations (sum = 413)
    * "Reaction_norms" gives the number of reaction norms, which is 458. The reason for the higher number is that some studies measured reaction norms of multiple mothers per population
    * "region" gives information about study sites
* the tab "extract" has a different structure, with multiple rows per study (1 row per day length-population combination). 
    * columns A-K are copies of the "combined" tab
    * column L,M and N describe the species/genus/order name as extracted from the article
    * column "nmethod" describes whether/how treatment level sample sizes were given: 
        * global average means statements such as "on average, 100 flies per treatment and population were tested", or "between 80 and 120 flies were tested"  
        * poplevel means "on average 100 flies per treatment were tested for populations A and B, 50 flies per treatment were tested for population C"
        * NA means that the article fails to mention sample sizes
        * accurate means that full sample sizes were given for each treatment-population combination
        * the lack of accurate information in most cases does not degrade this meta-analysis to a "vote count" analysis, as the level of replication is "number of treatments". See methods section in manuscript or methods.md.
    * column "pop" is the identifier of the population, as given in figure legend. 
    * degN and degE are the coordinates, using either the coordinates as given in the original article, or, when only a town or district is named, the coordinates associated with this town in wikipedia (english or german version if available, japanese version for some smaller towns). The coordinates are then usually found on the upper right of the article page, above the picture of the town. clicking will provide detailed information and coordinates as decimal values
    * column "n_pp" is the number of photoperiods available for each population
    * "dl" and "perc" are the raw data from the figure extraction (photoperiod and percentage diapause)
    * "n2" is the treatment level sample size (using the global or population average if applicable)
    * "dl2" is the photoperiod, rounded to match methods section of the article, or to next sensible value (e.g. 9.96959291267217 likely means 10 hours day length)
    * "include" contains "3dl" if the population has only three day length measurements and is hence not eligible, "n" if the specific day length is uneligible (see notes in these cases), or "m" if technically eligible but potentially unreasonable (e.g. no logit-shape, or clearly incomplete). Filtering for "blank" and "m" gives 3092 rows.
