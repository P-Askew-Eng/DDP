Fuel Poverty Shiny Application
========================================================
author: Paul Askew
date: April 2016

Completed as part of Coursera Developing Data Products module


Introduction
========================================================
1. Fuel Poverty occurs where households spend a disproportinate amount of income on fuel needs such as heating, lighting and cooking
2. This was measured from 2010 as households spending more than 10% of their income on fuel.
3. From 2011 a new measure was introduced (Low Income High Cost) in which housing costs were excluded from the calculation.  It is this measure that the App uses.

Fuel Poverty rates in England for the Years 2011 to 2013

```
           2011  2012  2013
Average % 10.90 10.40 10.40
Maximum % 15.49 20.15 18.93
Minimum %  8.14  2.36  3.88
```

Design
========================================================

A preprocessing script downloads the data, extracts the relevant components and creates new files for use by the app.  The files include 

- local authority name
- number of households in each Local authority area by year
- number in fuel poverty by each year  
- overall domestic energy use

The processed data is saved as smaller files for use in the Shiny App

The App is available on [Shiny](https://p-askew-eng.shinyapps.io/FPShiny/) and the code is available on [Github](https://github.com/P-Askew-Eng/DDP)

Use
========================================================

![Screenshot](FP_Pres-figure/ShinyFP2.png)
![Screenshot](FP_Pres-figure/ShinyFP.png)
***
The user selects a local authority from a drop down list and the app displays a graph showing the change in fuel poverty over the years for which data is available The percentage of households is presented.

By selecting a radio button a detailed breakdown for a particular year is given, comprising the average energy use for that local authority and a pie chart of the fuels in use.

Future development
========================================================
1. Extend detailed data to housing types and incomes if the data can be found.
The fuel poverty data is on a sub regional basis and not all the other data is at a comparable level.

2. Create a choropleth (Geomap or heatmap) of the country.
No simple way exists for this to be created for the UK without processing shapefiles or kmls so it is beyond the scope of the project for the Coursera phase.

3. Expand to other UK nations

4. Update with new data as available

5. Optimise processing


