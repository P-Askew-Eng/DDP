#Preprocessing for Fue Poverty project

#Get files
if(!file.exists("data")){
  dir.create("data")
}

FPStatsurl<-"https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/485161/2013_Sub-regional_tables.xlsx"
if (!file.exists("./data/raw2013data2.xlsx")){
  download.file(FPStatsurl,destfile="./data/raw2013data2.xlsx",mode="wb")
}
# Read data in NB ensure that rjava and java are same architecture (32/64 bit)
# if necessary download manually http://java.com/en/download/manual.jsp
# however this package seems problematic so data was saved as csv directly from Excel
#library(R.utils)
#library(xlsx)
#file<-system.file("data","./data/raw2013data.xlsx",package="xlsx")
data<-read.xlsx("./data/raw2013data2.xlsx",7,header=TRUE,startRow=3,colIndex = 1:5)
#data<-read.xlsx("./data/raw2013data.xlsx",sheetIndex=7,header=TRUE,startRow=2)
FPdata<-read.csv("./data/2013County.csv",header=T,skip=2)