# MechaCar Statistical Analysis

## Overview
I used R Studio with R programming to analyze MechaCar's manufacturing and performance and how it may be compared internally and externally by statistical methods.

## Resources
- R-Studio
- MechaCar_mpg.csv
- Suspension_Coil.csv

## Results

### Linear Regression to Predict MPG
When testing 5 separate dependent variables in determining the impact on miles per gallon (MPG), a multiple linear regression model shows two of them have a significant likelihood of impact and one has a slight likelihood of impact.  

![image](https://github.com/jakatz87/MechaCar_Statistical_Analysis/blob/main/Resources/Images/Mult_Lin_Reg.png) 

Although Vehicle Weight has a p-value of .08, showing it may or may not have a non-zero impact on MPG, both Vehicle Length and Ground Clearance have extremely low p-values to show both dependent variables are very likely to have a non-zero impact on MPG.

Since we have shown two variables that are very likely to have an impact on MPG, the slope of this linear model is not zero.  Since the y-intercept of the model also has a significantly low p-value, we are assured that the variables we have tested are sufficient	to determine which impact MPG, although we have not exhausted the possible data to analyze.

Based on this multiple linear regression, we can look more deeply at the impact of Vehicle Length and Ground Clearance. The linear model for Vehicle Length and MPG would show that longer cars tend to have higher gas mileage, but only with a moderate correlation coefficient of 0.61.  

![image](https://github.com/jakatz87/MechaCar_Statistical_Analysis/blob/main/Resources/Images/Cor_V_Length.png)

The linear model for Ground Clearance and MPG would show that cars higher off the ground may tend to have better gas mileage, but very weakly correlated with a coefficient of 0.33.

![image](https://github.com/jakatz87/MechaCar_Statistical_Analysis/blob/main/Resources/Images/Cor_G_Clear.png)
With the correlation coefficients quantified, the only possible predictive variable for gas mileage performance would be vehicle length.

![image](https://github.com/jakatz87/MechaCar_Statistical_Analysis/blob/main/Resources/Images/Cor_Matrix.png)

Further analysis of the impacts on MPG should include data for engines and tires.

### Summary Statistics on Suspension Coils
MechaCar has provided suspension coil data for three separate manufacturing lots.  Since each lot manufactured 50 vehicles, the suspension coil data is revealing.  Although overall statistics for coil pressure thresholds (PSI) show a variance of 62.29 and a standard deviation of 7.89 from the Mean of 1498.78 and Median of 1500, these may not be the manufacturing targets the company wants to pursue.

![image](https://github.com/jakatz87/MechaCar_Statistical_Analysis/blob/main/Resources/Images/psi_summary.png)

When looking at specific manufacturing lot data, it is evident that each lot has quite a different manufacturing performance.  

![image](https://github.com/jakatz87/MechaCar_Statistical_Analysis/blob/main/Resources/Images/Lot_Summary.png)

Lot 3 is failing the design specifications for the coils, as the PSI variance far exceeds the limit of 100 pounds per square inch.
Although Lot 2 has admirably limited its variance of coil PSI, the management team for MechaCar may want to spend time with Lot 1 to study how they have masterfully managed consistency in their coil production.

### T-Tests on Suspension Coils
The company is looking to see if the three manufacturing lots create suspension coils on par with a population mean of 1,500 PSI.  Running t-tests can make this determination.

![image](https://github.com/jakatz87/MechaCar_Statistical_Analysis/blob/main/Resources/Images/population_t_test.png)

The three MechaCar manufacturing lots, when analyzed together, are questionably a fair representation for the coil population mean of 1,500 PSI.  The p-value is only 0.06, which is near the threshold of such a determination.  To get a better sense of comparing manufacturing to the population mean measure of 1,500 PSI, it is better to compare each lot.

![image](https://github.com/jakatz87/MechaCar_Statistical_Analysis/blob/main/Resources/Images/lot_subset_t_tests.png)

Lot 1 has the strongest comparability to the population mean, as its p-value returned 1.0.
Lot 2 has a strong comparability to the population mean with a p-value of 0.61.
Lot 3, however, was not comparable to the population mean, returning a p-value of 0.04.

## Summary
### Study Design: MechaCar vs. Competition
When comparing MechaCar vehicles to it competition, data analysis that would be of interest would include the following metrics:
-	Cost
-	Depreciation (0 – 5, 6 – 10, 11 – 15 year intervals)
-	City MPG
-	Hwy MPG
-	Average Annual Maintenance Costs
-	Safety Rating
-	Average Length of Ownership (ALO)


Many analyses can be run with these data, two examples are:
#### Higher Safety Rating scores will lead to higher Average Length of Ownership
  *	Null Hypothesis: Safety Rating scores do not have an impact on ALO.
   +	Run a linear model qualitative analysis to determine if there is a correlation between Safety Rating and ALO.
   *	Run a linear model quantitative analysis to determine p-value and r squared for Safety Rating.
####	MechaCar has a lower 10 year Depreciation than X competitor 
  *	Null Hypothesis: MechaCar does not have a lower 10 year Depreciation.
   *	Use t-tests to determine comparable populations between MechaCar and X
    *	Create subsets for the t-test: MPG, Initial Cost, Safety Rating
   *	Populations with high t-test p-values can be compared on Depreciation.

With these data, mangers and analysts have multiple points of inquiry that lead to MechaCar’s success.



