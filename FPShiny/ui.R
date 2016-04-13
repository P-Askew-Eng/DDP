library(shiny)


shinyUI(pageWithSidebar(
  headerPanel("England Fuel Poverty Statistics"),
    uiOutput("ui"),
#  sidebarPanel(
#    h3("Input Area")
#    selectInput("var", 
#                label = "Choose a year to display",
#                choices = c("2010", "2011",
#                            "2012", "2013"),
#                selected = "2010"),
    
#    radioButtons("radio", 
#                 label = "Radio buttons",
#                 choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
#                 selected = 1),
#  ),
  
  
  mainPanel(
    plotOutput("plotDisplay"),
    dataTableOutput("mytable")
 )
))
