=begin

Input: Hash containing a person (key) and value is hash about them
Output: Hash containing an additional key-value in their value hash

Requirements:
-Add an additional age_group key to the value hash for each family member
-age_group is determined by age
	Kid (0-17); Adult (18-64); Senior (65+)
-How to handle an age that is negative (does not exist in this example)

Test Cases/Examples:
-Only one

Data Structure: 
-Hash and will remain a hash

Algorithm:
-Look at the first family member with their age
-Determine the age range that their age is in (age_group)
-Add the appropriate age_group to the value hash

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, data|
	if (data["age"] > 0) && (data["age"] <= 17)
		data["age_group"] = "kid"
	elsif (data["age"] >= 18) && (data["age"] <= 64)
		data["age_group"] = "adult"
	elsif (data["age"] >= 65)
		data["age_group"] = "senior"
	end
end

p munsters