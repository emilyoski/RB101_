bytes = 'abcdefghijklmnopqrstuvwxyz0123456789'

def call_uuid(choices)
	uuid = ''

	8.times do
		num = rand(0..35)
		uuid << choices[num]
	end
	uuid << '-'
	4.times do
		num = rand(0..35)
		uuid << choices[num]
	end
	uuid << '-'
	4.times do
		num = rand(0..35)
		uuid << choices[num]
	end
	uuid << '-'
	4.times do
		num = rand(0..35)
		uuid << choices[num]
	end
	uuid << '-'
	12.times do
		num = rand(0..35)
		uuid << choices[num]
	end
	uuid << '-'

  uuid
end

p call_uuid(bytes)
p call_uuid(bytes)