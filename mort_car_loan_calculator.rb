# require "pry"

# m = p * (j / (1 - (1 + j)**(-n)))
def prompt(message)
  puts "=> #{message}"
end

loan_duration = 10
apr = ""
mc_option = <<-DOT
Would you like to calculate... Please pick number :
1) Mortgage loan
2) Car loan
DOT

my_option = <<-DOT
Is your loan duraton in :
1) Months
2) Years
DOT

months_or_years = ""

prompt("Welcome to Car/Mortgage Loan Calculator!")
prompt("Please enter name")
name = gets.chomp.capitalize
prompt("Hello #{name}!")
prompt(mc_option)
loop do
  m_or_c = gets.chomp
  if m_or_c == "1"
    puts "Entering mortgage loan calculator..."
    puts "Mortgage Loan Calculator"
    break
  elsif m_or_c == "2"
    puts "Entering car loan calculator..."
    puts "Car Loan Calculator"
    break
  else
    puts "Must put '1' or '2'"
  end
end

prompt("Enter loan amount without symbols?")
loan_amount = gets.chomp.to_i

loop do
  prompt("Enter Annual Percentage Rate (APR)")
  apr = gets.chomp
  if apr.length == 0
    prompt("Please enter APR")
    next
  else
    break
  end
end
apr = apr.to_i.to_f
apr = (apr / 100.0) / 12.0

prompt(my_option)
# binding.pry
loop do
  months_or_years = gets.chomp
  if months_or_years == "1"
    prompt("Enter Loan Duration In Months")
    loan_duration = gets.chomp.to_i
    break
  elsif months_or_years == "2"
    prompt("Enter Loan Duration in Years")
    loan_duration = gets.chomp.to_i
    loan_duration *= 12
    break
  else
    puts "Must put '1' or '2'"
  end
end
# binding.pry
monthly_payment = loan_amount * (apr / (1 - (1 + apr)**(- loan_duration)))
prompt("Your monthly payment is #{monthly_payment}")
