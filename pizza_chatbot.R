# R programming project 1

# Define the pizza menu
menu_id <- c(1, 2, 3, 4, 5, 6, 7)
pizza_menu <- c("pizza magherita", "pizza con funghi", "pizza con prosciuto cotto", "pizza con prosciuto crudo", "pizza 4 cheese", "pizza pepperoni", "pizza con patatine fritte")
pizza_price <- c(250, 350, 450, 500, 350, 450, 350)

# Create a data frame of the pizza menu
df <- data.frame(menu_id, pizza_menu, pizza_price)

# Define the function to order pizza
order_pizza <- function() {
  # Initialize the total price of the order
  total <- 0
  
  # Start the ordering loop
  while(TRUE) {
    # Print the welcome message and the pizza menu
    print("Hello! Welcome to LA MIA PIZZERIA")
    print("Here is our menu: ")
    print(pizza_menu)
    
    # Prompt the customer for their order
    print("What would you like to order?")
    customer_order <- tolower(readLines("stdin", n=1))
    
    # Check if the customer's order is valid
    if(customer_order %in% pizza_menu) {
      # Add the price of the ordered pizza to the total price
      total <- total + pizza_price[pizza_menu == customer_order]
      
      # Ask the customer if they want to order more pizzas
      print("We have received your order! What would you like more? If no more order, type 'check bill' ")
      continue
    }
    else if(customer_order == "check bill") {
      # Return the total price of the order
      return(total)
    }
    else {
      # Print an error message if the customer's order is invalid
      print("Sorry, the request is not the service provided")
    }
  }
}
order_pizza()
