=begin

Input: Integer (Representing a year)
Output: True/False (representing if that year is a leap year)

Requirements:
-Year will be given valid (no 0s; no decimals/fractions)
-Leap year is:
	-Evenly divisible by 4
	-Not leap year if also divisible by 100
	-Still a leap year if evenly divisble by 400
-Return a boolean 

Test Cases/Examples:
-Needs to be valid for current years and past years
-Will be above 0 and given as a integer 

Data Structure:
-Given an integer; return a boolean

Algorithm:
-Receive the year
-If year evenly divisible by 4 and not divisible by 100; its a leap year
-If year evenly divisible by 400; its a leap year
-Tell true or false leap year

=end

def leap_year?(year)
	if year < 1752
		(year%4 == 0)? true : false
	else
		if (year%4 == 0) && (year%100 != 0)
			true
		elsif (year%400 == 0)
			true
		else
			false
		end
	end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true