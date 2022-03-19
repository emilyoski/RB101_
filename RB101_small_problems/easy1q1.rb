def repeat(word, num)
	count = 0
	
	while count < num
		puts word
		count += 1
	end
end

repeat("Hello world", 3)

def repeat_simple(string, number)
	number.times { puts string }
end

repeat_simple("What's up?", 5)