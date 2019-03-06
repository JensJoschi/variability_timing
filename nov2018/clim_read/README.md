# Content   
This folder is the first step to calculate the climate variables. It requires the raw data (GHCN-D) from the NOAA server, extracted into its ~100k text files. The scripts in this folder will get all lines of the raw data with the text TMIN or TMAX, remove all flags, and convert them to r-readable format. The output (~12.6 million months with data, ~34,000 stations) is saved as txt files. Before using the scripts, readdir and writedir need to be changed, so that the script can find the raw data folder.  


