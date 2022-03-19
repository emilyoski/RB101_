=begin

Input: Array 
Output: Array 

Requirements:
-Output array must be new
-Each integer in the array must be incremeneted by 1
-Identical structure to the input array
-Must use the map method
-Do not modify original array

Test Cases/Examples:
-Not given 

Data Structure:
-Array input and array output

Algorithm:
-Take the first element
-Take the first key-value pair
-Increment the value by 1
-Repeat this for all the key-value pairs
-Repeat this for all the elements

=end

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
arr2 = arr.dup

arr_plus_one = arr2.map do |hash|
	
	hash.map do |key,value|
		value += 1
    {key => value}
	end

end

p arr_plus_one