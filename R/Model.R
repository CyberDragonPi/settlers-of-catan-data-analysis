library(tidyverse)
library(ggplot2)

linMod <- lm(points ~ production + tradeGain + robberCardsGain + tradeLoss + robberCardsLoss + tribute, data = catan_data)