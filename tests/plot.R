# Need to download Shiny from GitHub
testModule(chart, {
  # Confirm that the data reactive is behaving as expected
  expect_equal(nrow(p()), 150)
  expect_equal(ncol(p()), 5)
  # How can we set this to colnames(datafile)
  # expect_equal(colnames(p()), c("length", "width"))
  
  # And now the plot function is so simple that there's not much need for
  # automated testing. If we did wish to evaluate the plot visually, we could
  # do so using the shinytest package.
  output$plot # Just confirming that the plot can be accessed without an error
})
