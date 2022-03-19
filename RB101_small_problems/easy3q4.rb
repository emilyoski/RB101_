=begin

-Input: 2 integers
-Output: Product of those numbers

-Requirements:
-Does it take negative numbers? 
-Does it take float numbers?
-Return the result
-Is there a default value if only one (or no) numbers are given?

Test Cases/Examples:
-based on test cases, looks like we are doing only non-negative numbers (will test though)
-Integers based on the tests cases

Data Structure:
-Method takes integers, keep them as integers and outputs an integer

-Algorithm:
-Receive two numbers
-Multiply them 
-Return the product

=end

def multiply(num1 = 5, num2 = 3)
	num1 * num2
end

puts multiply(2, 10)
puts multiply()
puts multiply(2)
puts multiply(-10, 2)

puts "Next Problem"

def square(num1)
	multiply(num1, num1)
end

puts square(8)
puts square(4)
