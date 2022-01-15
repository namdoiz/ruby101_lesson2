
loop do
  Kernel.puts("Give me a number you want to add or subtract or divide with another") 
  puts("wagwan")
  num1=gets.chomp.to_i
  Kernel.puts("give me your second number")
  num2= gets.chomp.to_i
  Kernel.puts("what do you want me to do with these numbers? type 'add' or 'subtract' or 'multiply' or 'divide'")
  machen=Kernel.gets().chomp.downcase
  if machen=="add"
    Kernel.puts("Your numbers added is #{num1+num2}"+" thank you"+ "!")
    break
  elsif machen=="subtract"
    Kernel.puts("Your numbers subttracted is #{num1-num2}")
    break
  elsif machen == "multiply"
    Kernel.puts("Your numbers multiplied is #{num1*num2}")
    break
  elsif machen == "divide"
    Kernel.puts("Your numbers divided is #{num1.to_f/num2.to_f}")
    break
  else
    return
  end
end
