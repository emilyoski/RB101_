def sum(num)
	total = 0
	num.digits.each do |number|
    total += number
	end
	total
end

puts sum(23)
puts sum(496)
puts sum(123_456_789)