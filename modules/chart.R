chart <- function(input, output, session, datafile = reactive(NULL)) {

  # SINCE DATAFILE IS A REACTIVE WE ADD THE PRERENTHESIS HERE
  # WHERE/HOW CAN I ACCESS input$xaxis?
  # Do I need to use ns? Can you do that in the server side of a module?
  output$XAXIS <- renderUI(selectInput("xaxis", "X Axis", choices = colnames(datafile())))
  output$YAXIS <- renderUI(selectInput("yaxis", "Y Axis", choices = colnames(datafile())))
  
  # NOT WORKING
  # Use the selectInput x and y to plot
  p <- reactive({
    req(datafile)
    # WORKS: ggplot(datafile(), aes(x = Sepal_Length, y = Sepal_Width))
    # DOES NOT WORK:
    ggplot(datafile(), aes_(x = as.name(input$xaxis), y = as.name(input$yaxis))) +
      geom_point()
  })

  return(p)
}