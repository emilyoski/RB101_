=begin

Input: Integer (represents a year)
Output: String (represents a century)

Requirements:
-String output needs to show the century # and appropriate ending (st, nd, rd, th)
-New centuries begin in years that end with 01...1901-2000 is the 20th century
-No negative years or decimal/fractional years (assuming from test cases)
-Start at 0...assuming again based on test cases
-Need to be able to show the future centuries past this current century (test cases)

Test Cases/Examples:
-Shown test cases 

Data Structure:
-Takes an integer and returns a string 

Algorithm:
-Receive the year
-Determine the century
	-If the year is less than 1000...
		round to the closest hundred..divide by 100
	-If the year is more than 1000...
		Round up to the closest thousand (2000 stays...2001 would round up to 2100)
		-Divide by 100
	-Return value is the century 
-Determine the appropriate ending (st, nd, rd, th)
-Return the century with the ending

=end

require "pry"

def century(year)
	century_from_year = 0
	century_ending = ''

	if year%100 == 0
		century_from_year = year/100
	else
		century_from_year = (year/100) + 1
	end

	year_digit = year.digits[0]

	case year_digit
	when 1 
		century_ending = 'st'
	when 2
		century_ending = 'nd'
	when 3
		century_ending = 'rd'
	else
		century_ending = 'th'
	end

	century_from_year.to_s + century_ending
end

puts century(2000) 
puts century(2001) 
puts century(1965) 
puts century(256) 
puts century(5) 
puts century(10103) 
puts century(1052) 
puts century(1127) 
puts century(11201) 

