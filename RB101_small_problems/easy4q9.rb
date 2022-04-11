DIGITS_STRINGS = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
          5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

def integer_to_string(num)
  number = num.digits
  number.reverse!
  number.map! do |value|
    DIGITS_STRINGS[value]
  end
  number.join()
end

def signed_integer_to_string(value)
  if value < 0
    "-" + integer_to_string(value*-1)
  elsif value > 0
    '+' + integer_to_string(value)
  else
    integer_to_string(value)
  end
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
puts "Next exercise.."
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'