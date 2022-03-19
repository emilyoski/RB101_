=begin

Input: String
Output: Hash

Requirements:
-Hash should represent the frequency that each letter occurs in the string (T -> 3)
-Case sensitive; T and t are different counts
-How to handle an empty hash? (not happen here, given the problem)
-Do characters count? (not happen here, given the problem)
-Do spaces count? (no based on the test example)

Examples/Test Cases:
-Only one here

Data Structure:
-Start with a string; output a hash

Algorithm:
-Take the first character of the string
-Evaluate if it exists in the collection
-If it exists then the collection; add 1 to the count
-If it does not exist; add it to the collection plus a count of 1
-Stop the process when you have gone through all the characters in the string

=end

statement = "The Flintstones Rock"

statement_freq = {}

statement.chars do |letter|
	if letter == " "
		next
	elsif statement_freq.keys.include?(letter)
		statement_freq[letter] = statement_freq[letter] + 1
	else
		statement_freq[letter] = 1
	end
end

p statement_freq
