=begin
	
Input: Array with nested arrays
Output: Array reordered

Requirements: 
-Reorder numerically
-Reorder ONLY based on the odd numbers in the nested array
-Maintain the same structure
-Return a new array

Test Cases/Examples:
-Basically ignoring the even numbers as if they were not present

Data Structure:
-Array input and array output

Algorithm:
-Sort by the array
-Take each nested array and maintain only the odd elements
	-Take the first nested array
	-Select the odd elements of that array
	-Turn the rest into a string
	
=end

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr_oddonly = arr.sort_by do |array|
  array.select do |num|
		num.odd?
	end
end

p arr_oddonly



