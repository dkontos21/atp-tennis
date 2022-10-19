# Start of shiny app
library(shiny)

server <- function(input, output, session) {}  # the server 

ui <- fluidPage(                              # the user interface
  
  titlePanel("Multi-page app layout testing"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "s1",
                  label = "My Slider",
                  value = 1, min = 1, max = 20)
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Tab1", "First Tab"),
        tabPanel("Tab2", "Second Tab"),
        tabPanel("Tab3", "Third Tab")
      )
    )
  )
)
  
shinyApp(ui = ui, server = server) # app launch