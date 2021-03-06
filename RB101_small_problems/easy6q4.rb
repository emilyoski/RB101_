require 'pry'

def reverse!(array)
  counter = 0
  array_orig = array.dup
  array.map! do |char|
    counter += 1
    array_orig[-counter]
  end
end

def reverse(array)
  new_array = []
  counter = 1
  array.each do |_|
    new_array << array[-counter]
    counter += 1
  end
  new_array
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true