library(tidyverse) 
library(ggplot2)
library(dplyr)
library(goftest)

#print(getwd())
source("../R/CatanDataLoading.R")
#all_variables <- ls()
#print(all_variables)

columns_to_extract <- c("X2", "X3", "X4","X5", "X6", "X7", "X8", "X9", "X10", "X11", "X12")
possible_sums <- c(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
dice_frequency <- game_winner_data[, columns_to_extract]
#nrow(dice_frequency) %>% print()
#ncol(dice_frequency) %>% print()
#dice_frequency %>% print()

frequency_df <- data.frame(number = possible_sums, number_frequency = colSums(dice_frequency, na.rm = TRUE))
#colnames(frequency_df) <- c("sum", "frequency")
#ncol(frequency_df) %>% print()
#head(frequency_df) %>% print()

frequency_df$cumulative_sum <- cumsum(frequency_df$number_frequency)

dice_frequency_plot <- ggplot(frequency_df, aes(x = number, y = number_frequency)) + geom_bar(fill = "red", stat = "identity") +
geom_text(aes(x = number, y = 0, label = number), stat = "identity", vjust = -1, size = 3)
ggsave("../figures/dice_frequency_bar.png", plot = dice_frequency_plot) 



rank_rows <- function(row) {
  max_rank <- length(row)
  max_rank - rank(row, ties.method = "min") + 1
}

dice_frequencies_rounds_ranked <- as.data.frame(t(apply(dice_frequency, 1, rank_rows)))
#dice_frequencies_rounds_ranked %>% print()
ranked_frequencies_df <- data.frame(number = possible_sums, average_rank = colMeans(dice_frequencies_rounds_ranked, na.rm = TRUE), expected = rep(FALSE, time = 11))
expected_rank_df <- data.frame(number = possible_sums, average_rank = c(10, 8, 6, 4, 2, 1, 2, 4, 6, 8, 10), expected = rep(TRUE, time = 11))
ranked_df <- rbind(ranked_frequencies_df, expected_rank_df)
#ranked_df %>% print()

ranked_df$number <- factor(ranked_df$number)

#colSums(ranked_frequencies_df) %>% print()
ranked_frequencies_plot <- ggplot(ranked_df, aes(x = factor(number), y = average_rank, fill = expected)) + 
  geom_col(position = "identity", alpha = 0.5) + 
  geom_text(aes(x = number, y = 0, label = number), stat = "identity", vjust = -1, size = 3) +
  scale_fill_manual(values = c("FALSE" = "red", "TRUE" = "yellow"), labels = c("real rank", "expected rank")) +
  labs(title = "Ranked Frequencies", x = "Number", y = "Average Rank")

ggsave("../figures/dice_frequency_ranked.png", plot = ranked_frequencies_plot)


