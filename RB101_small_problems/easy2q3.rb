bill_amount = 0.0
tip_percent = 0.0

loop do
	puts "What is the bill amount?"
	bill_amount = gets.chomp.to_f
	break if bill_amount > 0
	puts "That's not right.."
end

loop do
	puts "What is the tip percentage?"
	tip_percent = gets.chomp.to_f
	break if tip_percent > 0
	puts "That's not right..."
end

def tip_calculator(bill, tip_percentage)
	tip_decimal = tip_percentage * 0.01
	tip = bill * tip_decimal

	puts "The tip is $#{format("%.2f",tip)}."
	puts "The bill is $#{format("%.2f",bill)}."
end

tip_calculator(bill_amount, tip_percent)