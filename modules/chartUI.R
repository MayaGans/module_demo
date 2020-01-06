#####################
# Module UI function
######################

# need to pass dataframe as an input from the dataUpload module 
# use within the selectInputs
dataUploadUI <- function(id, label = "chart") {

  ns <- NS(id)
  
  tagList(
    sidebarPanel(
      # selectInput(ns("XAXIS"), "X Axis", choices = colnames(dataframe())),
      # selectInput(ns("YAXIS"), "Y Axis", choices = colnames(dataframe()))
    ),
    mainPanel("plot")
  )
}