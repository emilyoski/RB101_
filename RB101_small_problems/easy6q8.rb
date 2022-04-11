=begin

-Algorithm:
-Take the search value
-Iterate through the array
-If the element is equal to the search value, return true
-If the element is not found, return false

=end

def include?(array, search_value)
  array.each do |element|
    return true if element == search_value
  end
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false