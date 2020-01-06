library(shiny)
library(ggplot2)
source("global.R")
#####################
# Module UI function
######################
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
      "IDEA",
      tabPanel(
        title = "Data",
          dataUploadUI("datafile", "User data (.csv format)")
      ),
      tabPanel(
        title = "Charts",
          chartUI("my_chart")
      )
      # tabPanel(
      #   title = "Plots"
      # )
    )
  )

server <- function(input, output, session) {
  
  datafile <- callModule(dataUpload, "datafile", stringsAsFactors = FALSE)
  my_chart <- callModule(chart, "my_chart", datafile = datafile())

  output$table <- renderTable({ datafile() })
  output$plot <- renderPlot({ my_chart() })
  
  
}

shinyApp(ui, server)