require 'pry'
LETTERS = ('a'..'z').to_a << ('A'..'Z').to_a
LETTERS.flatten! 

def word_count(word)
  count = 0
  word.chars.each {|letter| count += 1 if LETTERS.include?(letter) }
  count
end

def word_sizes(sentence)
  word_sizes_count = {}
  words = sentence.split
  words.each do |word|
    if word_sizes_count.key?(word_count(word))
      word_sizes_count[word_count(word)] += 1
    else
      word_sizes_count[word_count(word)] = 1
    end
  end
  word_sizes_count 
end

p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") #== { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}