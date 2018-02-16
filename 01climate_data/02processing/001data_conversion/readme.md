# Contents of this folder

* Conversion.pl is a perl script. It reads the NOAA GHCN daily dataset file by file (~100,000 stations), and extracts daily average temperatures. It removes all data flags, and saves the output in delimited format (using | as delimiter) Details are in the first lines of the script. 
* 'converted.txt' is the output of the PERL script (~0.5 gb, not on github)
* 'read.rawdata.RMD' loads the text file converted.txt into the workspace, connects to the NOAA server to get a list of all climate stations, cleans the dataset and saves the workspace as Rworkspace.Rdata
*'read.rawdata.html' is the same script in html
* other files in this folder are not working (and not important)
