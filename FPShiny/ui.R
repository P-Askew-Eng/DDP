library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("England Fuel Poverty Statistics"),
  sidebarPanel(
    h3("Input Area")
               ),
  mainPanel(
    h3("Output Area")
  )
))