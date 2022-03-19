my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(numbers)
	
	numbers.map! {|num| num * 2 }
end

p double_numbers!(my_numbers)

p my_numbers