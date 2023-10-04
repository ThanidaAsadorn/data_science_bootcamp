# Data transformation project 2
## Create database on Postgresql using R programming

library(RPostgreSQL)
library(tidyverse)

pizzeria <- dbConnect(PostgreSQL(),
                 host = 	"john.db.elephantsql.com",
                 port = 5432,
                 user = "uaemjacq",
                 password = "f4HldS8cEdJLUYR4OzM3J3Vjh6cFU_x9",
                 dbname = "uaemjacq")

pizzamenu <- data.frame(
  menu_id = 1:8,
  menu_name = c("hawaiian", 
           "pepperoni", 
           "4 cheese",
           "magherita",
           "prosciutto cotto",
           "prosciuto crudo",
           "funghi",
           "salmon feta cheese"),
  cost = c(300, 350, 350, 270, 400, 400, 320, 480),
  price = c(380, 450, 480, 320, 500, 500, 450, 580)
)
dbWriteTable(pizzeria, "pizzamenu", pizzamenu)

customers <- data.frame(
  customers_id = 1:5,
  customers_name = c("Joanna",
                     "Marina",
                     "Jonathan",
                     "Alberto",
                     "David"),
  customers_family_name = c("Soler",
                            "Monne",
                            "Tortan",
                            "Manhattan",
                            "Guterrez"),
  city = c("Madrid",
           "Toronto",
           "London",
           "Turin",
           "Bangkok"),
  favourite_menu = c("funghi",
                     "hawaiian",
                     "pepperoni",
                     "funghi",
                     "prosciuto crudo")
)

dbWriteTable(pizzeria, "customers", customers)

#list tables
dbListFields(pizzeria, "customers")
dbListFields(pizzeria, "pizzamenu")

# get data
dbGetQuery(pizzeria, "select * from customers
           join favourite_menu on customers.favourite_menu = pizzamenu.menu_name")

# disconnect
dbDisconnect(pizzeria)
