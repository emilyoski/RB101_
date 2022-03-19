def teddy_age
	puts "What is your name?"
	name = gets.chomp
	name = 'Teddy' if name.empty?
	age = rand(20...200)
	"#{name} is #{age} years old!"
end

puts teddy_age