your_data <- data.frame(
  X1 = c(2, -5, 2),
  X2 = c(-1, 7, -4),
  X3 = c(8, -2, 6)
)

# Function to rank absolute values in each row
rank_absolute <- function(row) {
  rank(row, ties.method = "min")
}

# Apply the function to each row
ranked_data <- as.data.frame(t(apply(your_data, 1, rank_absolute)))

# Add column names
colnames(ranked_data) <- paste0("rank_", 1:ncol(ranked_data))

# Combine with the original data
result <- cbind(your_data, ranked_data)

# Display the result
print(result)