(1..99).each {|num| puts num if num.odd?}

puts "BREAK. NEW WAY!"

1.upto(99) do |value|
	puts value if value % 2 != 0
end