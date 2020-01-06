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
      "2 Modules",
      tabPanel(
        title = "Data",
        sidebarPanel(
          # put our taglist element here which takes on ID and label parameters
          dataUploadUI("datafile", "User data (.csv format)")
        ),
        mainPanel(
          tableOutput("table")
        )
      ),
      tabPanel(
        title = "Charts",
       # sidebarPanel(
          #ChartUI("my_chart")
       # ),
        mainPanel(
          plotOutput("plot")
      )) #,
      # tabPanel(
      #   title = "Plots"
      # )
    )
  )

server <- function(input, output, session) {
  
  datafile <- callModule(dataUpload, "datafile",
                         stringsAsFactors = FALSE)
  
  chart <- callModule(chart, "my_chart")

  output$table <- renderTable({
    datafile()
  })
  
  output$plot <- renderPlot({
    p()
  })
  
  
}

shinyApp(ui, server)