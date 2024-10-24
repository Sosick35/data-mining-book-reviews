# Load necessary libraries
libraries <- c("tm", "topicmodels", "tidytext", "dplyr", "ggplot2")
for (lib in libraries) {
  library(lib, character.only = TRUE)
}

# Load the cleaned dataset
df_cleaned <- as_tibble(read.csv('data/cleaned_book_reviews.csv'))

# Convert text to corpus
corpus <- VCorpus(VectorSource(df_cleaned$Review_text))

# Preprocess corpus: lowercasing, remove stopwords, stemming
corpus_clean <- tm_map(corpus, content_transformer(tolower)) %>%
  tm_map(removeWords, stopwords("en")) %>%
  tm_map(stemDocument)

# Create document-term matrix
dtm <- DocumentTermMatrix(corpus_clean)

# Apply LDA model
lda_model <- LDA(dtm, k = 3, control = list(seed = 123))
lda_topics <- tidy(lda_model, matrix = "beta")

# Top terms for each topic
top_terms <- lda_topics %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)

# Plot top terms
ggplot(top_terms, aes(x = reorder(term, beta), y = beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip() +
  labs(title = "Top Terms for Each Topic", x = "Term", y = "Beta") +
  theme_minimal()

# Save the plot
ggsave("images/lda_topics.png")
