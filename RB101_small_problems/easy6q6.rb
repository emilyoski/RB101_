=begin

-Input: Array
-Output: Array containined 2 nested arrays

-Requirements:
-Output 2 arrays; first array is first half; second array is second half
-Odd number of elements...middle element will go into the first array

-Test Cases/Examples:
-Need to be able to accept empty arrays and still return the nested arrays 

-Data Structure:
-Array

-Algorithm:
-Determine the length of the array
-If the length is odd, the first nested array length is (take the half + 1)
-If the length is even, the first nested array length is (take the half)
-Make the first array and add the elements according to the first nested array length then stop
-Add the remaining elements to the second nested array

=end

def halvsies(array)
  length = array.length

  if length.odd?
    arr1_length = (length / 2) + 1
  elsif length.even?
    arr1_length = length / 2
  end
  arr1 = array.first(arr1_length)
  
  arr2_length = length - arr1_length
  arr2 = array.last(arr2_length)

  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
