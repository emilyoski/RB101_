def definitely_odd?(num)
	if num % 2 != 0
		true
	elsif num % 2 == 0
		false
	end
end

def is_odd?(number)
	number.remainder(2) == 1 || number.remainder(2) == -1
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)