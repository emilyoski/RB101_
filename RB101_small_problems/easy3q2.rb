=begin

Input: 2 positive integers from the user
Output: 6 operations with the 2 integers provided 
	(add, subtract, product, quotient, remainder, power)

Requirements:
-Need to be positive integers (addressed some of the questions)
-Do not need to valid the input (addressed in the problem statement)
-How would you handle a zero number (going to assume non-zero input)

Data Structure:
-Integers input; will remain as integers
-Output integers

Algorithm:
-Get the first integer
-Get the second integer
-Perform the 6 operations
-Display the results to the user 

=end

puts "Enter the first number:"
num_first = gets.chomp.to_i

puts "Enter the second number:"
num_second = gets.chomp.to_i

add_num = num_first + num_second
sub_num = num_first - num_second
prod = num_first * num_second
quot = num_first / num_second
remain = num_first % num_second
power = num_first ** num_second

puts "The addition of those numbers: #{add_num}."
puts "The subtraction of those numbers: #{sub_num}."
puts "The product of those numbers: #{prod}."
puts "The quotient of those numbers: #{quot}."
puts "The remainder of those numbers: #{remain}."
puts "The power of those numbers: #{power}."