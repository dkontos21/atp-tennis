## User interactivity
library(shiny)
library(ggplot2)
library(DT)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    ggplot(diamonds, aes(price, carat)) + geom_point()
  })
  
  diam <- reactive({
    user_brush <- input$user_brush
    sel <- brushedPoints(diamonds, user_brush)
    return(sel)
  })
  
  output$table <- DT::renderDataTable(DT::datatable(diam()))
  
  output$mydownload <- downloadHandler(
    filename = "plotextract.csv",
    content = function(file) {
      write.csv(diam(), file)})
}

ui <- fluidPage(
  h1("Using the brush feature to select specific observations"),
  plotOutput("plot", brush = "user_brush"),
  dataTableOutput("table"),
  downloadButton(outputId = "mydownload", label = "Download Table")
)

shinyApp(ui = ui, server = server)