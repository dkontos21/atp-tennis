# Basic Interactive Map Shiny
library(shiny)
library(shinyWidgets)
library(leaflet)
library(tidyverse)

ui <- fluidPage(leafletOutput('myMap'))
server = function(input, output,session) {
  map = leaflet() %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 3)
  output$myMap = renderLeaflet(map)
}

shinyApp(ui = ui, server = server)