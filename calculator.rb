def prompt(message)
  Kernel.puts("=>#{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operator_sync(op)
  case op
  when '1'
	   'Adding'
	when '2'
    'Subtracting'
	when '3'
	  'Multiplying'
	when '4'
	  'Dividing'
  end
end

num1 = ""
prompt("Welcome to calculator! Please enter your name")
name = ""
loop do
	name = Kernel.gets().chomp().capitalize
  if name.empty?()
	  prompt("Please put in a valid name")
  else 
	  break
	end
end
prompt("Welcome #{name}!")
loop do

  loop do

		prompt("Give me a number")
		num1 = gets.chomp
		if valid_number?(num1)
			break
		else
			prompt("seems like that is not a valid number")
		end
	end
	num2 = ""
	loop do 
		prompt("give me your second number")
		num2 = gets.chomp
		if valid_number?(num2)
			break
		else
			prompt("seems like that is not a valid number")
		end
	end
	machen = ""
	arr_prompt = <<-ben
		What do you want to do with these numbers
			1) add
			2) subtract
			3) multiply
			4) divide
	ben
	prompt(arr_prompt)
	loop do
		machen=Kernel.gets().chomp.downcase
		if %w(1 2 3 4).include?(machen)
			break
		else
			prompt("must put 1, 2, 3 or 4")
		end
	end

	prompt"#{operator_sync(machen)}..."
	result = case machen
	when "1" 
		num1.to_i + num2.to_i
	when "2"
		num1.to_i - num2.to_i
	when "3"
		num1.to_i * num2.to_i
	when "4"
		num1.to_f / num2.to_f
	end
	prompt("The result is #{result}")
	prompt("Do you want to perform another calculation? (y to calculate again)")
	ans = Kernel.gets().chomp
	break unless ans.start_with?("y")
end
prompt("Thank you for using calculator #{name}!")
