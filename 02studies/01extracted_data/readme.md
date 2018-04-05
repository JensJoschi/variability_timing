This folder processes the raw data to extract photoperiodic response curves and their slopes from published studies  

##Table of contents  
* I calculated x and y coordinates from all studies that can be found in the raw data subfolder, using WebPlotDigitizer Version 3.12, and saved these in the folder "coords"    
* extracted.xlsx has two tabs: the tab "metadata" mirrors the same tab from "filtered_list" in the raw data; the tab "extended" has several rows per population, 1 per day length that was measured. It also has the extracted x and y coordinates from the figures.  
Where neccessary, x (the day length) was rounded or corrected to match the description in materials and methods. For example the points on the x-axis were in some cases not continous as the axis would suggest (e.g. x-axis in paolucci mixes 1h intervals with 2h intervals), or points were plotted next to each other for better visibility (Rihiima).  y-values that were slightly above 100% or below 0% were set to 100% and 0% respectively. in one figure of urbanski, 1 data point that did not exist in the raw data was deleted.
* forslopes.csv prepares the raw data to be read into R  
* slopes.rmd is the R script to do dose-response curve analysis and get slope estimates.
* the various .png files are the modelled dose response curves. The first number in the name is the i from the loop in the script, the second number is the consecutive numbering that is also in the excelfiles and corresponds to the names in the folder 00raw/figs.
* data_points.xlsx, slopes.R, as well as the subfolder "formatted" are old and should not be used anymore.
