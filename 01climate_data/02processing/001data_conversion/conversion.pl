#!/usr/bin/env perl
#use strict;
use warnings;


#this perl script takes the NOAA GHCN daily dataset (daily weather data for ~50 ys, around the whole world), and extracts
#daily average temperatures. it ignores all other data flags that are inside that dataset. The format of the old datasets is fixed-width delimited, the new one will be delimited by "|".
#the new data is sorted in the following way:
#station1 | year 1 | month 1 | T(day1) | T(day2) |...| T(day31)
#station1 | year 1 | month 2...
#station1 | year 2 | month 1...
#station2| year 1 | month 1...
#missing data, and non-existent days (eg Feb 31) are called NA
#
#this script uses a local copy of the dataset from "ftp.ncdc.noaa.gov/pub/data/ghcn/daily/"; the .tar.gz file has to be extracted first (separate folder with 100,000 text files)


#my $readdir  = "<..g01-metanalysis\\01climate_data\\01 raw\\ghcnd_all.tar"
use FindBin;
print "abs path:\n";

my $currdir = $FindBin::Bin; 
print $currdir;
#need to move 2 dirs up

my @dirs   = File::Spec->splitdir($currdir);        # parse directories
pop @dirs;  pop @dirs;                              #remove top 2 levels from dir
my $newdir = File::Spec->catdir(@dirs); 

my $readdir = "$newdir/01raw/ghcnd_all/ghcnd_all/";

print "\nmoved current working directory to $readdir\n";


my $writedir = "$newdir/02processing/001data_conversion";
my $writefile = ">>$writedir/converted.txt";

print "I will write to: $writefile\n";
open (OUT, $writefile) or die ("is writefile open?");


#starting the actual script
my @files = <$readdir/*>;;
print "list of files: \n";
#print @files;
foreach $file (@files) {
	open (IN, "<$file") or die ("cant open readfile!");
	while(my $line = <IN>){
	if ($line =~ m/TAVG/ ){ #the stations data contains many more information, e.g. precipitation data, which will not be needed. This line selects only information about Average daily temperature
		chomp $line;
		$i++;
		$rows[$i] = $line;
	($station, $year, $month, $type
, $t1, $f1, $t2, $f2, $t3, $f3, $t4, $f4, $t5, $f5, $t6, $f6, $t7, $f7, $t8, $f8, $t9, $f9, $t10, $f10, $t11, $f11, $t12, $f12, $t13, $f13, $t14, $f14, $t15, $f15, $t16, $f16, $t17, $f17
, $t18, $f18, $t19, $f19, $t20, $f20, $t21, $f21, $t22, $f22, $t23, $f23, $t24, $f24, $t25, $f25, $t26, $f26, $t27, $f27, $t28, $f28, $t29, $f29, $t30, $f30, $t31, $f31) 
= unpack ("A11 A4 A2 A4 
A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3 A5 A3",
 $rows[$i]);
print OUT "$station|$year|$month|$t1|$t2|$t3|$t4|$t5|$t6|$t7|$t8|$t9|$t10|$t11|$t12|$t13|$t14|$t15|$t16|$t17|$t18|$t19|$t20|$t21|$t22|$t23|$t24|$t25|$t26|$t27|$t28|$t29|$t30|$t31\n";
	}
}
close IN;
}
