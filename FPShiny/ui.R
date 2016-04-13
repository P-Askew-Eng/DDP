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
          tabPanel("Detailed Statistics", h3(textOutput("text1"))
                   ,h4(textOutput("text2"))
                   ,h4(textOutput("text3"))
                   ,plotOutput("conbrkdn")
                   ,h4(textOutput("text4"))
                   ),
          tabPanel("About", includeMarkdown("About.md")) 
      )    
 )
))

