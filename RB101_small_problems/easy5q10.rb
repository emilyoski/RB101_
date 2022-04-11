require 'colorize'

def print_in_box(sentence)
  box_length_needed = sentence.length + 2
  box_length = ''
  space_length = ''
  box_length_needed.times {|_| box_length << '-'}
  box_length_needed.times {|_| space_length << ' '}
  puts '+'.colorize(:light_blue) + box_length.colorize(:light_blue) + '+'.colorize(:light_blue)
  puts '|'.colorize(:light_blue) + space_length + '|'.colorize(:light_blue)
  puts '| '.colorize(:light_blue) + sentence.colorize(:red) + ' |'.colorize(:light_blue)
  puts '|'.colorize(:light_blue) + space_length + '|'.colorize(:light_blue)
  puts '+'.colorize(:light_blue) + box_length.colorize(:light_blue) + '+'.colorize(:light_blue)
end



print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('This is pretty sweet!')

#+--------------------------------------------+
#|                                            |
#| To boldly go where no one has gone before. |
#|                                            |
#+--------------------------------------------+