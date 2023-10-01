# Machine learning project
## Training model for house price prediction in India

# 0. load library
library(tidyverse)
library(ggplot2)
library(lattice)
library(caret)
library(knitr)
library(readxl)

# 1. prepare data
## 1.1 load data
df1 <- read_excel("House Price India.xlsx", sheet = 1)
df2 <- read_excel("House Price India.xlsx", sheet = 2)

## 1.2 combine data (from different sheets)
all_df <- bind_rows(df1, df2)

## 1.3 check data 
View(all_df)
ggplot(data = all_df,
       mapping = aes(x=Price)) +
  geom_histogram()

## 1.4 adjust distribution
all_df$Price <- log(all_df$Price)

## 1.5 select columns
prep_df <- all_df %>%
  select(`living area`, `lot area`, `number of floors`, `grade of the house`, `Area of the house(excluding basement)`, `Area of the basement`, Price)
View(prep_df)

## 1.6 clean data 
prep_df %>% 
  complete.cases() %>%
  mean()

## 1.7 recheck distribution
ggplot(data = prep_df,
       mapping = aes(x=Price)) +
  geom_histogram()


# 2. split data
set.seed(51)
n <- nrow(prep_df)
train_id <- sample(n, size = n*0.8)
train_df <- prep_df[train_id, ]
test_df <- prep_df[-train_id, ]

split_data <- function(prep_df) {
  set.seed(51)
  n <- nrow(prep_df)
  train_id <- sample(n, size = n*0.8)
  train_df <- prep_df[train_id, ]
  test_df <- prep_df[-train_id, ]
  return( list (training = train_df,
                testing = test_df))
}

# 3. train data
train(Price ~ . ,
      data = train_df,
      method = "lm")

train_model <- train(Price ~ . ,
                     data = train_df,
                     method = "lm")

# 4. score data
predict(train_model, newdata = test_df)

prediction <- predict(train_model, newdata = test_df)

# 5. evaluate (rmse, mae)
rmse <- sqrt(mean((prediction - test_df$Price)**2))
MAE <- mean(abs(prediction - test_df$Price))

(rmse <- sqrt(mean((prediction - test_df$Price)**2)))
(MAE <- mean(abs(prediction - test_df$Price)))

## compare to train_model
train_model

## train model RMSE = 0.3449, MAE = 0.2759
## prediction RMSE = 0.3439, MAE = 0.2745
