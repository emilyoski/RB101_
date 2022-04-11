=begin

-Input: string
-Output: Integer (sum represents the overall ASCII string values)

-Requirements: 
-Output represents the sum of all character's ASCII string value 
-Can utilize the #ord method (determines the ASCII value)
-Case sensitive (use a method to determine the ASCII value)
-REMEMBER, taking the ASCI value of each character...NOT the entire string

Test Cases/Examples:
-Looks like it will always be a string (no invalid inputs)
-Potentially receive an empty string...will need to return 0 in this case

Data Structure: 
-String input...collect our characters in an array, output an integer 

Algorithm:
-Receive the word
-IF the word is empty...return zero
-Break the word into individual characters 
-Determine the ASCI value of each of those characters
-Determine the sum of all the ASCI values
-Return that sum 

=end

def ascii_value(word)
  return 0 if word == ''
  characters = word.chars
  char_ascii = characters.map do |char|
    char.ord
  end
  char_ascii.sum
end



p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
