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
          tothouses<-as.numeric(houses[input$council,2:4])
          totpov<-as.numeric(newfp[input$council,2:4])
          ratio<-as.numeric(totpov[,1:3]/tothouses[,1:3]*100)
          print(ratio)
          barplot(ratio, 
                  #main=("Households in Fuel Poverty in /n" + input$Council), 
                  names.arg=colnames(houses[,1:3]),
                  ylim=c(0,30),
                  ylab="Percentage of Households in Fuel Poverty",
                  xlab="Year")
          
      })  # end renderPlot
      output$mytable = renderDataTable({
          tothouses<-as.numeric(houses[input$council,2:4])
          totpov<-as.numeric(newfp[input$council,2:4])
          ratio<-as.numeric(totpov/tothouses)
          print(totpov)
          print(ratio)
          observe(input$council)
      })
          }
)