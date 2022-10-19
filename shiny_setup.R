# Start of shiny app
library(shiny)

server <- function(input, output, session) {  # the server
  
  data <- reactive({
    rnorm(50) * input$myslider
  })
  
  output$plot <- renderPlot({
    plot(data(), col= "red", pch = 21, bty = "n")
  })
} 

ui <- basicPage(                              # the user interface
  h1("Integrating input widgets with server test, reactive & renderPlot"),
  sliderInput(inputId = "myslider",
              label = "Slider1",
              value = 1, min = 1, max = 20),
  plotOutput("plot")
)
  
shinyApp(ui = ui, server = server) # app launch