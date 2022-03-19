=begin

Input: 2 Strings 
Output: One string which is (short string) + (long string) + (short string)

Requirements:
-How to handle more than two or less than two strings? 
Examples do not show this; only can accept two and will always be two?
-Empty strings count
-Is this case sensitive? looks to be only lower case strings given with no characters
-How to concatenate the strings; anything between them? Nope; no spaces and just combine them into one string

Test Cases/Examples:
-Show an empty string and just use that as the short - still valid

Data Structure:
-String inputed and string outputed 

Algorithm: 
-Receive both strings
-If the first string is longer, print out the 2nd/1st/2nd
-If the second string is longer, print out the 1st/2nd/1st

=end
require "pry"

def short_long_short(string1, string2)
  if string1.length > string2.length
		"#{string2}" + "#{string1}" + "#{string2}"
	elsif string2.length > string1.length
		"#{string1}" + "#{string2}" + "#{string1}"
	else
		"This is not right.."
	end
end 

puts short_long_short('abc', 'defgh')
puts short_long_short('abcde', 'fgh')
puts short_long_short('', 'xyz')
puts short_long_short('abc', 'xyz')