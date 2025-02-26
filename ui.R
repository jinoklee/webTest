library(shiny)
library(DT)
library(shinythemes)
library(dplyr)
library(plotly)
library(RColorBrewer)
library(shinycssloaders)
library(readr)
library(htmlwidgets) 
library(shinyWidgets)
library(stringr)
library(shinyBS)
library(shinyjs)
library(png)
library(shinydashboard)#
library(dqshiny)
library(RColorBrewer)
library(heatmaply)
library(heatmaply)## #
######


ui <-shiny:: fluidRow(
  shinyjs::useShinyjs(),
  tags$head(tags$style("#shiny-disconnected-overlay {display: none !important;}")),
  includeCSS("www/css/common.css"),
  includeHTML("www/main.html")
  #,DT::dataTableOutput("anovadata")
  )
    

