=begin

-Take the first char in the string..
  -If the next char is the same,
    continue onto the next char
  -If the next char is different,
    add it to the new string
  -stop when you have look at all characters

=end

def crunch(sentence)
  clean_sentence = ''
  broken_sentence = sentence.chars
  broken_sentence.each_with_index do |letter, idx|
    if letter == broken_sentence[idx + 1]
      next
    else
      clean_sentence << letter
    end
  end
  clean_sentence
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''