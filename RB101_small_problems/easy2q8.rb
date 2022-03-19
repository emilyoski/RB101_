=begin
Input: Integer (>0), Choice (Sum/Product)
Output: Choice (Sum/Product) of all the numbers between 0 and the input integer

Requirements: 
-Sum or product or each number in the range including your input integer
-Needs to be integer greater than zero from the user
-Assume that the user gives the correct input?
-sum or product calculation begins with 1

Examples/Test Cases:
-Test cases given and worked through...nothing to add above

Data Structure:
-Integer as input, output is integer, use range in the middle

Algorithm: 
-Get integer from user
-Get choice from the user
-If sum
	-Put the integer into the range
	-iterate through the range by adding all the numbers to the sum
-If product
	-put the integer into the range
	-iterate through the range by multiplying all the numbers to the product
-Display the value to the user 

	
=end

loop do
  puts "Please enter an integer that is > 0:"
  num = gets.chomp.to_i

	break if num > 0
	puts "Error: The number is not greater than zero..."
end

loop do
	puts "Enter 's' to compute the sum, 'p' to compute the product:"
  choice = gets.chomp.downcase

	break if (choice == 's') || (choice == 'p')
	puts "Error: Enter one of the available options..."
end


sum = 0
product = 1

if choice == 's'
	(1..num).each { |value| sum = sum + value}
	puts "The sum of the integers is #{sum}."
elsif choice == 'p'
	(1..num).each { |value| product = product * value}
	puts "The product of the integers is #{product}."
else
  puts "You didn't pick 'p' or 's'"
end
