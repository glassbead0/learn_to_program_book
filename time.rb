# experimenting with the Time object

puts 'What year were you born?'
year = gets.chomp
puts 'what month? type the number'
month = gets.chomp
puts 'what day?'
day = gets.chomp
puts 'do you know what time?'
if gets.chomp.downcase == 'yes'
	 puts 'what hour? (military time)'
	 hour = gets.chomp
	 puts 'what minute?'
	 minute = gets.chomp
else
	 hour = 0
	 minute = 0
end
birthtime = Time.local(year, month, day, hour, minute)
puts "your birthday is #{birthtime} and you are
#{((Time.new - birthtime)/(3600*24*365)).to_i} years old"
puts
puts

my_name = 'Aaron Apollo Glasenapp'
puts my_name[4..10]
