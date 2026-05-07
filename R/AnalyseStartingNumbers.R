library(tidyverse)
library(ggplot2)
library(forcats)

starting_numbers <- non_game_winner_data[, seq(16, 26, by = 2)]
starting_numbers_winners <- game_winner_data[, seq(16, 26, by = 2)]

starting_numbers_vector <- do.call(c, starting_numbers)
starting_numbers_winners_vector <- do.call(c, starting_numbers_winners)

starting_numbers_table <- prop.table(table(starting_numbers_vector)) * 100
starting_numbers_winners_table <- prop.table(table(starting_numbers_winners_vector)) * 100

ggplot() +
  geom_col(aes(x = fct_reorder(names(starting_numbers_table),
                               as.numeric(names(starting_numbers_table))),
               y = starting_numbers_table,
               fill = "Non-winners"),
           alpha = 0.5, position = "dodge") +
  geom_col(aes(x = fct_reorder(names(starting_numbers_winners_table),
                               as.numeric(names(starting_numbers_winners_table))),
               y = starting_numbers_winners_table,
               fill = "Winners"),
           alpha = 0.5, position = "dodge") +
  scale_fill_manual(name = "Legend",
                    breaks = c("Non-winners", "Winners"),
                    values = c("Non-winners" = "#0827F5", "Winners" = "#AB2328")) +
labs(title = "Starting numbers occurances", x = "Numbers", y = "Percantage")