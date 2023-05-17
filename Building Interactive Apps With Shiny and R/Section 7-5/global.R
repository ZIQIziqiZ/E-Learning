library(shiny)
library(shinydashboard)
library(DT)
library(data.table)
library(ggplot2)

library(readr)
allBaseballData <- read_csv("allBaseballData.csv")

playerChoices <- unique(allBaseballData$name)
teamChoices <- unique(allBaseballData$franchName)
yearChoices <- unique(allBaseballData$yearID)
metricChoices <- colnames(allBaseballData)[5:14]
