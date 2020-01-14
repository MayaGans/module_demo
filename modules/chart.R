chart <- function(input, output, session, datafile = reactive(NULL)) {
  
  # In module UI, we usually use NS function to add the namespace in front of the output id. 
  # But in module server, the main server use callModule to the call the module server 
  # and the function will automatically add the namespace to all input and output id. 
  # But for renderUI in chart, the selectInput behave like the module UI, 
  # you need to add the namespace by yourself, so use session$ns to add the namespace 
  # to the newly added input id in order to match with the input xaxis and yaxis.
  output$XAXIS <- renderUI(selectInput(session$ns("xaxis"), "X Axis", choices = colnames(datafile())))
  output$YAXIS <- renderUI(selectInput(session$ns("yaxis"), "Y Axis", choices = colnames(datafile())))
  
  p <- reactive({
    req(datafile)
    ggplot(datafile(), aes_(x = as.name(input$xaxis), y = as.name(input$yaxis))) +
      geom_point()
  })
  
  return(p)
}