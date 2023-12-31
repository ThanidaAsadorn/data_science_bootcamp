# R programming project 2

# Define the rule
data <- c("rock", "paper", "scissor")
bot <- sample(data, 1)

score <- 0

RPS <- function() {
  print("Let's play Rock Paper Scissor!")
  print("If you want to quit the game, please type \"QUIT\" ")

# Start the game loop
  while(TRUE) {
    print("Select your move: rock, paper, scissor")
    player <- readLines("stdin", n=1)
    bot <- sample(data, 1)
    print(paste("Bot: ", bot))
    
    if (player == "rock" & bot == "rock") {
      print("Tie")
    } else if (player == "rock" & bot == "paper") {
      print("Yay! You win.")
      score <- score + 1
    } else if (player == "rock" & bot == "scissor") {
      print("Oops! You lose.")
      score <- score - 1
    } else if (player == "paper" & bot == "rock") {
      print("Yay! You win.")
      score <- score + 1
    } else if (player == "paper" & bot == "paper") {
      print("Tie")
    } else if (player == "paper" & bot == "scissor") {
      print("Oops! You lose.")
      score <- score - 1
    } else if (player == "scissor" & bot == "rock") {
      print("Oops! You lose.")
      score <- score - 1
    } else if (player == "scissor" & bot == "paper") {
      print("Yay! You win.")
      score <- score + 1
    } else if (player == "scissor" & bot == "scissor") {
      print("Tie")
    } else if (player == "quit") {
      break
    } else {
      print("Invalid input. Please enter rock, paper, or scissor.")
    }
  }
  
  print(paste("Your score is ", score))
}

RPS()
