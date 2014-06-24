# benfords law. this is very incomplete. please don't judge

require 'yaml'

filename = 'Benfords Law2'
random_nums = []
for k in 0..1000
	random_nums[k] = rand(10) 
end


nums_yaml = random_nums.to_yaml

File.open filename, 'w' do |f|
	f.write nums_yaml
end

puts YAML::load File.read 'Benfords Law2'

