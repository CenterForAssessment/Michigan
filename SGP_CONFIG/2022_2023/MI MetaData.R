#  Establish required meta-data for STRAIGHT projection sequences
SGPstateData[["MI"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
  READING=c(3, 4, 5, 6, 7, 8, 9, 10, 11),
  MATHEMATICS=c(3, 4, 5, 6, 7, 8, 9, 10, 11))

SGPstateData[["MI"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
  READING=rep("READING", 9),
  MATHEMATICS=rep("MATHEMATICS", 9))

SGPstateData[["MI"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <-
  list(
    ELA = rep(1L, 8),
    MATHEMATICS = rep(1L, 8)
  )

SGPstateData[["MI"]][["SGP_Configuration"]][["max.forward.projection.sequence"]] <- list(
  READING=7,
  MATHEMATICS=7)