######################################################################################
###
### Scripts for the calculation of SGPs for Michigan
###
######################################################################################

### Load SGP Package

require(SGP)


### Load data

load("Data/Michigan_Data_LONG.Rdata")


### Create Configurations

MICHIGAN.2012_2013.config <- list(
	MATHEMATICS.2012_2013.config=list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
                sgp.panel.years=c('2009_2010', '2010_2011', '2011_2012', '2012_2013'),
                sgp.grade.sequences=list(c('3', '4'), c('3', '4', '5'), c('3', '4', '5', '6'), c('4', '5', '6', '7'), c('5', '6', '7', '8'))),
	MATHEMATICS.MME.2012_2013.config=list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
                sgp.panel.years=c('2007_2008', '2008_2009', '2009_2010', '2012_2013'),
                sgp.grade.sequences=list(c('6', '7', '8', '11'))),
	READING.2012_2013.config=list(
                sgp.content.areas=c('READING', 'READING', 'READING', 'READING'),
                sgp.panel.years=c('2009_2010', '2010_2011', '2011_2012', '2012_2013'),
                sgp.grade.sequences=list(c('3', '4'), c('3', '4', '5'), c('3', '4', '5', '6'), c('4', '5', '6', '7'), c('5', '6', '7', '8'))),
	READING.MME.2012_2013.config=list(
                sgp.content.areas=c('READING', 'READING', 'READING', 'READING'),
                sgp.panel.years=c('2007_2008', '2008_2009', '2009_2010', '2012_2013'),
                sgp.grade.sequences=list(c('6', '7', '8', '11'))),
#	WRITING.2012_2013.config=list( ### NO 4th GRADE 2009_2010 cases
#                sgp.content.areas=c('WRITING', 'WRITING'),
#                sgp.panel.years=c('2009_2010', '2012_2013'),
#                sgp.grade.sequences=list(c('4', '7'))),
	WRITING.MME.2012_2013.config=list(
                sgp.content.areas=c('WRITING', 'WRITING'),
                sgp.panel.years=c('2008_2009', '2012_2013'),
                sgp.grade.sequences=list(c('7', '11'))),
	SCIENCE.2012_2013.config=list(
                sgp.content.areas=c('SCIENCE', 'SCIENCE'),
                sgp.panel.years=c('2009_2010', '2012_2013'),
                sgp.grade.sequences=list(c('5', '8'))),
	SCIENCE.MME.2012_2013.config=list(
                sgp.content.areas=c('SCIENCE', 'SCIENCE'),
                sgp.panel.years=c('2009_2010', '2012_2013'),
                sgp.grade.sequences=list(c('8', '11'))),
	SOCIAL_STUDIES.2012_2013.config=list(
                sgp.content.areas=c('SOCIAL_STUDIES', 'SOCIAL_STUDIES'),
                sgp.panel.years=c('2009_2010', '2012_2013'),
                sgp.grade.sequences=list(c('6', '9'))),
	SOCIAL_STUDIES.MME.2012_2013.config=list(
                sgp.content.areas=c('SOCIAL_STUDIES', 'SOCIAL_STUDIES'),
                sgp.panel.years=c('2010_2011', '2012_2013'),
                sgp.grade.sequences=list(c('9', '11'))))

MICHIGAN.2013_2014.config <- list(
	MATHEMATICS.2013_2014.config=list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
                sgp.panel.years=c('2010_2011', '2011_2012', '2012_2013', '2013_2014'),
                sgp.grade.sequences=list(c('3', '4'), c('3', '4', '5'), c('3', '4', '5', '6'), c('4', '5', '6', '7'), c('5', '6', '7', '8'))),
	MATHEMATICS.MME.2013_2014.config=list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
                sgp.panel.years=c('2008_2009', '2009_2010', '2010_2011', '2013_2014'),
                sgp.grade.sequences=list(c('6', '7', '8', '11'))),
	READING.2013_2014.config=list(
                sgp.content.areas=c('READING', 'READING', 'READING', 'READING'),
                sgp.panel.years=c('2010_2011', '2011_2012', '2012_2013', '2013_2014'),
                sgp.grade.sequences=list(c('3', '4'), c('3', '4', '5'), c('3', '4', '5', '6'), c('4', '5', '6', '7'), c('5', '6', '7', '8'))),
	READING.MME.2013_2014.config=list(
                sgp.content.areas=c('READING', 'READING', 'READING', 'READING'),
                sgp.panel.years=c('2008_2009', '2009_2010', '2010_2011', '2013_2014'),
                sgp.grade.sequences=list(c('6', '7', '8', '11'))),
	WRITING.2013_2014.config=list(
                sgp.content.areas=c('WRITING', 'WRITING'),
                sgp.panel.years=c('2010_2011', '2013_2014'),
                sgp.grade.sequences=list(c('4', '7'))),
	WRITING.MME.2013_2014.config=list(
                sgp.content.areas=c('WRITING', 'WRITING'),
                sgp.panel.years=c('2009_2010', '2013_2014'),
                sgp.grade.sequences=list(c('7', '11'))),
	SCIENCE.2013_2014.config=list(
                sgp.content.areas=c('SCIENCE', 'SCIENCE'),
                sgp.panel.years=c('2010_2011', '2013_2014'),
                sgp.grade.sequences=list(c('5', '8'))),
	SCIENCE.MME.2013_2014.config=list(
                sgp.content.areas=c('SCIENCE', 'SCIENCE'),
                sgp.panel.years=c('2010_2011', '2013_2014'),
                sgp.grade.sequences=list(c('8', '11'))),
	SOCIAL_STUDIES.2013_2014.config=list(
                sgp.content.areas=c('SOCIAL_STUDIES', 'SOCIAL_STUDIES'),
                sgp.panel.years=c('2010_2011', '2013_2014'),
                sgp.grade.sequences=list(c('6', '9'))),
	SOCIAL_STUDIES.MME.2013_2014.config=list(
                sgp.content.areas=c('SOCIAL_STUDIES', 'SOCIAL_STUDIES'),
                sgp.panel.years=c('2011_2012', '2013_2014'),
                sgp.grade.sequences=list(c('9', '11'))))

MICHIGAN.config <- c(MICHIGAN.2012_2013.config, MICHIGAN.2013_2014.config)


### Step 1: prepareSGP

Michigan_SGP <- prepareSGP(Michigan_Data_LONG)


### Step 2: analyzeSGP

Michigan_SGP <- analyzeSGP(
		sgp_object=Michigan_SGP,
		sgp.percentiles=TRUE,
		sgp.projections=FALSE,
		sgp.projections.lagged=FALSE,
		sgp.percentiles.baseline=FALSE,
		sgp.projections.baseline=FALSE,
		sgp.projections.lagged.baseline=FALSE,
		sgp.config=MICHIGAN.config,
		parallel.config=list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=20)))
