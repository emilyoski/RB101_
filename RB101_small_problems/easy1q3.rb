def digit_list(num)
	num_array = num.to_s.chars
	num_array.map {|number| number.to_i }
end

p digit_list(12345)