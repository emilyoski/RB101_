=begin

-Input: Integer represents the # of digits in a number
-Output: Index at which its the FIRST time it has that # of digits in the number

-Requirements:
-Fibonacci starts with 1,1 then subsequent numbers are sum of two previous 
-First fibonacci number has index 1
-Need to be able to conduct a fibonacci sequence 
-Need to be able to count the number of digits in that number in the sequence
-Can assume the argument is always greater than or equal to 2

-Data Structure: Array for the fibonacci number?

-Algorithm:
-Store the input as # of digits in number
-Start with 1,1,2,3,5,8

-Add last two elements to check the next element
-Check the last element has the right # of digits
-Repeat the process
-Stop when the last element has the right # of digits

-Return the index of the last element (Index + 1 because fibonacci starts with 1)

=end
require 'pry'

def find_num_digits(number)
  number.to_s.length
end

def find_fibonacci_index_by_length(digits)
  fibonacci = [1,1,2,3,5,8]
  index = nil
  loop do
    fibonacci << fibonacci[-2] + fibonacci[-1]
    break if find_num_digits(fibonacci[-1]) == digits
  end
  index = 1 + fibonacci.index(fibonacci[-1])
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847