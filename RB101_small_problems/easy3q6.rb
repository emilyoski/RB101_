=begin

-Input: two booleans (true/false)
-Output: true or false

-Requirements:
-Return a true or false
-Can only return true if exactly one of the statements are true
-Can the xor method accept more than one argument? (appears like just two)

-Data Structure:
-Arguments as expressions that evaluate to true/false (essentially booleans)
-Return a true/false

-Algorithm:
-Take true and false
-Return true if true and false
-Return true if false and true
-Return false in the case of false/false or true/true

=end

def xor?(exp1,exp2)
	if (exp1 == true) && (exp2 == false)
		true
	elsif (exp1 == false) && (exp2 == true)
		true
	elsif (exp1 == true) && (exp2 == true)
		false
	elsif (exp1 == false) && (exp2 == false)
		false
	else
		"Something's not right..."
	end
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)