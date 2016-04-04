#Preprocessing for Fuel Poverty project
#files come from the UK GOvernment's DIgest of UK Energy Statisitcs.  The data is for England only.
#Get files
if(!file.exists("data")){
  dir.create("data")
}
#First download files make sure to use mode="wb" as Excel is a binary file and without this
#read.xlsx can't read the file.
FPStatsurl<-"https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/485161/2013_Sub-regional_tables.xlsx"
if (!file.exists("./data/raw2013data2.xlsx")){
  download.file(FPStatsurl,destfile="./data/raw2013data2.xlsx",mode="wb")
}
# Read data in NB ensure that rjava and java are same architecture (32/64 bit)
# if necessary download manually http://java.com/en/download/manual.jsp

2013dat<-read.xlsx("./data/raw2013data2.xlsx",sheetName="Table 4",header=TRUE,startRow=3,colIndex = 1:5)
