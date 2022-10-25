### Map dashboard

library(shiny)
library(shinythemes)
library(shinyWidgets)
library(DT)
library(leaflet)
library(tidyverse)

# Import tournament data
tournaments <- read.csv(file = "csv/1_tournaments/tournaments.csv", header = FALSE)
colnames(tournaments) <- c("tourney_year_id", "tourney_order", "tourney_type", 
                                     "tourney_name", "tourney_id", "tourney_slug", "tourney_location",
                                     "tourney_latitude", "tourney_longitude",
                                     "tourney_date", "year", "tourney_month", "tourney_day",
                                     "tourney_singles_draw", "tourney_doubles_draw", "tourney_conditions",
                                     "tourney_surface", "tourney_fin_commit_raw", "currency",
                                     "tourney_fin_commit", "tourney_url_suffix", "singles_winner_name",
                                     "singles_winner_url", "singles_winner_player_slug", "singles_winner_player_id",
                                     "doubles_winner_1_name", "doubles_winner_1_url", "doubles_winner_1_player_slug",
                                     "doubles_winner_1_player_id", "doubles_winner_2_name", "doubles_winner_2_url", 
                                     "doubles_winner_2_player_slug", "doubles_winner_1_player_id")

attach(tournaments)

ui <- navbarPage(theme = shinytheme("sandstone"), title = h3("Tournaments of the ATP Tour"),
                 tabPanel("Interactive Map",
                          leafletOutput('myMap')),
                 
                 tabPanel("Data Table with the underlying data",
                          DT::dataTableOutput("tableDT"))
)

server = function(input, output,session) {
  map = leaflet() %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 3)

#  output$myMap = renderLeaflet(map)
  output$myMap = renderLeaflet({
    leaflet(tournaments) %>%
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addCircleMarkers(~tourney_longitude, ~tourney_latitude,
                       label = ~tourney_name,
                       radius = 5, weight = 2,
                       color = "#dfff4f",
                       labelOptions = labelOptions(textsize = "12px"),
                       popup = ~tourney_type)
  })  
  
  # add hover markers
  observe({
    leafletProxy("myMap", data = tournaments) %>%
      clearShapes() %>%
      addCircleMarkers(~tourney_longitude, ~tourney_latitude,
                       label = ~tourney_name,
                       radius = 1, weight = 1,
                       labelOptions = labelOptions(textsize = "12px"),
                       popup = ~tourney_type)
  })
  
  # table for the Data table tab
  output$tableDT <- DT::renderDataTable(DT::datatable(tournaments))
}

shinyApp(ui = ui, server = server)