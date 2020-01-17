library(shiny)
library(shinyjs)

# I have two blocks BLUE and TO_BLUE
blocks <- c("BLUE", "TO_BLUE")

BLOCK <- function(data, name)
{
  # create a white div with rounded edges
  # the title of the div will have a blue background
  div(style = "
      text-align: center;
      font-size: 12px;
      background-color: white;
      border-radius: 10px;
      color: black;
      margin-bottom: 15px;
      min-height: 55px;
      ",
      id = name,
      
      if (name == "BLUE") {
        # this div gives the "BLUE" block it's blue background
        div(style = "background-color: #0c283b;
            color: white;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            min-width: 70px;",
            name)
      } else {
        # but how do I get the TITLE within the selectInput to be blue like the block above?
        selectInput(name, "TO_BLUE", choices = c("1", "2", "3", selectize = FALSE))
      }
    
  )
}

ui <- fluidPage(
   
  inlineCSS(".control-label { 
            background-color: #0c283b; 
            width: 100%; 
            color: white;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            }"),

   sidebarLayout(
      sidebarPanel(
        lapply(blocks, BLOCK, data = blocks)
      ),
      
      mainPanel()
   )
)

server <- function(input, output) {
}

shinyApp(ui = ui, server = server)

