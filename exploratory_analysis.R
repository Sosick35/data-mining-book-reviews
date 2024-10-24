# Load necessary libraries
libraries <- c("ggplot2", "wordcloud", "tidytext", "dplyr")
for (lib in libraries) {
  library(lib, character.only = TRUE)
}

# Load the cleaned dataset
df_cleaned <- as_tibble(read.csv('data/cleaned_book_reviews.csv'))

# Tokenizing the reviews
word_tokenized_data <- df_cleaned %>%
  unnest_tokens(output = word, input = "Review_text", token = "words", to_lower = TRUE)

# Generate word frequency counts
word_counts <- word_tokenized_data %>%
  count(word, sort = TRUE)

# Plot top 10 words
ggplot(word_counts[1:10, ], aes(x = reorder(word, n), y = n)) +
  geom_col(fill = "blue") +
  labs(x = "Words", y = "Frequency") +
  coord_flip() +
  theme_minimal()

# Word cloud
set.seed(123)
wordcloud(words = word_counts$word, freq = word_counts$n, min.freq = 10, random.order=FALSE)

# Save the word cloud as an image
ggsave("images/wordcloud.png")
