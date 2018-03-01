The separate folders represent different trials to calculate winter predictabilty/variability. 


* The first approach was to make in each year a regression and note the point where the regression line crosses 12°C. The standard deviation was used as winter variability. This approach has some issues and was discontinued
* The second approach was to find the xth day were the temperature falls below y°C, and then use standard deviation of that (weighted by sample size). This approach worked, but is based on a relatively small dataset.
* The third approach uses the same idea as the second, but applies it to the minimum/maximum temperature data. To get something similar to daily TAVG, the following formula is applied TAVG´ = (max-min)/2+min. In addition, the script calculates the correlation of T at winter onset and T 1,2, or 3 weeks before winter onset. 