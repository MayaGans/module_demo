chartUI <- function(id, label = "Create Chart") {

  ns <- NS(id)
  tagList(
    sidebarPanel(
      uiOutput(ns("XAXIS")),
      uiOutput(ns("YAXIS"))
    ),
    mainPanel(plotOutput("plot"))
  )
}
