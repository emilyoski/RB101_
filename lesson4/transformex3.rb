my_numbers = [1, 4, 3, 7, 2, 6]

def multiply!(numbers, mult_by_num)
	numbers.map! do |num|
		num = num * mult_by_num
	end

	numbers
end

p multiply!(my_numbers, 3)