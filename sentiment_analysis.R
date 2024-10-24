# Load necessary libraries
libraries <- c("dplyr", "tidytext", "ggplot2", "syuzhet")
for (lib in libraries) {
  library(lib, character.only = TRUE)
}

# Load the cleaned dataset
df_cleaned <- as_tibble(read.csv('data/cleaned_book_reviews.csv'))

# Tokenize the review text
word_tokenized_data <- df_cleaned %>%
  unnest_tokens(output = word, input = "Review_text", token = "words", to_lower = TRUE)

# Sentiment analysis using Bing lexicon
bing_sentiments <- get_sentiments("bing")

sentiment_data <- word_tokenized_data %>%
  inner_join(bing_sentiments, by = "word")

# Calculate sentiment score (positive - negative sentiment words)
sentiment_score <- sentiment_data %>%
  group_by(Title) %>%
  summarize(bing_sentiment = sum(sentiment == "positive") - sum(sentiment == "negative"))

# Plot sentiment scores
ggplot(sentiment_score, aes(x = reorder(Title, bing_sentiment), y = bing_sentiment, fill = Title)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Sentiment Score by Book Title", x = "Title", y = "Sentiment Score") +
  theme_minimal()

# Save the plot
ggsave("images/sentiment_scores.png")
