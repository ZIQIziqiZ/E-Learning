library(shiny)
library(DT)
library(data.table)
library(ggplot2)

data("mtcars")

cylinderChoices <- unique(mtcars$cyl)