chart <- function(input, output, session, datafile) {
  
  # create selectInputs for x and y axis using the column names from the uploaded datafile
  # THIS WORKS BUT DOESN'T UPDATE WHEN A NEW FILE IS SELECTED
  output$XAXIS <- renderUI(selectInput("xaxis", "X Axis", choices = colnames(datafile)))
  output$YAXIS <- renderUI(selectInput("yaxis", "Y Axis", choices = colnames(datafile)))
  
  # NOT WORKING
  # Use the selectInput x and y to plot
  p <- reactive({
    ggplot(datafile, aes_(x = as.name(input$xaxis), y = as.name(input$yaxis))) +
      geom_point()
  })

  return(p)
}