=begin



=end

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr_3s = arr.map do |array|
	array.select do |num|
		num%3 == 0
	end
end

p arr_3s