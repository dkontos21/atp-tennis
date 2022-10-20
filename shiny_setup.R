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
        tabPanel("Tab1", "Weblinks with direct tag a()", a(href="https://github.com/serve-and-volley/atp-world-tour-tennis-data.git", "serve-and-volley's GitHub repo")),
        tabPanel("Tab2", "Second Tab"),
        tabPanel("Tab3", "Third Tab")
      )
    )
  )
)
  
shinyApp(ui = ui, server = server) # app launch