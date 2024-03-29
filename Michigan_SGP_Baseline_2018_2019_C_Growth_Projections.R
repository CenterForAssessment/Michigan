####################################################################################################
###                                                                                              ###
###   Michigan Learning Loss Analyses -- 2018-2019 Baseline Growth Straight Projections          ###
###   NOTE: Consecutive year projections (Note pretending we know about about the 2020 pandemic  ###
###                                                                                              ###
####################################################################################################

###   Load packages
require(SGP)

###   Load data from baseline SGP analyses
load("Data/Michigan_SGP.Rdata")

###   Add single-cohort baseline matrices to SGPstateData
SGPstateData <- SGPmatrices::addBaselineMatrices("MI", "2020_2021")

### NULL out assessment transition in 2019 (since already dealth with)
SGPstateData[["MI"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <- NULL
SGPstateData[["MI"]][["Assessment_Program_Information"]][["Scale_Change"]] <- NULL

###   Read in BASELINE projections configuration scripts and combine
source("SGP_CONFIG/2018_2019/BASELINE/Projections/READING.R")
source("SGP_CONFIG/2018_2019/BASELINE/Projections/MATHEMATICS.R")

MI_2018_2019_Baseline_Config <- c(
	READING_2018_2019.config,
	MATHEMATICS_2018_2019.config
)

#####
###   Run projections analysis - run abcSGP on object from BASELINE SGP analysis
#####

Michigan_SGP <- abcSGP(
        sgp_object = Michigan_SGP,
        steps = c("prepareSGP", "analyzeSGP"), # no changes to @Data - don't combine or output
        sgp.config = MI_2018_2019_Baseline_Config,
        sgp.percentiles = FALSE,
        sgp.projections = FALSE,
        sgp.projections.lagged = FALSE,
        sgp.percentiles.baseline = FALSE,
        sgp.projections.baseline = TRUE, # Need P50_PROJ_YEAR_1_CURRENT for Ho's Fair Trend/Equity Check metrics
        sgp.projections.lagged.baseline = FALSE,
        save.intermediate.results = FALSE,
        parallel.config = list(BACKEND = "PARALLEL", WORKERS=list(PROJECTIONS=8))
)

###   Save results
save(Michigan_SGP, file="Data/Michigan_SGP.Rdata")
