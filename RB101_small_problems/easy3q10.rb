=begin

Input: Integer
Output: True/false 

Requirements: 
-Need to output true/false based on if the number is a palindrome
-Does this account for negative numbers or decimals?
-How do we handle a non-integer input?

Examples/Test Cases: 
-Appears that we are just looking at positive integer arguments

Data Structure:
-Integers

Algorithm:
-Receive the integer
-Reverse the values 
-Compare the input integer and reversed integer
-Return true/false based on the above comparison

=end

def palindromic_number?(value)
	reverse_value = ''
	value_array = value.to_s.reverse.split(//)
	value_array.each { |num| reverse_value << num}
	value == reverse_value.to_i
end

puts palindromic_number?(34543)
puts palindromic_number?(123210)
puts palindromic_number?(22)
puts palindromic_number?(5)
