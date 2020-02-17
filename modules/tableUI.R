tableUI <- function(id, label = "Table") {

  ns <- NS(id)
  tagList(
    sidebarPanel(
      numericInput(ns("filter_number"), "Greater Than", min = 4.3, value = 6, max = 7.9)),
  
    mainPanel(tableOutput("filtered_table"))
  )
}