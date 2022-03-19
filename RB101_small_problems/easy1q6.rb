require 'pry'

def reverse_words(words)
	array_of_words = words.split
	array_of_words.each do |word|
		if word.length >= 5
			word.reverse!
		end
	end
	array_of_words.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')