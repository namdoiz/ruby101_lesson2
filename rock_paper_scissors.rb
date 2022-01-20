VALID_CHOICES = %w(rock paper scissors)

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("Its a tie")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

choice = ""
prompt("Welcome to ROCK PAPER SCISSORS!")
prompt("Enter username:")
user_name = Kernel.gets().chomp().capitalize
prompt("Hello #{user_name}")
loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end
  computer_choice = VALID_CHOICES.sample
  Kernel.puts("You choose: #{choice}; Computer chose: #{computer_choice}")
  display_result(choice, computer_choice)
  prompt("Do you want to play again? ('y' to play again)")
  play_again = Kernel.gets().chomp()
  break unless play_again == "y"
end
prompt("Thanks for playing!")
