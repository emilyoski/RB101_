=begin

Input: Array with nested arrays
Output: Same array with all nested arrays ordered

Requirements:
-Nested arrays should be ordered alphabetically or numerically in DESCENDING order
-Returned in the same structure (assuming the order of the nested arrays is the same)
-Return a NEW array; not this array mutated 

Test Cases/Examples:
-No test cases here

Data Structure:
-Given an array, return an array

Algorithm:
-Take the first element of the array
-Resort based on descending order
-Do the same with each element of the array
-Return when completed

=end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
require "pry"

arr_sorted = arr.map do |things|
	things.sort do |a,b|
		b <=> a
	end
end

p arr_sorted