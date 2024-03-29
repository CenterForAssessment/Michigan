#####
###   READING 2021 configurations (accounting for skipped year in 2020)
#####

READING_2020_2021.config <- list(
     READING.2020_2021 = list(
                 sgp.content.areas = c('READING', 'READING', 'READING'),
                 sgp.panel.years = c('2017_2018', '2018_2019', '2020_2021'),
                 sgp.grade.sequences = list(c('3', '5'), c('3', '4', '6'), c('4', '5', '7'), c('5', '6', '8'), c('6', '7', '9'), c('7', '8', '10'))),
    #This is used operationally for grade 11
    READING_SAT.2020_2021=list(
         			sgp.content.areas=c('READING', 'READING', 'READING'),
         			sgp.panel.years=c('2017_2018', '2018_2019', '2020_2021'),
         			sgp.grade.sequences=list(c('8', '9', '11')),
         			sgp.norm.group.preference=2),
    READING_SAT.2020_2021=list(
         			sgp.content.areas=c('READING', 'READING', 'READING'),
         			sgp.panel.years=c('2016_2017', '2017_2018', '2020_2021'),
         			sgp.grade.sequences=list(c('7', '8', '11')),
         			sgp.norm.group.preference=1)
)
