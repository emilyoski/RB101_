=begin

-Input: Array of strings
-Output: Hash where key is string; value is position in array

-Requirements:
	-Strings are the keys from the array
	-Position in the array are the values
	-No additional strings will be added; solely evaluating the strings in the current array
	-No repeat cases (based on the example)

-Examples/Test Cases
	-Only one example array given which we are using

-Data Structure
	-Array converted into a hash 

-Algorithm
	-Take the first element in the array
	-Assign it to the key position
	-Assign 0 to the value position
	-increase the position number
	-repeat the process until the array is empty

=end
require "pry"

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_org = {}
current_Flintstone = ''
position = 0

loop do
	current_Flintstone = flintstones[position]
  flintstones_org[current_Flintstone] = position

	position += 1
	break if position >= flintstones.size 
end

p flintstones_org