This folder processes the raw data to extract photoperiodic response curves and their slopes from published studies  

## Table of contents  
* I calculated x and y coordinates from all studies that can be found in the raw data subfolder, using WebPlotDigitizer Version 3.12, and saved these in the folder "new"    
* forslopes_new.csv prepares the raw data to be read into R. It is a copy of the inclusion tab in populations.ods
* slopes_new.rmd is the R script to do dose-response curve analysis and get slope estimates.
* the various .png files are the modelled dose response curves. The first number in the name is the i from the loop in the script, it is followed by the first authors name
* anything else is old and not neccessary anymore
