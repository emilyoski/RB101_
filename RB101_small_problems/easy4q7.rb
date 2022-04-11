require "pry"

STRING_TO_DIGIT = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                   '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0}

def string_to_integer(numbers)
  arr = numbers.chars
  arr.map! do |num|
    STRING_TO_DIGIT[num]
  end
  
  value = 0
  arr.each do |num|
    value = 10 * value + num
  end
  value
end

def string_to_signed_integer(number)
  if number[0] == '+'
    clean_num = number.delete("+")
    string_to_integer(clean_num)
  elsif number[0] == '-'
    clean_num = number.delete("-")
    string_to_integer(clean_num) * (-1)
 else
   string_to_integer(number)
 end
end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
puts "Next exercise"
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100