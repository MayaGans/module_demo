library(shinytest)
library(testthat)
library(rvest)

context("Testing Table Output")

app <- ShinyDriver$new(".")

test_that("Sepal Length filtered by filter_number", {
  
  # set filter_number within table module to 6
  # do we need to use testModule for this? 
  # https://shiny.rstudio.com/articles/integration-testing.html
  app$setInputs(filter_number = 6)

  # get the value of the filtered table and convert to dataframe
  # do we need to somehow access datafile here to generate the table
  # since that lives in a different module?
  output <- app$getValue(name = "filtered_table")
  
  my_df <- as.data.frame(read_html(output) %>% html_table(fill=TRUE))
  
  # create static test data output
  ir <- iris
  ir$Species <- as.character(iris$Species)
  test_data <- ir %>% filter(Sepal.Length > 6)
  
  # test that filtered data matches expected
  expect_identical(test_data, my_df)
})

app$stop()