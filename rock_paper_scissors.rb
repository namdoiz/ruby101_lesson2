# require "pry"
VALID_CHOICES = %w(rock paper scissors spock lizard)

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper") ||
    (first == "lizard" && second == "spock") ||
    (first == "spock" && second == "scissors") ||
    (first == "rock" && second == "lizard") ||
    (first == "scissors" && second == "lizard") ||
    (first == "paper" && second == "spock") ||
    (first == "spock" && second == "rock")
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won")
  else
    prompt("Its a tie")
  end
end

def return_result(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won"
  else
    "Its a tie"
  end
end
user_win_count = 0
computer_win_count = 0
result_array = []
choice = ""
computer_choice = ""
prompt("Welcome to ROCK PAPER SCISSORS - LIZARD SPOCK!")
puts " "
prompt("First to 3 mode...")
puts " "
prompt("Enter username:")
user_name = Kernel.gets().chomp().capitalize
prompt("Hello #{user_name}")
loop do
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
    result_array << return_result(choice, computer_choice)
    user_win_count = result_array.count { |result| result.start_with?("You") }
    computer_win_count = result_array.count { |result| result.start_with?("Comp") }
    if user_win_count == 3
      prompt("You are the Grand winner!")
      break
    elsif computer_win_count == 3
      puts("Computer is the Grand winner")
      break
    end
  end
  prompt("You won #{user_win_count} time(s),
   Computer won #{computer_win_count} time(s)")
  prompt("Do you want to play again? ('y' to play again)")
  play_again = Kernel.gets().chomp()
  break unless play_again == "y"
end
prompt("Thanks for playing!")
