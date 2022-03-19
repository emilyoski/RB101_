words = "the flintstones rock"

array_words = words.split

array_words.map! {|word| word.capitalize! }

p array_words.join(" ")

