import pandas as pd

# Read tournaments data
tournaments = pd.read_csv("../csv/1_tournaments/tournaments.csv")

# Data comes in without header, set column names
print(tournaments.columns)
tournaments.set_axis(['tourney_year_id', 'tourney_order', 'tourney_type', 'tourney_name',
                      'tourney_id', 'tourney_slug', 'tourney_location', 'tourney_latitude',
                      'tourney_longitude', 'tourney_date', 'year', 'tourney_month',
                      'tourney_day', 'tourney_singles_draw', 'tourney_doubles_draw',
                      'tourney_conditions', 'tourney_surface', 'tourney_fin_commit_raw',
                      'currency', 'tourney_fin_commit', 'tourney_url_suffix',
                      'singles_winner_name', 'singles_winner_url', 'singles_winner_player_slug',
                      'singles_winner_player_id', 'doubles_winner_1_name', 'doubles_winner_1_url',
                      'doubles_winner_1_player_slug', 'doubles_winner_1_player_id',
                      'doubles_winner_2_name', 'doubles_winner_2_url', 'doubles_winner_2_player_slug',
                      'doubles_winner_2_player_id'], axis=1, inplace=True)
print(tournaments.columns)

# Show structure of dataframe
print(tournaments.head())
print(tournaments.shape)

# Interpret surfaces variable
surfaces = tournaments['tourney_surface']
print(surfaces.head())