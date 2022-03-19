=begin

Input: array
Output: array (containing every other element of the input array)

Requirements: 
-What if there is an empty array?
-What if there is only one element of the array?
-Return the value of the array (not print it)

Examples/Test Cases:
-Examples demonstrate that an empty array will output an empty array
-One element will just produce that one element output array

Data Structure:
-input array and output array

Algorithm:
-Get the input array
-Select every other element in the array
-Put those elements into a new array
-Return the new array

=end

def oddities(array_user)
	array_selected = []
	count = 0

	array_user.each do |thing|
		if count % 2 == 0
      array_selected << array_user[count]
	  end
		count += 1
	end

  array_selected
end

p oddities([2,3,4,5,6])
p oddities([1,2,3,4,5,6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])