produce = {
	'apple' => 'Fruit',
	'carrot' => 'Vegetable',
	'pear' => 'Fruit',
	'broccoli' => 'Vegetable'
}

def select_fruit(food)
	fruit_food = {}

	food.each do |food, type|
	  if type == 'Fruit'
			fruit_food[food] = type
		end
	end

	fruit_food
end

p select_fruit(produce)