library(shiny)

# Place for code that only needs to be run once e.g. loading the data.

houses<-read.csv("./data/numhouseholds.csv", header=T)
colnames(houses)<-c("Council","2011","2012","2013")
rownames(houses)<-houses[,2]
houses<-houses[,-1]
newfp<-read.csv("./data/newpovmeasure.csv", header=T)
colnames(newfp)<-c("Council","2011","2012","2013")
rownames(newfp)<-newfp[,2]
newfp<-newfp[,-1]

# Load and run another file 
# source("otherfile.R")


shinyServer(
    # this is the bit that runs when the user interacts
  function(input,output){
      output$ui <- renderUI({sidebarPanel( 
          
          selectInput("council", "Local Authority:", 
                      choices=rownames(houses)),
          hr(),
          helpText("Data from DUKES 2011-2013")
      )
      })# end sidebarPanel
      
      output$plotDisplay <- renderPlot({
          tothouses<-houses[input$council,1:3]
          totpov<-as.numeric(newfp[input$council,1:3])
          barplot(totpov, 
                  main=input$Council, names.arg=colnames(houses[,1:3]),
                  ylim=c(0,30),
                  ylab="Percentage of Fuel Poverty",
                  xlab="Year")
          
      })  # end renderPlot
      
          }
)