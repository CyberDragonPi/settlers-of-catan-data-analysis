library(tidyverse) 
library(ggplot2)
library(dplyr)
library(goftest)

source("R/CatanDataLoading.R")
#all_variables <- ls()
#print(all_variables)
print(catan_data)
print(getwd())

catan_data$player <- factor(catan_data$player)
catan_data$winner <- ifelse(catan_data$points >= 10, TRUE, FALSE)


order_points_plot <- ggplot(catan_data, aes(x = points, fill = player)) +
  geom_bar() +
  facet_wrap(~ player, scales = "free") +
  labs(title = "Plot of Points by Player Order", x = "Points", y = "Frequency", fill = "Order")
ggsave("figures/order_points_plot.png", plot = order_points_plot) 

wins_by_player <- catan_data %>% group_by(player) %>% summarize(number_of_wins = sum(winner))