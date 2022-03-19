user_length = 0.0
user_width = 0.0
SINCH_SQCENT = 6.4516

loop do
	puts "Enter the length of the room in feet:"
	user_length = gets.chomp.to_f

	break if user_length > 0
	puts "That's not right..."
end

loop do
	puts "Enter the width of the room in feet:"
	user_width = gets.chomp.to_f

	break if user_width > 0
	puts "That's not right..."
end

def determine_area(length, width)
	square_feet = (length * width).round(2)
	square_inch = (square_feet * 144).round(2)
	square_cent = (square_inch * SINCH_SQCENT).round(2)
	puts "The area of the room is #{square_feet} square feet. " + \
	"(#{square_inch} square inches and #{square_cent} square centimeters.)"
end

determine_area(user_length, user_width)