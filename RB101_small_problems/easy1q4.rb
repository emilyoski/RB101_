def count_occurrences(array_of_things)
	hash_of_things = { }
	loop do
		thing = array_of_things.shift.downcase

		if hash_of_things.include?(thing)
      hash_of_things[thing] = hash_of_things[thing] + 1
		else
			hash_of_things[thing] = 1
		end

		break if array_of_things.empty?
	end

	puts hash_of_things
end

vehicles = [
  'car', 'car', 'truck', 'car', 'suv', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)