=begin

Input: Array of numbers
Output: Array of numbers

Requirements:
-Output array returns with the same number of elements
-Each element in the output array has the running total from the original array
-The first element will be the same in both
-Each element in the new array will be a summation of that element and previous elements in the old array
-Empty arrays will return empty arrays
-Appears to be given arrays consisting of just integers
-Single element arrays will output a single element

Test Cases/Examples:
-Shown...nothing additional to add here

Data Structures:
-Given an array and return an array 

Algorithm:
-Get the array
-Start the output array as empty
-Set the first value in the output array the same as the first value in the input array
-For each element in the output array, sum the first index to that index...make that the element
-Output the array (should be the same number of numbers)

=end

def running_total(input_nums)
	output_nums = []
	
	input_nums.each_with_index do |num, index|
		
		count = 0
		sum = 0
		while count <= index
			sum += input_nums[count]
			count += 1
		end

		output_nums << sum
	end

	output_nums
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []



