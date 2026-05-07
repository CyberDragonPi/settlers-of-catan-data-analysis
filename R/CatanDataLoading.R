library(tidyverse) 
library(ggplot2)
library(dplyr)
library(goftest)

#print("loading data...")
catan_data <- read.csv('../data/SettlersOfCatanStats.csv')
#head(catanData) %>% print()


game_winner_data <- catan_data[catan_data$points >= 10, ]
#head(game_winner_data) %>% print()
#nrow(game_winner_data) %>% print()

non_game_winner_data <- catan_data[catan_data$points < 10, ]
#head(non_game_winner_data) %>% print()
#nrow(non_game_winner_data) %>% print()

match_data <- catan_data[seq(1, nrow(catan_data), by = 4),]
#head(match_data) %>% print()
#nrow(match_data) %>% print()
