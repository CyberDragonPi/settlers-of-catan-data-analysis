library(tidyverse)
library(ggplot2)

starting_resources <- non_game_winner_data[, seq(17, 27, by = 2)]
starting_resources_winners <- game_winner_data[, seq(17, 27, by = 2)]

starting_resources_vector <- do.call(c, starting_resources)
starting_resources_winners_vector <- do.call(c, starting_resources_winners)

starting_resources_table <- prop.table(table(starting_resources_vector)) * 100
starting_resources_winners_table <- prop.table(table(starting_resources_winners_vector)) * 100

ggplot() +
  geom_col(aes(x = names(starting_resources_table),
               y = starting_resources_table,
               fill = "Non-winners"),
           alpha = 0.5, position = "dodge") +
  geom_col(aes(x = names(starting_resources_winners_table),
               y = starting_resources_winners_table,
               fill = "Winners"),
           alpha = 0.5, position = "dodge") +
  scale_fill_manual(name = "Legend",
                    breaks = c("Non-winners", "Winners"),
                    values = c("Non-winners" = "#0827F5", "Winners" = "#AB2328")) +
  labs(title = "Starting resources occurances", x = "Resource", y = "Percantage")