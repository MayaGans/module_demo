table <- function(input, output, session, datafile = reactive(NULL)) {
  
  # using the datafile specified within app.R,
  # filter the dataframe's Sepal_Length based on the input from tableUI
  tb <- reactive({
    datafile() %>% filter(Sepal_Length > input$filter_number)
  })
  
  # The returned table is the input of renderTable() in app.R
  return(tb)
}