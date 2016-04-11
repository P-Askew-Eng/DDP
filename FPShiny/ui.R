library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("England Fuel Poverty Statistics"),
  sidebarPanel(
    h3("Input Area"),
    selectInput("var", 
                label = "Choose a year to display",
                choices = c("2010", "2011",
                            "2012", "2013"),
                selected = "2010"),
    
    sliderInput("range", 
                label = "Year of interest:",
                min = 0, max = 100, value = c(0, 100))
  ),
  mainPanel(
    h3("Output Area")
  )
))
