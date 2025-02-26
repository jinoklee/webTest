library(shiny)
library(DT)
library(shinythemes)
library(dplyr)
library(plotly)
library(RColorBrewer)
library(shinycssloaders)
library(readr)
library(shinyWidgets)
library(stringr)
library(shinyBS)
library(shinyjs)
library(png)
library(shinydashboard)
library(dqshiny)
library(Hmisc)
library(dendextend)
#install.packages("plotrix") 

#
source("ui.R")
source("server.R")


  
shinyApp(ui = ui, server = server)
##
