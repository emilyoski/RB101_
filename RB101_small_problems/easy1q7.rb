def stringy(num)
	count = 0
	output = ' '
	while count < num
		if count.even?
			output << '1'
			count += 1
		else
			output << '0'
			count += 1
		end
	end
	output
end

puts stringy(6)
puts stringy(9)
puts stringy(4)
puts stringy(7)
