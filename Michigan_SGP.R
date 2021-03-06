##########################################################################
###                                                                    ###
###     Michigan SGP analysis script for 2019                          ###
###                                                                    ###
##########################################################################

### Load packages

require(data.table)
require(SGP)


### Load Data

load("Data/Michigan_Data_LONG.Rdata")


### Load configurations

source("SGP_CONFIG/2019/MATHEMATICS.R")
source("SGP_CONFIG/2019/READING.R")
source("SGP_CONFIG/2019/SOCIAL_STUDIES.R")

Michigan.2018_2019.config <- c(MATHEMATICS.2018_2019.config, READING.2018_2019.config, SOCIAL_STUDIES.2018_2019.config)


### Run abcSGP

Michigan_SGP <- abcSGP(
		sgp_object=Michigan_Data_LONG,
		steps=c("prepareSGP", "analyzeSGP", "combineSGP", "outputSGP"),
		years="2018_2019",
		sgp.percentiles=TRUE,
		sgp.projections=TRUE,
		sgp.projections.lagged=TRUE,
		sgp.percentiles.baseline=FALSE,
		sgp.projections.baseline=FALSE,
		sgp.projections.lagged.baseline=FALSE,
		sgp.percentiles.equated=TRUE,
		simulate.sgps=TRUE,
		sgp.sqlite=TRUE,
		parallel.config=list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=4,  PROJECTIONS=4, LAGGED_PROJECTIONS=4)),
		sgp.config= Michigan.2018_2019.config)


## Save results

save(Michigan_SGP, file="Data/Michigan_SGP.Rdata")
