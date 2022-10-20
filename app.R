### Map dashboard

library(shiny)
library(shinythemes)

# Import tournament data
tournaments <- read.csv(file = "csv/1_tournaments/tournaments_2020-2022.csv", header = FALSE)
colnames(tournaments) <- c("tourney_year_id", "tourney_order", "tourney_type", 
                                     "tourney_name", "tourney_id", "tourney_slug", "tourney_location",
                                     "tourney_date", "year", "tourney_month", "tourney_day",
                                     "tourney_singles_draw", "tourney_doubles_draw", "tourney_conditions",
                                     "tourney_surface", "tourney_fin_commit_raw", "currency",
                                     "tourney_fin_commit", "tourney_url_suffix", "singles_winner_name",
                                     "singles_winner_url", "singles_winner_player_slug", "singles_winner_player_id",
                                     "doubles_winner_1_name", "doubles_winner_1_url", "doubles_winner_1_player_slug",
                                     "doubles_winner_1_player_id", "doubles_winner_2_name", "doubles_winner_2_url", 
                                     "doubles_winner_2_player_slug", "doubles_winner_1_player_id")

attach(tournaments)

server <- function(input, output,session){}

ui <- navbarPage(theme = shinytheme("sandstone"), title = h2("Tournaments of the ATP Tour"),
                 tabPanel(
                   ("Click on a Tournament"),
                   wellPanel(
                     sliderInput(inputId = "w1",
                                 label = "Weight on Grade 1",
                                 value = 7, min = 0, max = 20),
                     sliderInput(inputId = "w2",
                                 label = "Weight on Grade 2",
                                 value = 2, min = 0, max = 20),
                     sliderInput(inputId = "w3",
                                 label = "Weight on Grade 3",
                                 value = 0.6, min = 0, max = 6, step = 0.2)                     
                   ),
                   downloadButton(outputId = "mydownload", label = "Download Table")
                 ),
                 
                 tabPanel("Documentation"),
                 
                 tabPanel("Data Table with the underlying data")
)

shinyApp(ui = ui, server = server)