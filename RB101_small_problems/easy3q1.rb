=begin

Input: 6 numbers from the user
Output: Answer (if 6 was entered in the previous 5 entries)

Requirements:
-Do all the numbers need to be positive?
-How do we handle non-integer numbers? (decimals, fractions, etc.)

Examples/Test Cases:
-Looks like all positive numbers and the numbers should all be integers 
(based on the test cases/examples shown)

Data Structure:
Integers input; hold the integers in an array

Algorithm:
-Get the integer input 
-Store that integer in an array
-Repeat that process 5 times
-Get the final integer
-Check if the final integer exists in the array
-Display if the integer exists in the array

=end

count = 0
number_inputs = []

while count < 5 do
	count += 1
	puts "Enter the #{count} integer:"
	num = gets.chomp.to_i
	number_inputs << num
end

puts "Enter the 6th/final number:"
num_compare = gets.chomp.to_i

if number_inputs.include?(num_compare)
	puts "The number #{num_compare} APPEARS in #{number_inputs}."
else
	puts "The number #{num_compare} does NOT appear in #{number_inputs}."
end
