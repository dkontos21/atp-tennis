# Basic Interactive Map Shiny
library(shiny)
library(shinyWidgets)
library(leaflet)
library(tidyverse)
library(shinythemes)

ui <- navbarPage(theme = shinytheme("sandstone"), title = h3("Tournaments of the ATP Tour"),
                 tabPanel("Interactive Map",
                          leafletOutput('myMap')),
                 tabPanel("Documentation"),
                 
                 tabPanel("Data Table with the underlying data")
)
  
server = function(input, output,session) {
  map = leaflet() %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 3)
  output$myMap = renderLeaflet(map)
}

shinyApp(ui = ui, server = server)