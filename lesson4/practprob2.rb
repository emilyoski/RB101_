ages = { "Herman" => 32, 
	"Lily" => 30, 
	"Grandpa" => 5843, 
	"Eddie" => 10, 
	"Marilyn" => 22, 
	"Spot" => 237 }

sum_age = 0

ages.each do |name, age|
	sum_age = sum_age + age
end

p sum_age