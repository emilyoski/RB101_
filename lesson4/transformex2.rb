my_numbers = [1, 4, 3, 7, 2, 6]

require "pry"

def double_odd_numbers(numbers)
  index = 0
	loop do 

  	if index.odd?
	  	numbers[index] = numbers[index] * 2
  	end

  	index += 1
    break if index >= numbers.length 
	end

	numbers
end

p double_odd_numbers(my_numbers)