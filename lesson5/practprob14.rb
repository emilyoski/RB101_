hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

colors_sizes = []
colors =[]

hsh.each_value do |fruit_hsh|
	if fruit_hsh[:type] == 'fruit'
		colors = fruit_hsh[:colors]
		colors.each {|word| word.capitalize!}
  	colors_sizes << colors
	elsif fruit_hsh[:type] == 'vegetable'
		colors_sizes << fruit_hsh[:size].upcase
	end
end

p colors_sizes