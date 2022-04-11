=begin

-Input: Array 
-Output: Returns sorted array

-Requirements:
-Input array is consisting of integers between 0 and 19
-Method will sort those based on the English words for each number

=end

NUMBER_WORD = {1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
           5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight',
           9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve',
           13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen',
           16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen',
           19 => 'nineteen', 0 => 'zero'}

def alphabetic_number_sort(array)
  array.sort_by do |num|
    NUMBER_WORD[num]
  end
end



p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

