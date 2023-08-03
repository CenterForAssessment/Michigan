########################################################################################
###                                                                                  ###
###                               Michigan SGP Analyses                              ###
###                                      2022-2023                                   ###
###                                                                                  ###
########################################################################################

###   Load packages
#devtools::install_github("centerforassessment/SGP")
require(SGP)
require(data.table)
#devtools::install_github("centerforassessment/SGPmatrices")
require(SGPmatrices)

###   Load data
load("Data/Base_Files/MStep2223.Rdata") 

Michigan_Data_LONG <- MStep2223[CONTENT_AREA %in% c("READING", "MATHEMATICS")]


SGPstateData[["MI"]][["Assessment_Program_Information"]][["CSEM"]] <-"CSEM"
SGPstateData[["MI"]][["SGP_Configuration"]][['rq.method']] <- "fn"

###   Read in SGP Configuration Scripts and Combine
source("SGP_CONFIG/2022_2023/READING.R")
source("SGP_CONFIG/2022_2023/MATHEMATICS.R")
source("SGP_CONFIG/2022_2023/MI MetaData.R")


MI_2022_2023 <- c(
  READING.2022_2023.config,
  MATHEMATICS.2022_2023.config
)

### Parameters
parallel.config <- list(BACKEND="PARALLEL", 
                        WORKERS=list(PERCENTILES=3, PROJECTIONS=3, 
                        LAGGED_PROJECTIONS=3, SGP_SCALE_SCORE_TARGETS=3))


Michigan_SGP <- abcSGP(
  sgp_object=Michigan_Data_LONG,
  steps = c("prepareSGP", "analyzeSGP", "combineSGP"),
  sgp.config = MI_2022_2023 ,
  sgp.percentiles = TRUE,
  sgp.projections = TRUE,
  sgp.projections.lagged = TRUE,
  sgp.percentiles.baseline = FALSE,  
  sgp.projections.baseline = FALSE, 
  sgp.projections.lagged.baseline = FALSE, 
  simulate.sgps=TRUE,
#  sgp.test.cohort.size=10000,
  parallel.config = parallel.config,
  sgp.target.scale.scores = TRUE
)

#

###   Save results
#save(Michigan_SGP, file="Data/Michigan_SGP.Rdata")
#outputSGP(Michigan_SGP, state="MI",output.type="LONG_FINAL_YEAR_Data")


###
###   summarizeSGP
###

#Michigan_SGP <- summarizeSGP(
#  Michigan_SGP,
#  parallel.config=list(
#    BACKEND="PARALLEL", WORKERS=list(SUMMARY=18))
#)

#Michigan_Summary_2023<- Michigan_SGP@Summary
#save(Michigan_Summary_2023, file="Data/Michigan_Summary_2023.Rdata")

