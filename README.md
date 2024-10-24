# Data Mining Understanding on Book Trends

## Author
Ebuka Mbonu Kingsley  
Date: 2024-02-16

---

## Abstract
This project applies sentiment analysis and topic modeling techniques to understand book review trends. The **Bing** and **AFINN lexicons** are used for sentiment analysis, while **Latent Dirichlet Allocation (LDA)** is used for topic modeling.

## Dataset
The dataset contains 11 features such as:
- Title
- Book Price
- Reviewer ID
- Rating
- Review Text
- Genre  
...and more.

The data is analyzed to extract key insights into customer sentiment and topic trends related to various books.

## Purpose
The purpose of this analysis is to explore customer opinions and identify the common trends and patterns in book reviews.

## Key Techniques:
- **Data Preprocessing**: Cleaning the dataset and preparing it for analysis.
- **Sentiment Analysis**: Using the Bing and AFINN lexicons to identify positive and negative sentiments in book reviews.
- **Topic Modeling**: Using LDA to group review content into topics based on recurring themes.
- **Exploratory Data Analysis (EDA)**: Visualizing the most common words and patterns in the data.

## Scripts
The following scripts are included in the repository:
- `data_preprocessing.R`: Code for cleaning and processing the dataset.
- `sentiment_analysis.R`: Code for performing sentiment analysis using the Bing and AFINN lexicons.
- `topic_modeling.R`: Code for topic modeling using LDA.
- `exploratory_analysis.R`: Code for generating word clouds, top terms, and EDA visualizations.

## How to Run the Project
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/Sosick35/Data-Mining-Book-Trends.git

