# Start of shiny app
library(shiny)

server <- function(input, output, session) {}  # the server 

ui <- fluidPage(                              # the user interface
  
  sidebarLayout(
    sidebarPanel("my sidebar"),
    mainPanel("my mainpanel")
  )
)
  
shinyApp(ui = ui, server = server) # app launch