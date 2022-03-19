=begin

Input: Hash
Output: Vowels from the strings 

Requirements:
-Utilize the each method
-Use the hash given which has array of strings in the value 
-Strings in the array are what we are evaluating for vowels
-What is the format of the vowels that we are returning? (string, array, etc.?)
-Do we need to repeat show vowels if they appear more than once? (a vice aa?)
-Is this case sensitive?

Test Cases/Examples:
-None so assuming that we will return every vowel even if its repeated
-Assuming case sensitive

Data Structure:
-Hash input...potentially string or array output

Algorithm:
-Go to the first key-value pair
-Return the value
-Look at the first element
	-Evaluate each character in the string
	-If its a vowel, save it to the output string
	-Continue until you evaluate all the characters
-Repeat this process for each element
-Repeat this process for each key-value pair

=end

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowel_string = ''
current_letter = ''
vowels = ['A', 'a', 'E', 'e', 'I', 'i', 'U', 'u', 'O', 'o']

require "pry"

hsh.each_value do |words|
	words.each do |word|
		word.chars do |letter|
			if vowels.include?(letter)
				vowel_string << letter
			end
		end
	end
end

p vowel_string