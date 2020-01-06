#####################
# Module UI function
######################

# The first argument is the id -- the namespace for the module
dataUploadUI <- function(id, label = "chart") {

  ns <- NS(id)
  
  # Rather than fluidPage use a taglist
  # If you're just returning a div you can skip the taglist
  
  tagList(
    # How do we get these choices to be colnames(dataframe)
    # Where dataframe was the returned value from the dataUpload function
    
    # selectInput(ns("x-axis", "X Axis" choices = colnames(dataframe))),
    # selectInput(ns("y-axis", "Y Axis", choices = colnames(dataframe)))
  )
}