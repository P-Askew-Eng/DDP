---
title       : Fuel Poverty in England
subtitle    : JHU COursera developing Data Products Project
author      : Paul Askew
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## 1 Introduction

1. Fuel Poverty occurs where households spend a disproportinate amount of income on fuel needs such as heating lighting and cooking
2. this ws measured form 2008 as Households spending more than 10% of their income on fuel.
3. from 2011 a new measure ws introduced (Low Income High Cost) in which housing costs were excluded from the claculation.

--- .class #id 

## 2 Concept

A preprocessing script downloads the data, extracts the releavant components and creates new files for use by the app.  The files include 
*local authoirty name
*number of households in each Local authority area by year
*number in fuel poverty by each year for the old and the new measures.  

It also loads the overall domestic energy use and how this is broken down between fuel sources for years of interest.

### Use

The user selects a local authority from a drop down list and the app displays a graph showing the change in fuel poverty over the years for which data is available The percentage of households is presented.

By selecting a radio button a detailed breakdown for a particular year is given, comprising the average energy use for that local authority and a pie chart of the fuels in use.



--- .class #id 

## 3 Example

--- .class #id 

## 4 Future Development

1. Extend detailed data to housing types and incomes if the data can be found.
The fuel poverty data is on a sub regional basis and not all the other data is at a comparable level.

2. Create a choropleth (Geomap or heatmap) of the country.
No simple way exists for this to be created without processing shapefiles or kmls so it is beyond the scope of the project for the Coursera phase.


--- .class #id 

## 5 References

Digest Of UK Energy Statsistics




