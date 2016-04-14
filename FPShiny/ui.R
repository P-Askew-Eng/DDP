library(shiny)
require(markdown)

shinyUI(pageWithSidebar(
  headerPanel("England Fuel Poverty Statistics"),
    uiOutput("ui"),
#  Sidepanel  is generated in Server.R as it uses the data from the files
#    to generate the list
#   
  
  
  mainPanel(
      tabsetPanel(
          tabPanel("Annual Change", plotOutput("fpbyyear")), 
          tabPanel("Detailed Statistics", h4(textOutput("text1"))
                   ,h5(textOutput("text2"))
                   ,h5(textOutput("text3"))
                   ,plotOutput("conbrkdn")
                   ,h5(htmlOutput("text4"))
                   ),
          tabPanel("Help", includeMarkdown("About.md")) 
      )    
 )
))

