library(shiny)


shinyUI(pageWithSidebar(
  headerPanel("England Fuel Poverty Statistics"),
    uiOutput("ui"),
#  Sidepanel  is generated in Server.R as it uses the data from the files
#    to generate the list
#   
  
  
  mainPanel(
      tabsetPanel(
          tabPanel("Annual Change", plotOutput("fpbyyear")), 
          tabPanel("Detailed Statistics", tableOutput("mytable")),
          tabPanel("About", includeMarkdown("About.md")) 
      )    
 )
))

