# Contents of this folder

* Conversion.pl is a perl script. It reads the NOAA GHCN daily dataset file by file (~100,000 stations), and extracts daily average temperatures. It removes all data flags, and saves the output in delimited format (using | as delimiter) Details are in the first lines of the script. 
* 'converted.txt' is the output of the PERL script (~0.5 gb, not on github)
*conversion_tmin.pl and _tmax.pl and the associated converted_maxt.txt do the same, but for TMAX and TMIN, which has much more data
* other files in this folder are either not working or not important anymore
