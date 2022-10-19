# Start of shiny app
library(shiny)

server <- function(input, output, session) {  # the server
  observe({
    addtext <- paste("your initial input:", input$mystring)
    updateTextInput(session, "mystring2", value=addtext)
  })
} 

ui <- basicPage(                              # the user interface
  h1("Integrating input widgets with server test"),
  textInput("mystring", "write here"),
  textInput("mystring2", "Full App Output")
)
  
shinyApp(ui = ui, server = server) # app launch