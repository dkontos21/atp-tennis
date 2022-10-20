## User interactivity - click
library(shiny)
library(ggplot2)
library(DT)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    ggplot(diamonds, aes(price, carat)) + geom_point()
  })
  
  diam <- reactive({
    user_click <- input$user_click
    sel <- nearPoints(diamonds, user_click, threshold = 10, maxpoints = 5)
    return(sel)
  })
  
  output$table <- DT::renderDataTable(DT::datatable(diam()))
}

ui <- fluidPage(
  h1("Using the click feature to select specific observations"),
  plotOutput("plot", click = "user_click"),
  dataTableOutput("table")
)

shinyApp(ui = ui, server = server)