# Folder contents
  
* the folder "01 raw" contains the raw GHCN climate stations data "ghcnd_all.tar" (actually, this is not uploaded to github but can be found at NOAA.gov). 
* The folder 02processing uses the climate data to calculate predictability and variability. First, the raw data is processed with Perl files in the subfolder 001data_conversion, to get an R-readable output and to remove unneccessary information (e.g. snowfall and rainfall data). Secondly, the processed data is opened in R with the scripts in the subfolder 002processing.  
* The calculations on predictability and variability are then saved as .txt file in the folder 03output.

