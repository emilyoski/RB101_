arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

odd_arr = arr.sort_by do |array|
  array.select do |num|
    num.odd?
  end
end

p odd_arr
