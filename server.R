library(shiny)
library(DT)
# library(Gviz)
# library(GenomicRanges)
library(shinythemes)
library(dplyr)
library(RColorBrewer)
library(shinycssloaders)
library(readr)
library(htmlwidgets) 
library(shinyWidgets)
library(stringr)
library(shinyBS)
library(shinyjs)
library(png)
library(shinydashboard)
library(dqshiny)
library(plotly)
library(Hmisc)
library(scales)
library(heatmaply)

ccle.sig.df <- read.delim("www/data.tbl")

server <- function(input, output, session){
  #### Home========================================
  
  # function
  # shinyInput = function(FUN, len, id, ...){
  #   inputs = as.character(len)
  #   for (i in seq_len(len))
  #   {inputs[i] = as.character(FUN(paste0(id, i), label=NULL,...))
  #   }
  #   inputs
  # }
  
  #includeHTML("/data5/jinoklee/BreastASMiner/app/www/main.html")
  output$mainpage <- renderUI({
    includeHTML("./www/main.html")
  })
  
  


  #### ccle ===============================================
  # ccledf <- reactive({
  #   df <- ccle.sig.df
  #   df <- arrange(df, df$`Anova.p (molecular subtype)`)
  #   #"All", ">= 20", "< 20"
  #   
  #   if( input$mrnano == ">= 20"){
  #     df <- filter(df , Num.mRNA >= 20 )
  #   }
  #   
  #   if( input$mrnano == "< 20"){
  #     df <- filter(df , Num.mRNA <20 )
  #   }
  #   
  #   if( input$prono == ">= 20"){
  #     df <- filter(df , Num.protein >= 20 )
  #   }
  #   
  #   if( input$prono== "< 20"){
  #     df <- filter(df , Num.protein <20 )
  #   }
  #   
  #   if( input$drugno == ">= 20"){
  #     df <- filter(df , N.drug >= 20 )
  #   }
  #   
  #   if( input$drugno == "< 20"){
  #     df <- filter(df , N.drug <20 )
  #   }
  #   
  #   
  #   if( input$mrna == "Yes in correlation, |r| >= 0.5"){
  #     df <- filter(df , abs(Cor.mRNA) >=  0.5 )
  #   }
  #   
  #   
  #   if( input$pro == "Yes in correlation, |r| >= 0.5"){
  #     df <- filter(df , abs(Cor.protein) >=  0.5 )
  #   }
  #   
  #   if( input$drug == "Yes in correlation, |r| >= 0.5"){
  #     df <- filter(df , abs(Cor.drug) >=  0.5 )
  #   }
  #   
  #   
  #   if(nrow(df) > 0){
  #     df$`Anova.p (molecular subtype)` <- formatC(df$`Anova.p (molecular subtype)`, format= "e", digit= 1)
  #     df$`Anova.p (lineage subtype)` <- formatC(df$`Anova.p (lineage subtype)`,format= "e", digit= 1)
  #     df$Cor.mRNA <- formatC(df$Cor.mRNA,  digit= 1)
  #     df$Cor.protein <- formatC(df$Cor.protein, digit= 1)
  #     df$Cor.drug <- formatC(df$Cor.drug, digit= 1)
  #   }
  #   df
  #  })
  
  
  output$anovadata  <- DT::renderDataTable({
    DT::datatable({
      ccle.sig.df
      #ccledf()[,-c(2:6)]
          },
      extensions=c('Scroller')
    ,selection = 'single'
    ,container = container_dt
    ,rownames = FALSE
    ,escape = FALSE
    ,options = list(
                    columnDefs = list(list(className = 'dt-center', targets = '_all')),#, list(type = "num-fmt", targets = 0)
                    scroller = TRUE,
                    scrollX = FALSE,
                    scrollY = 300,
                    autoWidth = TRUE,
                    preDrawCallback = JS("function() {
                             Shiny.unbindAll(this.api().table().node()); }"),
                    drawCallback = JS("function() {
                          Shiny.bindAll(this.api().table().node()); } ")))%>%
      formatStyle(c(1,4,6,8,10), `border-right` = "solid 1px")%>%
      formatStyle(c(1), `border-left` = "solid 1px")
  },server = FALSE)



  
}
