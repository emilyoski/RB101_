=begin

-Algorithm:
-Take the integer as the number of lines you will print
-Start with the last element being a * (on line 1)
-Then make the element to the left of the *...a *
-Repeat this process until the whole line is stars

=end

def triangle(num)
  line = ''
  counter = 0
  num.times { |_| line << "*"}

  loop do
    puts line
    line[counter] = ' '
    counter += 1
    break if line[-1] == ' '
  end
end

triangle(5)
triangle(9)