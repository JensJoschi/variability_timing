# content  

This folder contains the literature search for the project. "S2.docx" describes the search algorithm and contains all keywords and numbers of results. The .txt files are the WOS outputs, saved in batches of 500 references. The excel fileis a merge of these .txt files, and contains screening, eligibility and inclusion results, as well as the extracted raw data from the studies.

# details on search_2018_11.xlsx  
The tabs "search1", "search2", "forward" and "forward2" contain the merged search results of the four searches (i.e. the .txt files). "combined" merges all eligible articles of the four searches, and "extract" adds metadata and raw data extracted from figures. The columns in the first 4 tabs generally correspond to the WOS saves (the .txt files), but in addition there are a few added columns to allow filtering for eligible articles:
* In tab "search 1", columns BQ:BX can be used to filter the results:
    * "title_animal" describes whether the article is, judging from the title, about animals (a), plants (p), does not mention either(n), or mentions both(b). 
    * "title_vert" does the same to distinguish between vertebrates (v), invertebrates (i) and none(n).
    * "title_water" marks aquatic organisms (x) and endoparasites. 
    * after filtering for terrestrial invertebrates, the titles were assessed again for suitability. Colum "title_usable" distinguishes usable ones (x) from irrelevant ones (n). Filtering this for x (no blanks) will give the 278 potentially relevant articles (make sure to unselect other filters, or select also "n" in title_animal)
    * "pops" and "n_pp" describe number of populations and photoperiods judging from the full text. Usually these were found in first part of methods section or could be glimpsed from the figures. Sometimes they were described in the abstract already. Excluding 0-2 pops and 0-3 photoperiods gives 59 articles
    * "full_usable" marks two further articles that are not usable, see notes column. that makes 57 eligible articles
* in search 2 relevant articles can be similarly filtered. Screening in this case needs not remove plant studies and aquatic animals because the search procedure took care of that.
    * "possible" filters articles with eligible titles (p). 355 articles have relevant titles
    * "dls" and "pops" can be used to filter articles with at least 3 populations and 4 day lengths. this leaves 272 articles. 
    * "usable" describes whether the article is eligible (y) or not (n). It leaves 13 eligible articles.
* tab "forward" works the same way, only that there are two additional columns, "DT" (column o) can filter for articles, and column "exists" (column BR) marks duplicates. 4 articles remain.
* the same columns in "forward2" are in column N and column BQ. no eligible articles.
* the tab "combined" has the 74 articles that can be found by filtering the preceding tabs (57+13+4), plus one article that has been wrongly tagged as negative. It adds several columns to the dataset
    * "notes" includes information about raw data retrieval and incomplete reaction norms
    * "inclusion" marks articles that cannot be included for lack of raw data and other reasons. 57/58 articles remain.
    * "pops" has the number of populations per study, summing to 463
    * "exclude_drc" gives information about pops that need to be excluded, "pops_removed" states how many populations were removed, and "pops_left_drc" gives the number of remaining populations (sum = 419)
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
    * "include" contains "3dl" if the population has only three day length measurements and is hence not eligible, "n" if the specific day length is uneligible (see notes in these cases), or "m" if technically eligible but potentially unreasonable (e.g. no logit-shape, or clearly incomplete). 
