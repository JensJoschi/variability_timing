This folder contains all neccessary information to replicate the study. 
The most important data is already here (copy from other folders), but scripts do not contain the right links yet. Also, some analysis are unfinished, so the files will have to be replaced by newer versions.
Thus, all data may be outdated.

# content  
- results.txt has the results of climate calculations for one combination (10 days below 5°C). To reproduce this data:
		- download climate data from noaa server (.tar.gz), and extract it in subfolder "raw" within this folder (7-zip should be able to handle this). path should look like: final/raw/AECSDS2892.txt
		- execute the perl scripts "conversion_tmax" and "conversion_tmin". These extract all temperature data from the climate stations and convert it into r-readable format. The scripts produce the two files converted_max.txt and converted_min.txt. This copy will not run yet, requires changes to paths (first part of script). 
		- run R script calc_all.rmd. This will merge the converted temperature data files, clean them up, and calculate mean winter, winter variability and predictability. Run the first chunks to get the workspace converted.RData, and to get the table temp.txt. (2 large files >2gb) Then either run the remaining script (will give 100 different climate calculations, with various parameters for the "i days below j degrees" statement, see methods), or change i and j at the top of the loop (lines and ) to get only the combination "10 days below 5 degrees" (to-do)
		- raw data, converted_min and converted_max and converted.RData can now be removed. I strongly suggest keeping temp.txt, in case the calc_all has to be re-run with different parameter combinations
- new.ods has information on all literature searches. To reproduce this table:
		- the subfolder "literature" holds the original search results (both searches)
		- the metadata (degN, degE, N) was taken from the publications, for inclusion and eligibility criteria see methods.md
		- the subfolder "extraction" has the raw data of the figures, extracted with WebPlotDigitizer  
		- filtered_list.xlsx and extracted.xlsx are the results from first literature search
		- fowrardsearch(and forwardsearch2) do not belong in this folder, i think
- slopes.txt contains the resulst of the dose-response curve analysis. To reproduce:
	- forslopes_new.csv has all relevant data from new.ods in R-readable way
	- slopes_new.rmd is the relevant script to do the DRC analysis
- Analysis_new.rmd correlates the DRC parameters with climate
- slides.pdf gives a visual explanation of study
- draft.ods is a draft for a publication (contains some figures)