This folder processes the raw data to extract photoperiodic response curves and their slopes from published studies  

##Table of contents  
* I calculated x and y coordinates from all studies in the raw data subfolder, using WebPlotDigitizer Version 3.12, and saved these in the folder "coords"    
* data_points.xlsx is old and should not be used anymore
* extracted.xlsx has two tabs: the tab "metadata" mirrors the same tab from "filtered_list" in the raw data; the tab "extended" has several rows per population, 1 per day length that was measured. It also has the extracted x and y coordinates from the figures
	Where neccessary, x (the day length) was rounded or corrected to match the description in materials and methods. For example the points on the x-axis were in some cases not continous as the axis would suggest (e.g. x-axis in paolucci mixes 1h intervals with 2h intervals), or points were plotted next to each other for better visibility (Rihiima)
	y-values that were slightly above 100% or below 0% were set to 100% and 0% respectively. in one figure of urbanski, 1 data point that did not exist in the raw data was deleted