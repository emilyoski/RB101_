=begin

-Input: String existing of words or multiple words
-Output: Integer showing how many characters are in the input 

-Requirements:
-The character count does not count spaces
-how do we handle special characters? 
-how do we handle numbers?

Examples/Test Cases:
-Special characters appear to count
-Assume based on prompt that we will not get numbers 

Data Structure: 
-String
-Potentially array to separate the items in the input or string
-Integer

Algorithm:
-Get string
-Iterate through the string; count the non-space characters
	-Separate each character of the input string into an array
	-Look at the array, if element is valid then increase the count
	-Look at the array, if element is space/empty then do nothing with the count
-Display the count of characters

=end

puts "Please write a word or multiple words:"
user_words = gets.chomp

user_words_indiv = user_words.split(//)
count = 0

user_words_indiv.each do |char|
	count += 1 if char != " "
end

puts "There are #{count} characters in '#{user_words}'."
