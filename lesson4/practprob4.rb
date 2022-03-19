=begin

-Input: Hash containing names and ages
-Output: Minimum age from the hash

-Requirements:
	-Pick out only one age for the minimum age from the hash
	-Assuming the minimum age will be the youngest (or smallest age)
	-No values will be added to the hash
	-Ages are values

-Examples/Test Cases:
	-N/A

-Data Structure: Hash; returning an integer 

-Algorithm: 
-Take the first value and set as the min age
-Compare the next value 
	-If its smaller than our min age, set that to be the min age
	-If its larger than our min age, move on 
-Compare all the values in the hash
	
=end

ages = { "Herman" => 32, 
	"Lily" => 30, 
	"Grandpa" => 5843, 
	"Eddie" => 10, 
	"Marilyn" => 22, 
	"Spot" => 237 }

min_age = ages['Herman']

ages.each do |name, age|
	if age < min_age
		min_age = age
	end
end

puts min_age
