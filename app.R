### Map dashboard

library(shiny)
library(shinythemes)
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

server <- function(input, output,session){
  
  # interactive map
  output$map <- renderLeaflet({
    leaflet(tournaments) %>%
      addCircleMarkers(~tourney_latitude, ~tourney_longitude,
                 label = ~tourney_name,
                 labelOptions = labelOptions(textsize = "12px"),
                 popup = "Test")
  })
  
  observe({
    leafletProxy("map", data = tournaments) %>%
      clearShapes() %>%
      addCircleMarkers(~tourney_latitude, ~tourney_longitude,
                       label = ~tourney_name,
                       labelOptions = labelOptions(textsize = "12px"),
                       popup = "Test")
  })
  
  # table for the Data table tab
  output$tableDT <- DT::renderDataTable(DT::datatable(tournaments))
}


# Interface

# Choices for drop-downs
vars <- c()

ui <- navbarPage(theme = shinytheme("sandstone"), title = h3("Tournaments of the ATP Tour"),
                 tabPanel("Interactive map",
                   
                   tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
                   
                   leafletOutput("map", width = "100%", height = "100%"),
                   
                   downloadButton(outputId = "mydownload", label = "Download Table")
                 ),
                 
                 tabPanel("Documentation"),
                 
                 tabPanel("Data Table with the underlying data",
                          DT::dataTableOutput("tableDT"))
)

shinyApp(ui = ui, server = server)