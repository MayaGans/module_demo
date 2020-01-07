chart <- function(input, output, session, datafile = reactive(NULL)) {
  
  # SINCE DATAFILE IS A REACTIVE WE ADD THE PRERENTHESIS HERE
  output$XAXIS <- renderUI(selectInput("xaxis", "X Axis", choices = colnames(datafile())))
  output$YAXIS <- renderUI(selectInput("yaxis", "Y Axis", choices = colnames(datafile())))
  
  # NOT WORKING
  # Use the selectInput x and y to plot
  p <- reactive({
    req(datafile)
    # WORKS: ggplot(datafile(), aes(x = Sepal_Length, y = Sepal_Width))
    # DOES NOT WORK:
    ggplot(datafile(), aes(x = input$XAXIS, y = input$YAXIS)) +
      geom_point()
  })

  return(p)
}