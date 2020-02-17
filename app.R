library(shiny)
library(shinyjs)
library(tidyverse)

source("global.R")

ui <- 
  tagList(
    useShinyjs(),
    navbarPage(
      "THREE MODULES",
      tabPanel(
        title = "Data",
          dataUploadUI("datafile", "Import CSV")
      ),
      tabPanel(
        title = "Charts",
          chartUI("my_chart")
      ),
      tabPanel(
        title = "Table",
          tableUI("my_table")
      )
    )
  )

server <- function(input, output, session) {
  
  # call the module with the function dataupload and the label we want to give it
  datafile <- callModule(dataUpload, "datafile", stringsAsFactors = FALSE)
  # now we can render the dataframe as a table in the module we called
  output$table <- renderTable({ datafile() })
  
  # PASS datafile WITHOUT () INTO THE MODULE 
  my_chart <- callModule(chart, "my_chart", datafile = datafile)
  # now we can render the plot as the chart module we called in the line above
  output$plot <- renderPlot({ my_chart() })
  
  # pass the same datafile from above to create filtered table
  my_table <- callModule(table, "my_table", datafile = datafile)
  # render the table based on the module
  output$filtered_table <- renderTable({ my_table() })

}

shinyApp(ui, server)