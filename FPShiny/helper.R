#setwd("C:/Users/Paul/OneDrive/Coursera/DDP/FPShiny")

#read and tidy poverty data
houses<-read.csv("./data/numhouseholds.csv", header=T)
rownames(houses)<-houses[,2]
houses<-houses[,-c(1,2)]
colnames(houses)<-c("2011","2012","2013","2014")
newfp<-read.csv("./data/newpovmeasure.csv", header=T)
rownames(newfp)<-newfp[,2]
newfp<-newfp[,-c(1,2)]

#read and tidy consumption data
colnames(newfp)<-c("2011","2012","2013","2014")
cons2011<-read.csv("./data/Cons2011dat.csv",header=T)
cons2012<-read.csv("./data/Cons2012dat.csv",header=T)
cons2013<-read.csv("./data/Cons2013dat.csv",header=T)
#cons2014<-read.csv("./data/Cons2014dat.csv",header=T)
#rownames(cons2014)<-cons2014[,2]
#cons2014<-cons2014[,-c(1,2)]
rownames(cons2013)<-cons2013[,2]
cons2013<-cons2013[,-c(1,2)]
rownames(cons2012)<-cons2012[,2]
cons2012<-cons2012[,-c(1,2)]
rownames(cons2011)<-cons2011[,2]
cons2011<-cons2011[,-c(1,2)]
#calculations
natpov<-round(colSums(newfp)/colSums(houses)*100,2)
