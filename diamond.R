# Data visualization project
## This is a knitted file

---
title: "Homework"
author: "Thanida Asa"
date: "2023-07-28"
output:
  html_document: default
  pdf_document: default
---

# Greeting! 
## This is my very first data visualization presentation created on R studio cloud.
Thanks to R studio for the 'diamonds' dataset and khun Toy for instructing me.

Let's take a look at the overview of diamonds dataset!
```{r}
library(tidyverse)
library(ggplot2)
library(patchwork)
library(ggthemes)

alldt <- sample_frac(diamonds, 0.1)

dt1 <- ggplot(alldt,
       aes(price)) +
  geom_boxplot()

dt2 <- ggplot(alldt,
       aes(depth)) +
  geom_boxplot()

dt3 <- ggplot(alldt,
       aes(carat)) +
  geom_boxplot() 

dt1 / dt2 / dt3
```

From this boxplot chart, I narrow down using only 10% of the data set. 
  1. The price of most of the diamonds in this data set ranges around 1,000-5,000 USD. Though the median price is approximately 2,500 USD, the highest price can be as high as 20,000 USD.
  2. The depth of most diamonds does not range as high as their prices; the chart demonstrates from 61.0 to 62.5. However, the data can be as low as 43 and as high as 79.
  3. The carat chart is left-skewed, showing around 50% of the diamonds' carats ranges only from 0.40 to 1.04 but the maximum carat can be found not so fequently is 5.00
  
  
### Relationship between cut and price
```{r}
ggplot(diamonds,
       aes(x=cut, y=price)) +
  geom_boxplot()+
  geom_rug()+
  theme_minimal() 
```

Diamond cut is categorized into 5 categories: fair, good, very good premium and ideal. Seeing the dat together with price, the premium cut price range is the widest among all of the five categories.



### Relationship between carat and price
```{r}
ggplot(alldt,
       aes(carat, price)) +
  geom_point(alpha=0.2) +
  theme_minimal() 
```

This scatter plot shows the relationship between carat and price.
The more carat the diamonds have, the higher the price is. 
There is also rare case that diamonds that have 3.5 carats but the price is only around 12,500 USD.



### Relationship between clarity and price
```{r}
ggplot(alldt,
       aes(clarity, price)) +
  geom_point(alpha=0.2) +
  theme_minimal() 
```

The clarity of diamonds is divided into 8 types: I1, SI1, SI2, VS1, VVS1, VVS2 and IF.
The top 3 types of clarity that their prices are lowest are I1, VVS1 and IF consecutively while the top 3 types of clarity that price the highest are VS2, SI2 and SI1.



### Relationship between price and carat sectioned with clarity 
```{r}
ggplot(alldt,
       aes(carat, price, col=clarity)) +
  geom_point(alpha=0.2) +
  theme_minimal() +
  scale_color_brewer(type="seq",
                     palette = 1)
```


We can see that when looking at the price of diamonds, we cannot only determine by carat or clarity or cut alone, but we need to combine all of the elements of diamonds together to consider its price.
From the above scatter plot, the relationship between carat and clarity of diamonds highlights that the more carat diamonds have and the clearer the diamonds are (ranging consecutively from IF, VVS1, VVS2, VS1, VS2, SI1, SI2, I1), the higher price the dimonds are.


This is my very first time using R studio to create charts and interpreting data. If there is any mistakes, please accept mu apologies in the first hand.
Thank you for your time being here.


Have a magical day!
