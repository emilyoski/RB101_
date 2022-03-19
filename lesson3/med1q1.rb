=begin

Input: String/phrase
Output: String printed out 10 times; each time with an additional space in the front of the string

Requirements: 
-MISSED: THIS WAS A ONE-LINE PROBLEM!
-Does the string start with a space in the front?
-Reprint the entire string 
-String outputted will be the same each time
Examples/Test Cases:
-Could ask for longer string and how you handle that (only one string in this question)

Data Structure:
-Get a string; use a string throughout and output a string

Algorithm:
-Get the string
-Print the string
-Add a space
-Repeat this process 10 times

=end

def repeat_with_spaces(phrase)
	count = 0
	puts phrase
	spaces = ""

	while count < 10 do
    spaces << " "
		puts spaces + phrase
		count += 1
	end
end

repeat_with_spaces("The Flintstones Rock!")
	