#####################
# Module UI function
######################

# The first argument is the id -- the namespace for the module
dataUploadUI <- function(id, label = "CSV file") {
  # Create a namespace function using the provided id
  #ALL UI FUNCTION BODIES MUST BEGIN WITH THIS
  ns <- NS(id)
  
  # Rather than fluidPage use a taglist
  # If you're just returning a div you can skip the taglist
  tagList(
  sidebarPanel(
    fileInput(ns("file"), label),
    checkboxInput(ns("heading"), "Has heading"),
    selectInput(ns("quote"), "Quote", c(
      "None" = "",
      "Double quote" = "\"",
      "Single quote" = "'"))),
  mainPanel(tableOutput("table"))
  )
}