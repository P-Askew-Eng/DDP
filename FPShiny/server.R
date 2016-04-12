library(shiny)

# Place for code that only needs to be run once e.g. loading the data.

houses<-read.csv("./data/numhouseholds.csv", header=T)
newfp<-read.csv("./data/newpovmeasure.csv", header=T)
councils<-houses[,1]
# Load and run another file 
# source("otherfile.R")
shinyServer(
    # this is the bit that runs when the user interacts
  function(input,output){
    }
)