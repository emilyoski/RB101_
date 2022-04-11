=begin

-Input: A string
-Output: A string 

-Requirements:
-Input string will consist of all lowercased letters and non-alphabetic characters
-Remove any non-alphabetic characters
-No matter how many non-alphabetic characters in a row...only put one space
-Keep the lowercased letters
-Result should never have consecutive spaces

-Test Cases/Examples:
-Only one given...

-Data Structure:
-Potentially an array or string

-Algorithm:
-save all the lowercase letters somewhere
-Iterate through the characters
-Look at the character,
  -If its a letter,
    -Add it to the word
  -If its a non-alpha, 
    -Look at the next character...
    -if your next character is a letter, 
      -clear your "side letters" 
      -add a space
    -if your this is the last character...
      -add a space
  -stop when done iterating
-Return the word
  
=end

LETTERS = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
           'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

def cleanup(sentence)
  clean_sentence = ""
  characters = sentence.chars
  characters.each_with_index do |char, index|
    if LETTERS.include?(char)
      clean_sentence << char
    elsif index == characters.length - 1
      clean_sentence << ' '
    else
      next_char = characters[index + 1]
      if LETTERS.include?(next_char)
        clean_sentence << ' '
      end
    end
  end
  clean_sentence
end

p cleanup("---what's my +*& line?") == ' what s my line '