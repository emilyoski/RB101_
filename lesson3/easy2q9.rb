statement = 'The Flintstones Rock!'
count = 0
statement.each_char {|letter| count += 1 if letter == 't' }

statement.count('t')