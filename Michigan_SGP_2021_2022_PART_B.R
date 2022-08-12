###############################################################################
###                                                                         ###
###          Michigan 2019 consecutive-year BASELINE SGP analyses           ###
###          NOTE: Doing this in 2022 thus the file name                    ###
###                                                                         ###
###############################################################################

###   Load packages
require(SGP)
require(data.table)
require(SGPmatrices)

###   Load data
load("Data/Michigan_SGP.Rdata")

###   Add Baseline matrices to SGPstateData
SGPstateData <- addBaselineMatrices("MI", "2021")
SGPstateData[["MI"]][["Assessment_Program_Information"]][["CSEM"]] <- NULL

###   Rename the skip-year SGP variables and objects

##    We can simply rename the BASELINE variables. We only have 2019/21 skip yr
# table(Michigan_SGP@Data[!is.na(SGP_BASELINE),
#         .(CONTENT_AREA, YEAR), GRADE], exclude = NULL)
baseline.names <- grep("BASELINE", names(Michigan_SGP@Data), value = TRUE)
setnames(Michigan_SGP@Data,
         baseline.names,
         paste0(baseline.names, "_SKIP_YEAR"))

sgps.2019 <- grep(".2019.BASELINE", names(Michigan_SGP@SGP[["SGPercentiles"]]))
names(Michigan_SGP@SGP[["SGPercentiles"]])[sgps.2019] <-
    gsub(".2019.BASELINE",
         ".2019.SKIP_YEAR_BASELINE",
         names(Michigan_SGP@SGP[["SGPercentiles"]])[sgps.2019])


###   Read in SGP Configuration Scripts and Combine
source("SGP_CONFIG/2022/PART_A/ELA.R")
source("SGP_CONFIG/2022/PART_A/MATHEMATICS.R")

MI_Baseline_Config_2019 <- c(
  ELA.2019.config,
  ELA_PSAT_9.2019.config,
  ELA_PSAT_10.2019.config,
  ELA_SAT.2019.config,

  MATHEMATICS.2019.config,
  MATHEMATICS_PSAT_9.2019.config,
  MATHEMATICS_PSAT_10.2019.config,
  MATHEMATICS_SAT.2019.config
)

###   Parallel Config
parallel.config <- list(BACKEND = "PARALLEL",
                        WORKERS = list(BASELINE_PERCENTILES = 8))


#####
###   Run abcSGP analysis
#####

Michigan_SGP <-
    abcSGP(sgp_object = Michigan_SGP,
           years = "2019",
           steps = c("prepareSGP", "analyzeSGP", "combineSGP"),
           sgp.config = MI_Baseline_Config_2019,
           sgp.percentiles = FALSE,
           sgp.projections = FALSE,
           sgp.projections.lagged = FALSE,
           sgp.percentiles.baseline = TRUE,
           sgp.projections.baseline = FALSE,
           sgp.projections.lagged.baseline = FALSE,
           simulate.sgps = FALSE,
           parallel.config = parallel.config)

###   Save results
save(Michigan_SGP, file = "Data/Michigan_SGP.Rdata")