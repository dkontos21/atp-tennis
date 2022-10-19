# Start of shiny app
library(shiny)

server <- function(input, output, session) {} # the server

ui <- basicPage(
  h1("Testing widgets"),
  textInput("mystring", "write here"),
  checkboxInput("mycheckbox", "Test Factor")) # the user interface

shinyApp(ui = ui, server = server) # app launch