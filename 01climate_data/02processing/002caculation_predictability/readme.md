The separate folders represent different trials to calculate winter predictabilty/variability. 


* The first approach was to make in each year a regression and note the point where the regression line crosses 12°C. The standard deviation was used as winter variability. This approach has some issues and was discontinued
* The second approach was to find the xth day were the temperature falls below y°C, and then use standard deviation of that (weighted by sample size). This approach worked, but is based on a relatively small dataset.
* The third approach uses the same idea as the second, but applies it to the minimum/maximum temperature data. To get something similar to daily TAVG, the following formula is applied TAVG´ = (max-min)/2+min. In addition, the script calculates winter predictability, by making a linear regression of temperature of the 31 days before winter onset in each year, and using the between-years standard deviation in slopes as unpredictabilty estimate. In addition, we calculate the "colour of environmental noise"

Only the third approach is followed, the scripts of the first two approaches may not work anymore because file locations may have shifted.