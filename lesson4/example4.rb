def upper_snake(str)
  words = str.split
  current_word = 0

  loop do
    current_word += 1
    break if current_word == words.size

    words[current_word].upcase!
  end

  words.join('_')
end

sentence = 'The sky was blue'
p upper_snake(sentence) # => 'the_sky_was_blue'