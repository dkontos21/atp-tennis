# Import data
tournaments_2020_2022 <- read.csv(file = "csv/1_tournaments/tournaments.csv", header = FALSE)
colnames(tournaments_2020_2022) <- c("tourney_year_id", "tourney_order", "tourney_type", 
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

match_scores_2020_2022 <- read.csv(file = "csv/2_match_scores/match_scores_2020-2022.csv", header = FALSE)
colnames(match_scores_2020_2022) <- c("tourney_year_id", "tourney_order", "tourney_name",
                                      "tourney_slug", "tourney_url_suffix", "start_date",
                                      "start_year", "start_month", "start_day",
                                      "end_date", "end_year", "end_month", "end_day",
                                      "currency", "prize_money", "match_index",
                                      "tourney_round_name", "round_order", "match_order",
                                      "winner_name", "winner_player_id", "winner_slug",
                                      "loser_name", "loser_player_id", "loser_slug",
                                      "winner_seed", "loser_seed", "match_score_tiebreaks",
                                      "winner_sets_won", "loser_sets_won", "winner_games_won",
                                      "loser_games_won", "winner_tiebreaks_won", "loser_tiebreaks_won",
                                      "match_id", "match_stats_url_suffix")

match_stats_2020 <- read.csv(file = "csv/3_match_stats/match_stats_2020.csv", header = FALSE)
match_stats_2021 <- read.csv(file = "csv/3_match_stats/match_stats_2021.csv", header = FALSE)
match_stats_2022 <- read.csv(file = "csv/3_match_stats/match_stats_2022.csv", header = FALSE)
match_stats_2020_2022 <- do.call("rbind", list(match_stats_2020, match_stats_2021, match_stats_2022))
colnames(match_stats_2020_2022) <- c("match_id", "tourney_slug", "match_stats_url_suffix",
                                      "match_time", "match_duration", "winner_slug",
                                      "winner_serve_rating", "winner_aces",
                                      "winner_double_faults", "winner_first_serves_in",
                                      "winner_first_serves_total",
                                      "winner_first_serve_points_won",
                                      "winner_first_serve_points_total",
                                      "winner_second_serve_points_won",
                                      "winner_second_serve_points_total",
                                      "winner_break_points_saved",
                                      "winner_break_points_serve_total",
                                      "winner_service_games_played",
                                      "winner_return_rating", "winner_first_serve_return_won",
                                      "winner_first_serve_return_total",
                                      "winner_second_serve_return_won",
                                      "winner_second_serve_return_total",
                                      "winner_break_points_converted",
                                      "winner_break_points_return_total",
                                      "winner_return_games_played",
                                      "winner_service_points_won",
                                      "winner_service_points_total",
                                      "winner_return_points_won",
                                      "winner_return_points_total",
                                      "winner_total_points_won",
                                      "winner_total_points_total",
                                      "loser_slug", "loser_serve_rating",
                                      "loser_aces", "loser_double_faults",
                                      "loser_first_serves_in",
                                      "loser_first_serves_total",
                                      "loser_first_serve_points_won",
                                      "loser_first_serve_points_total",
                                      "loser_second_serve_points_won",
                                      "loser_second_serve_points_total",
                                      "loser_break_points_saved",
                                      "loser_break_points_serve_total",
                                      "loser_service_games_played",
                                      "loser_return_rating",
                                      "loser_first_serve_return_won",
                                      "loser_first_serve_return_total",
                                      "loser_second_serve_return_won",
                                      "loser_second_serve_return_total",
                                      "loser_break_points_converted",
                                      "loser_break_points_return_total",
                                      "loser_return_games_played",
                                      "loser_service_points_won",
                                      "loser_service_points_total",
                                      "loser_return_points_won",
                                      "loser_return_points_total",
                                      "loser_total_points_won",
                                      "loser_total_points_total")

