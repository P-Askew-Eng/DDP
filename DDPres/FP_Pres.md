FP_Pres
========================================================
author: Paul Askew
date: 22 April 2016

First Slide
========================================================

For more details on authoring R presentations click the
**Help** button on the toolbar.

- Bullet 1
- Bullet 2
- Bullet 3

Slide With Code
========================================================


```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](FP_Pres-figure/unnamed-chunk-2-1.png)

1 Introduction
========================================================
1. Fuel Poverty occurs where households spend a disproportinate amount of income on fuel needs such as heating lighting and cooking
2. this ws measured form 2008 as Households spending more than 10% of their income on fuel.
3. from 2011 a new measure ws introduced (Low Income High Cost) in which housing costs were excluded from the claculation.

2 Concept
========================================================

A preprocessing script downloads the data, extracts the releavant components and creates new files for use by the app.  The files include 
*local authoirty name
*number of households in each Local authority area by year
*number in fuel poverty by each year for the old and the new measures.  

It also loads the overall domestic energy use and how this is broken down between fuel sources for years of interest.

Use
========================================================

The user selects a local authority from a drop down list and the app displays a graph showing the change in fuel poverty over the years for which data is available The percentage of households is presented.

By selecting a radio button a detailed breakdown for a particular year is given, comprising the average energy use for that local authority and a pie chart of the fuels in use.

Example
========================================================


Future development
========================================================
1. Extend detailed data to housing types and incomes if the data can be found.
The fuel poverty data is on a sub regional basis and not all the other data is at a comparable level.

2. Create a choropleth (Geomap or heatmap) of the country.
No simple way exists for this to be created without processing shapefiles or kmls so it is beyond the scope of the project for the Coursera phase.

Links and References
========================================================
