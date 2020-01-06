library(shiny)

# Here's a simple text module that with one text input and that shows a local result
textModUI <- function(id, label = "Word") {
  ns <- NS(id)
  tagList(
    textInput(ns("word"), label),
    verbatimTextOutput(ns("result"))
  )
}

#' A module that takes two inputs: prefix and suffix and applies them to a word
#' Only the input$word in each module is returned and the value that you get
#' from a module is the same as a reactive expression, i.e.
textMod <- function(input, output, session, 
                    prefix = reactive(NULL), 
                    suffix = reactive(NULL)) {
  ns <- session
  # prefix() and suffix() are still reactives inside here
  output$result <- renderPrint({
    paste0(prefix(), input$word, suffix())
  })
  return(reactive(input$word))
}

ui <- fluidPage(
  div(
    class = "col-xs-3",
    textModUI('prefix', "Prefix")
  ),
  div(
    class = "col-xs-3",
    textModUI("word")
  ),
  div(
    class = "col-xs-3",
    textModUI('suffix', "Suffix")
  ),
  div(
    class = "col-xs-9",
    verbatimTextOutput("debug")
  )
)

server <- function(input, output, session) {
  prefix <- callModule(textMod, "prefix")
  suffix <- callModule(textMod, "suffix")
  # pass the reactives right into the module
  word <- callModule(textMod, "word", prefix = prefix, suffix = suffix)
  
  output$debug <- renderPrint({
    glue::glue(
      "As seen in the global Shiny reactive space...\n",
      "prefix() : {prefix()}\n",
      "word()   : {word()}\n",
      "suffix() : {suffix()}"
    )
  })
}

shinyApp(ui, server)