chart <- function(input, output, session, datafile = reactive(NULL)) {
  
  # SINCE DATAFILE IS A REACTIVE WE ADD THE PRERENTHESIS HERE
  # WHERE/HOW CAN I ACCESS input$xaxis?
  output$XAXIS <- renderUI(selectInput("xaxis", "X Axis", choices = colnames(datafile())))
  output$YAXIS <- renderUI(selectInput("yaxis", "Y Axis", choices = colnames(datafile())))

  observe({
    msg <- sprintf(input$XAXIS)
  })
  
  # NOT WORKING
  # Use the selectInput x and y to plot
  p <- reactive({
    req(datafile)
    # WORKS: ggplot(datafile(), aes(x = Sepal_Length, y = Sepal_Width))
    # DOES NOT WORK:
    ggplot(datafile(), aes(x = input$xaxis, y = input$yaxis)) +
      geom_point()
  })

  return(p)
}