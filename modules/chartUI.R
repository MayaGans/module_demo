#####################
# Module UI function
######################

# need to pass dataframe as an input from the dataUpload module 
# use within the selectInputs
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
