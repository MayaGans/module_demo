library(shiny)
library(shinyjs)
library(tidyverse)

source("global.R")

ui <- 
  tagList(
    useShinyjs(),
    # tags$head(
    #   tags$link(
    #     rel = "stylesheet",
    #     type = "text/css",
    #     href = "index.css"
    #   ),
    #   tags$link(
    #     rel = "stylesheet",
    #     type = "text/css",
    #     href = "https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    #   )
    # ),
    navbarPage(
      "TWO MODULES",
      tabPanel(
        title = "Data",
          dataUploadUI("datafile", "Import CSV")
      ),
      tabPanel(
        title = "Charts",
          chartUI("my_chart")
      )
    )
  )

server <- function(input, output, session) {
  
  datafile <- callModule(dataUpload, "datafile", stringsAsFactors = FALSE)
  output$table <- renderTable({ datafile() })
  
  # PASS datafile WITHOUT () INTO THE MODULE 
  my_chart <- callModule(chart, "my_chart", datafile = datafile)
  output$plot <- renderPlot({ my_chart() })

}

shinyApp(ui, server)