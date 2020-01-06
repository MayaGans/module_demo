
chart <- function(input, output, session, datafile) {
  
  output$XAXIS <- renderUI(selectInput("xaxis", "X Axis", choices = colnames(datafile)))
  output$YAXIS <- renderUI(selectInput("yaxis", "Y Axis", choices = colnames(datafile)))
  
  p <- reactive({
    ggplot(datafile, aes_(x = as.name(input$xaxis), y = as.name(input$yaxis))) +
      geom_point()
  })

  return(p)
}