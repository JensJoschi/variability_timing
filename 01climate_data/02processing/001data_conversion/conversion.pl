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

use Cwd 'chdir';
use File::Basename;

print "\nstarted in $ENV{PWD}\n";

chdir dirname $0;

print "now in $ENV{PWD}\n";
use Cwd;
 my $dir = getcwd;

print "yes its $dir\n";
print "1up: :\n";
my $parent=dirname($dir);
print "parent $parent\n";
$parent=dirname($parent);
print "parent $parent\n";
print "okay i solved it:\n";
print ($parent, "/01raw/ghcnd_all/");
print "\n";
