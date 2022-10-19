# Start of shiny app
library(shiny)
server = function(input, output, session) {} # the server
ui = basicPage("start of app") # the user interface
shinyApp(ui = ui, server = server) # app launch