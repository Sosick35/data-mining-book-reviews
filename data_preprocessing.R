# Load necessary libraries
libraries <- c("dplyr", "tibble", "readr", "tm", "textstem", "tidytext", "textdata")
for (lib in libraries) {
  library(lib, character.only = TRUE)
}

# Load the dataset
filepath <- 'data/MS4S09_CW_Book_Reviews.csv'
df <- as_tibble(read.csv(filepath, stringsAsFactors = FALSE))

# Preprocessing steps
df_cleaned <- df %>%
  select(Title, Review_title, Review_text, Genre) %>%
  na.omit()  # Remove rows with missing values

# Save the cleaned dataset for further analysis
write.csv(df_cleaned, "data/cleaned_book_reviews.csv", row.names = FALSE)

# Inspect the cleaned data
print(head(df_cleaned))
