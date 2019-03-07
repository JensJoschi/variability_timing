# Content  
This folder contains the second step of climate data analysis (the first were 2 perl scripts to make the GHCN-data readable for R). The R script will calculate mean winter onset and winter predictability for 25,340 climate stations in the northern hemisphere. Converted.RData contains the first intermediate result, the cleaned data from all climate stations. Temp.txt contains the second intermediate result, a transformed dataset with one row representing one year (instead of one month). The subfolder output has two types of .txt files: "beta.txt", the predictability of winter onset based on the "colour of noise" approach, and "results_x-y.txt", with calculations of winter onset based on the assumption that winter begins on the yth day below x�C. These files store mean winter onset, standard deviation of winter onset (day length predictability) and standard deviation in temperature regressions (temperature predictability). 