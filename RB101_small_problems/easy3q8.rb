=begin

Input: String
Output: True/false (depending on if the string is a palindrome)

Requirements:
-Case matters as does punctuation and spaces (M is not m)
-Are we evaluating numbers as strings? (yes)

Data Structure:
-String input; true/false output. potentially array in the middle?

Algorithm:
-Get the string
-remove non-alphabet characters
-downcase all the letters
-reversse the string
-compare the string and the reverse of the string
-return the result of the comparison (true/false)

=end
require "pry"

valid_char = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
'0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def palindrome?(user_string)
	reverse_string = user_string.reverse
	user_string == reverse_string
end

def real_palindrome?(string, valid_items)
	compare_string = ''
	string.downcase!
  string.each_char do |char|
		compare_string << char if valid_items.include?(char)
	end 

	palindrome?(compare_string)
end


puts real_palindrome?('madam', valid_char)
puts real_palindrome?('Madam', valid_char)
puts real_palindrome?("madam i'm adam", valid_char)
puts real_palindrome?('356653', valid_char)
puts real_palindrome?('356a653', valid_char)
puts real_palindrome?('123ab321', valid_char)
