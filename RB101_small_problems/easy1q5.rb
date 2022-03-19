def reverse_sentence(normal_words)
	words = normal_words.split
	words.reverse!
	reverse_words = ' '
	words.each { |word| reverse_words << word + " "}
	reverse_words
end

puts reverse_sentence("Hello World")
