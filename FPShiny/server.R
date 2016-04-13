library(shiny)

# Place for code that only needs to be run once e.g. loading the data.

#
# Load and run another file 
 source("helper.R")


shinyServer(
    # this is the bit that runs when the user interacts
  function(input,output){
      var <- reactive({input$year})
            output$ui <- renderUI({sidebarPanel( 
          
          selectInput("council", "Select Local Authority:", 
                      choices=rownames(houses), selected = "Adur"),
          hr(),
          helpText("Data from DUKES 2011-2013"),
          hr(), hr(), hr(),    
          
              radioButtons("year", 
                           label = " Select Year of Interest",
                           choices = list("2011", "2012", "2013"), 
                           selected = "2013"),
          hr(),     
          helpText("Select year to display information in the Detailed Statistics tab
                   
                   
                   ")
      )
      })# end sidebarPanel
      
      output$fpbyyear <- renderPlot({
          tothouses<-as.numeric(houses[input$council,])
          totpov<-as.numeric(newfp[input$council,])
          ratio<-as.numeric(totpov/tothouses*100)
          chrttit<-paste("Households in Fuel Poverty in",input$council)
          barplot(ratio, 
                  main=chrttit, 
                  names.arg=colnames(houses[,1:3]),
                  ylim=c(0,25),
                  ylab="Percentage of Households in Fuel Poverty",
                  xlab="Year")
          
      })  # end renderPlot
 #     output$mytable = renderDataTable({
 #         if (var=="2013"){
 #             cons2013[input$council,]
 #        }

    output$text1 <- renderText({ 
              paste("Detailed Statistics for", input$year, "in", input$council)
          })           
    output$text2 <- renderText({ 
        paste("Number of households in fuel poverty: ",newfp[input$council,input$year],"(",
              round(newfp[input$council,input$year]/houses[input$council,input$year]*100,2),"%)", sep="")
    })          
    output$text3 <- renderText({ 
        paste("National Average for ", input$year,": ",
              round(sum(newfp[,input$year])/sum(houses[,input$year])*100,2),"%",  sep="")
    })    
    output$text4 <- renderText({ 
        if (input$year=="2013"){
            consummary<-as.numeric(cons2013[input$council,])
        } else if (input$year=="2012"){
            consummary<-as.numeric(cons2012[input$council,])
        } else if (input$year=="2011"){
            consummary<-as.numeric(cons2011[input$council,])
        }
        paste("Average Annual Household Consumption ", input$year,": ",
              round(sum(consummary)/sum(houses[input$council,input$year])*1000,2),"MWh",sep="")
    })   
    
        output$conbrkdn <- renderPlot({
        if (input$year=="2013"){
            consummary<-as.numeric(cons2013[input$council,])
            } else if (input$year=="2012"){
                consummary<-as.numeric(cons2012[input$council,])
            } else if (input$year=="2011"){
                consummary<-as.numeric(cons2011[input$council,])
            }
           pie(consummary, 
            labels="",
            main=paste("Proportion of Energy used in",input$council,"in",input$year),
            col=rainbow(5)
            )
        legend("topright",c("Coal","Manufactured","Oil","Gas","Electricity"),
               fill=rainbow(5))
})  # end renderPlot 
  })