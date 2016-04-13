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
          
          selectInput("council", "Select Local Authority:", 
                      choices=rownames(houses), selected = "Adur"),
          hr(),
          helpText("Data from DUKES 2011-2013
                   
                   
                   "),
      
          
              radioButtons("year", 
                           label = " Select Year of Interest",
                           choices = list("2011" = 1, "2012" = 2, "2013" = 3), 
                           selected = 1),
          
          helpText("Select year to display informaiton in the Detailed Statistics tab
                   
                   
                   ")
      )
      })# end sidebarPanel
      
      output$fpbyyear <- renderPlot({
          tothouses<-as.numeric(houses[input$council,2:4])
          totpov<-as.numeric(newfp[input$council,2:4])
          ratio<-as.numeric(totpov/tothouses*100)
          chrttit<-paste("Households in Fuel Poverty in",input$council)
          barplot(ratio, 
                  main=chrttit, 
                  names.arg=colnames(houses[,1:3]),
                  ylim=c(0,30),
                  ylab="Percentage of Households in Fuel Poverty",
                  xlab="Year")
          
      })  # end renderPlot
      output$mytable = renderDataTable({
          tothouses<-as.numeric(houses[input$council,2:4])
          totpov<-as.numeric(newfp[input$council,2:4])
          ratio<-as.numeric(totpov/tothouses)*100

      })
          }
)