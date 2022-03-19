=begin

Input: Integer (end point of the range)
Output: Integer (representing sum)

Requirements:
-Number given will be greater than one 
-Sum will be from all the multiples of 3 or 5 within the range
-Range will be from 1 to input integer
-Multiples is 3 OR 5...not both
-Includes 1 and the input integer for evaluating as a multiple

Test Cases/Examples:
-Assuming no decimals/fractions
-Will be greater than 1

Data Structure:
-Input of an integer; collect the multiples in an array; output an integer

Algorithm:
-Get the input integer
-Set the range as 1 to the input integer (including it)
-Evaluate all the numbers in the range
	-If its a multiple of 3, save it
	-If its a multiple of 5, save it
-When you have all the multiples, add them all up
-Return the sum

=end

def multisum(outer_range)
	multiples = []

	for num in 1..outer_range
		if (num%3 == 0) || (num%5 == 0)
			multiples << num
		end
	end
  
	multiples.sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168