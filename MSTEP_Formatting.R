########  Format Data for Growth Analyses Codes  ######## 


library(data.table)
setwd("/home/ec2-user/SGP/MI/MSTEP/Data")
mstep37<-data.table(read.csv("SGP_AGP_MSTEP.csv", colClasses = c(UIC = "character", Barcode="character")))
psat<-data.table(read.csv("SGP_AGP_PSAT8.csv", colClasses = c(UIC = "character", Barcode="character")))
psat9<-data.table(read.csv("SGP_AGP_PSAT9.csv", colClasses = c(UIC = "character", Barcode="character")))
psat10<-data.table(read.csv("SGP_AGP_PSAT10.csv", colClasses = c(UIC = "character", Barcode="character")))
sat<-data.table(read.csv("SGP_AGP_SAT.csv", colClasses = c(UIC = "character", Barcode="character")))
mstep<-rbind(mstep37,psat,sat, psat9,psat10)

table(mstep$GrowthAnalysisTypeCode)


#
VALID_CASE="VALID_CASE"
GRADE<-mstep$DataElementGrade
YEAR<-mstep$DataElementAcademicYearName
SS<-mstep$DataElementSS
SSSE<-mstep$DataElementSSSE
mstep<-data.frame(mstep,GRADE, YEAR, SS, SSSE,VALID_CASE)
MStep.small<-data.table(mstep[,c("YEAR","ContentAreaName","UIC","GRADE","SS","SSSE","VALID_CASE")])
MStep.small$GRADE=as.numeric(as.character(MStep.small$GRADE))
names(MStep.small)<-c("YEAR","CONTENT_AREA","ID","GRADE","SCALE_SCORE","CSEM", "VALID_CASE")
MStep.small<-data.table(MStep.small)
MStep.small[YEAR=="2021-2022", YEAR:="2021_2022"]
MStep.small[YEAR=="2022-2023", YEAR:="2022_2023"]

MStep.small[CONTENT_AREA=="Mathematics",CONTENT_AREA:="MATHEMATICS"]
MStep.small[CONTENT_AREA=="English Language Arts",CONTENT_AREA:="READING"]
MStep.small[CONTENT_AREA=="Reading",CONTENT_AREA:="READING"]
MStep.small[CONTENT_AREA=="Social Studies", CONTENT_AREA:="SOCIAL_STUDIES"]
MStep.small[CONTENT_AREA=="Science", CONTENT_AREA:="SCIENCE"]

save(MStep.small, file = "MStep.small.Rdata")

#save(MStep.small, file = "MStep_GAC09.Rdata")

#Data For Damian 09 OP only and pulling other data for 2019 SS
#dat2122<-MStep.small[MStep.small$YEAR=="2021_2022",]
#save(dat2122, file = "MStep2122.Rdata")
#library(data.table)
#setwd("//Coloisilon/Psychometrics/MI/277/SGP/Student Data")
#load("MStep_GAC9.Rdata")
#SS_G5_2019=MStep.small[MStep.small$CONTENT_AREA=="SOCIAL_STUDIES" & YEAR=="2018_2019" & GRADE==5]
#save(SS_G5_2019=, file = "SS_G5_2019.Rdata")
