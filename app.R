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
  
  # call the module with the function dataupload and the label we want to give it
  datafile <- callModule(dataUpload, "datafile", stringsAsFactors = FALSE)
  # now we can render the table as the module we called
  output$table <- renderTable({ datafile() })
  
  # PASS datafile WITHOUT () INTO THE MODULE 
  my_chart <- callModule(chart, "my_chart", datafile = datafile)
  # now we can render the plot as the chart module we called in the line above
  output$plot <- renderPlot({ my_chart() })

}

shinyApp(ui, server)