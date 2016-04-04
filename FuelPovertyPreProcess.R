#Preprocessing for Fuel Poverty project
#files come from the UK GOvernment's DIgest of UK Energy Statisitcs.  The data is for England only.
#library(xlsx)
library(openxlsx)
#Get files
if(!file.exists("data")){
  dir.create("data")
}
#First download files make sure to use mode="wb" as Excel is a binary file and without this
#read.xlsx can't read the file.
# Read data in NB ensure that rjava and java are same architecture (32/64 bit)
# if necessary download manually http://java.com/en/download/manual.jsp
FPStatsurl<-"https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/485161/2013_Sub-regional_tables.xlsx"
if (!file.exists("./data/raw2013data2.xlsx")){
  download.file(FPStatsurl,destfile="./data/raw2013data2.xlsx",mode="wb")
}
FPStatsurl<-"https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/318998/2012_Sub-regional_LIHC_Final.xlsx"
if (!file.exists("./data/raw2012data2.xlsx")){
    download.file(FPStatsurl,destfile="./data/raw2012data2.xlsx",mode="wb")
}
FPStatsurl<-"https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/227002/2011_sub_regional_data.xlsx"
if (!file.exists("./data/raw2011data2.xlsx")){
    download.file(FPStatsurl,destfile="./data/raw2011data2.xlsx",mode="wb")
}
#FP2011dat<-read.xlsx("./data/raw2011data2.xlsx",sheetName="County",header=TRUE,startRow=3,colIndex = 1:5)
#FP2012dat<-read.xlsx("./data/raw2012data2.xlsx",sheetName="Table 4",header=TRUE,startRow=3,colIndex = 1:5)
#FP2013dat<-read.xlsx("./data/raw2013data2.xlsx",sheetName="Table 4",header=TRUE,startRow=3,colIndex = 1:5)
FP2011dat<-read.xlsx("./data/raw2011data2.xlsx",sheet=5,colNames=TRUE,startRow=3)
FP2012dat<-read.xlsx("./data/raw2012data2.xlsx",sheet=7,colNames=TRUE,startRow=3)
FP2013dat<-read.xlsx("./data/raw2013data2.xlsx",sheet=7,colNames=TRUE,startRow=3)