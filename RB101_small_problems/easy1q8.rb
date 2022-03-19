def average(array_of_num)
	sum = array_of_num.sum
	total = array_of_num.length
	average = sum/total
end

puts average([1, 6])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])