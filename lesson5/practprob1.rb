=begin

Input: Array of number strings
Output: Same array; reordered by descending numeric values

Requirements:
-Reordered by descending numeric values
-Reorder only the elements shown; don't add or delete elements
-No repetitive values (based on the example)

Test Cases/Examples:
-None

Data Structure: 
-Array input and output

Algorithm:
-Receive the array
-Sort by greatest to smallest
-Output the array

=end

arr = ['10', '11', '9', '7', '8']

sorted_arr = arr.sort do |a,b|
	b.to_i <=> a.to_i
end

p sorted_arr