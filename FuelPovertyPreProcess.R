#Preprocessing for Fuel Poverty project
#files come from the UK GOvernment's DIgest of UK Energy Statisitcs.  The data is for England only.

library(openxlsx)# yhis can handle bigger (small) Excel files
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
FPStatsurl<-"https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/481867/NOVEMBER_2015_-_Sub-national_total_final_energy_consumption_statistics_FINAL.xlsx"
if (!file.exists("./data/consumptiondata.xlsx")){
    download.file(FPStatsurl,destfile="./data/consumptiondata.xlsx",mode="wb")
}
FP2011dat<-read.xlsx("./data/raw2011data2.xlsx",sheet=3,colNames=TRUE,startRow=3)
FP2012dat<-read.xlsx("./data/raw2012data2.xlsx",sheet=5,colNames=TRUE,startRow=3)
FP2013dat<-read.xlsx("./data/raw2013data2.xlsx",sheet=5,colNames=TRUE,startRow=3)
Cons2011dat<-read.xlsx("./data/consumptiondata.xlsx",sheet=17,colNames=TRUE,startRow=4)
Cons2012dat<-read.xlsx("./data/consumptiondata.xlsx",sheet=18,colNames=TRUE,startRow=4)
Cons2013dat<-read.xlsx("./data/consumptiondata.xlsx",sheet=19,colNames=TRUE,startRow=4)

#Now to tidy the data up
FP2011dat<-FP2011dat[order(FP2011dat$LA.Name),]
FP2012dat<-FP2012dat[order(FP2012dat$LA.Name),]
FP2013dat<-FP2013dat[order(FP2013dat$LA.Name),]
numhouseholds<-cbind(data.frame(FP2011dat[,2],FP2011dat[,4],FP2012dat[,4],FP2013dat[,4],stringsAsFactors = FALSE))
colnames(numhouseholds)<-c("Authority",2011,2012,2013)
newpovmeasure<-cbind(data.frame(FP2011dat[,2],FP2011dat[,6]*100,FP2012dat[,6],FP2013dat[,6],stringsAsFactors = FALSE))
colnames(newpovmeasure)<-c("Authority",2011,2012,2013)
write.csv(numhouseholds,file="./FPShiny/data/numhouseholds.csv")
write.csv(newpovmeasure,file="./FPShiny/data/newpovmeasure.csv")
#energy consumption columns of interest are(2,4,9,13,19,24) rows 61 to 394