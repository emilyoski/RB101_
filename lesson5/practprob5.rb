=begin   

Input: Hash containing hashes
Output: Integer representing sum of ages of male family members

Requirements:
-Total only the male family members
-Sum their ages
-Only examine the entries in the hash

Test Cases/Examples:
-None

Data Structure:
-Hash input and integer output

Algorithm:
-Look at this first family member
-Determine if they are a male
-If they are a male, add their age to the sum
-If they are a female, skip
-Stop when you have looked at all the family members
-Return the sum

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

sum = 0

munsters.each do |name, describe|
	if describe["gender"] == "male"
		sum += describe["age"]
	end
end

p sum