=begin
This commented part of the program was an exercise or two, but I decided to make this program more about roman numerals. see below
puts 'Do you want me to sing a song?'
song = gets.chomp.downcase
if song == 'yes'
	n = 99
	while n>1
		puts n.to_s + ' bottles of beer on the wall,'
		puts n.to_s + ' bottles of beer.'
		puts 'take one down, pass it around'
		if n > 2
			puts (n-1).to_s + ' bottles of beer on the wall'
		elsif n == 2
			puts '1 bottle of beer on the wall'
		end
		n -= 1
	end
	puts '1 bottle of beer on the wall,'
	puts '1 bottles of beer.'
	puts 'take one down, pass it around'
	puts '0 bottles of beer on the wall'
end
puts

puts 'Do you want to talk to grandma?'
var = gets.chomp.downcase
if var == 'yes'
	puts 'ok, what do you want to say?'
	words = gets.chomp
	while words != 'BYE'
		if words != words.upcase
			puts 'HUH?! SPEAK UP SONNY!'
		elsif words == words.upcase
			puts "not since " + (rand(20) + 1930).to_s
		end
		words = gets.chomp
	end

elsif var == 'no'
	puts 'wise choice. she never can hear you and never stops talking'
end

=end

# practice with recursion. making a factorial method
class Integer
	 def factorial
 		 if self < 0
  			 return 'nonsense'
  		elsif self == 0 || self == 1
  			 return 1
  		elsif self > 1
  			 return self*((self-1).factorial)
  		end
 	end
end

# roman numeral methods
def old_school(num) # this changes a number into roman numerals, not using the IV notation for 4
	 m = 0  # 1000
	 d = 0  # 500
	 c = 0  # 100
	 l = 0  # 50
	 x = 0  # 10
	 v = 0  # 5
	 i = 0  # 1
	 num2 = num
	 if num >= 1000
 		 m = num/1000
 		 num = num - 1000*m
 	end

	 if num >= 500
 		 d = 1
 		 num = num - 500
 	end

	 if num >= 100
 		 c = num/100
 		 num = num - 100*c
 	end

	 if num >= 50
 		 l = 1
 		 num = num - 50
 	end

	 if num >= 10
 		 x = num/10
 		 num = num - 10*x
 	end

	 if num >= 5
 		 v = 1
 		 num = num - 5
 	end
	 i = num

	puts "#{num2} in Roman Numerals is #{'M'*m + 'D'*d + 'C'*c + 'L'*l + 'X'*x + 'V'*v + 'I'*i}"
	'M'*m + 'D'*d + 'C'*c + 'L'*l + 'X'*x + 'V'*v + 'I'*i
end

def modern(num) # this changes a number to roman numerals with the special notation IV, IX...etc
	 m = 0  # 1000
	 d = 0  # 500
	 c = 0  # 100
	 l = 0  # 50
	 x = 0  # 10
	 v = 0  # 5
	 i = 0  # 1

	 iv = 0 # 4
	 ix = 0 # 9
	 xl = 0 # 40
	 xc = 0 # 90
	 cd = 0 # 400
	 cm = 0 # 900

	 n = num

	 if n >= 1000
 		 m = n/1000
 		 n = n - 1000*m
 	end
	 if n >= 500
 		 d = 1
 		 n = n - 500
 	end
	 if n >= 100
 		 c = n/100
 		 n = n - 100*c
 	end
	 if n >= 50
 		 l = 1
 		 n = n - 50
 	end
	 if n >= 10
 		 x = n/10
 		 n = n - 10*x
 	end
	 if n >= 5
 		 v = 1
 		 n = n - 5
 	end
	 i = n

	 if num%10 == 4
 		 i = 0
 		 iv = 1
 	end
	 if num%10 == 9
 		 v = 0
 		 i = 0
 		 ix = 1
 	end
	 if (num%100)/10 == 4
 		 x = 0
 		 xl = 1
 	end
	 if (num%100)/10 == 9
 		 l = 0
 		 x = 0
 		 xc = 1
 	end
	 if (num%1000)/100 == 4
 		 c = 0
 		 cd = 1
 	end
	 if (num%1000)/100 == 9
 		 c = 0
 		 d = 0
 		 cm = 1
 	end
	puts "#{num} in Roman Numerals is #{'M'*m + 'D'*d + 'CD'*cd + 'CM'*cm + 'C'*c + 'L'*l + 'XL'*xl + 'XC'*xc + 'X'*x + 'V'*v + 'I'*i + 'IV'*iv + 'IX'*ix}"
	'M'*m + 'D'*d + 'CD'*cd + 'CM'*cm + 'C'*c + 'L'*l + 'XL'*xl + 'XC'*xc + 'X'*x + 'V'*v + 'I'*i + 'IV'*iv + 'IX'*ix
end

# roman numerals to numbers within the String class, so it can be called with 'XIV'.to_num
class String
	def to_num
		 n = 0
		 roman_key = {
 			 'i' => 1,
 			 'v' => 5,
 			 'x' => 10,
 			 'l' => 50,
 			 'c' => 100,
 			 'd' => 500,
 			 'm' => 1000
 		}

		 roman = downcase.split(//)

		 k = 0
		 while k < roman.length
 			 unless  roman_key[roman[k]]
  				 puts 'that is not a valid roman numeral'
  				 return
  			end
 			 k += 1
 		end

		 k = 0
		 while k < roman.length - 1
 			 if roman_key[roman[k]] < roman_key[roman[k+1]]
  				 puts 'that is not a valid roman numeral'
  				 return
  			end
 			 k += 1
 		end

		 roman.each do |y|
 			 n += roman_key[y]
 		end
		puts "#{self} represents #{n}"
	end
end

# make the number to modern roman numerals method a true method on integers.
class Integer
	 def to_roman
 		 m = 0  # 1000
 		 d = 0  # 500
 		 c = 0  # 100
 		 l = 0  # 50
 		 x = 0  # 10
 		 v = 0  # 5
 		 i = 0  # 1

 		 iv = 0 # 4
 		 ix = 0 # 9
 		 xl = 0 # 40
 		 xc = 0 # 90
 		 cd = 0 # 400
 		 cm = 0 # 900

 		 n = self

 		 if n >= 1000
  			 m = n/1000
  			 n = n - 1000*m
  		end
 		 if n >= 500
  			 d = 1
  			 n = n - 500
  		end
 		 if n >= 100
  			 c = n/100
  			 n = n - 100*c
  		end
 		 if n >= 50
  			 l = 1
  			 n = n - 50
  		end
 		 if n >= 10
  			 x = n/10
  			 n = n - 10*x
  		end
 		 if n >= 5
  			 v = 1
  			 n = n - 5
  		end
 		 i = n

 		 if self%10 == 4
  			 i = 0
  			 iv = 1
  		end
 		 if self%10 == 9
  			 v = 0
  			 i = 0
  			 ix = 1
  		end
 		 if (self%100)/10 == 4
  			 x = 0
  			 xl = 1
  		end
 		 if (self%100)/10 == 9
  			 l = 0
  			 x = 0
  			 xc = 1
  		end
 		 if (self%1000)/100 == 4
  			 c = 0
  			 cd = 1
  		end
 		 if (self%1000)/100 == 9
  			 c = 0
  			 d = 0
  			 cm = 1
  		end
 		 # puts "#{self} in Roman Numerals is #{'M'*m + 'D'*d + 'CD'*cd + 'CM'*cm + 'C'*c + 'L'*l + 'XL'*xl + 'XC'*xc + 'X'*x + 'V'*v + 'I'*i + 'IV'*iv + 'IX'*ix}"
 		 'M'*m + 'D'*d + 'CD'*cd + 'CM'*cm + 'C'*c + 'L'*l + 'XL'*xl + 'XC'*xc + 'X'*x + 'V'*v + 'I'*i + 'IV'*iv + 'IX'*ix
 	end
end

=begin
while true
	puts "ok, now we're going to convert number into roman numerals."
	puts 'type old school or modern.'
	reply = gets.chomp.downcase
	if reply == 'old school'
		puts 'What number would you like to write in old-school roman numerals?'
		number = gets.chomp.to_i
		puts old_school number
		break
	elsif reply == 'modern'
		puts 'What number would you like to write in modern roman numerals?'
		number = gets.chomp.to_i
		puts modern number
		break
	else
		puts 'please type \'old school\' or \'modern\''
	end
end
=end

class Die
	 def initialize
 		 roll
 	end

	 def roll
 		 @num_shown = 1 + rand(6)
 	end

	 def set(num)
 		 if num > 0 && num < 7
  			 @num_shown = num
  		else
  			 puts 'invalid number for a die'
  		end
 	end

	 def show
 		 puts @num_shown
 	end
end

def time_counter(_block_description, &block)
	 start_time = Time.new
	 block.call
	 running_time = Time.new - start_time
	puts "#{block} took #{running_time} seconds."
end

# ---------------------------notes--------------------------------
for k in 1..10 # includes 10
	 for j in 1...50 # does not include 50
 		 next if j%3 == 0  # skips to next element in range
 		 puts j*k
 	end
end

14.times do
	 puts 'hi'
end

loop do
	 # do some stuff over and over
	 break if true
end

k=0
loop {
	 puts k.divmod(9)
	 k +=1
	 break if k > 100
}

# splat arguments. can pass as many people as you want.
def greeting(word, *_people)
		puts "#{word} #{person}"
end

def d_by_3?(n, like = false) # like is a default argument. could be passed or not
	if like
		puts "I like the number #{n}"
	end
	false
	if n%3 == 0
		 true
	end
end

# conditional assignment operator
number ||= 5  # assigns 5 to number only if number is not assigned alraady

5.upto(15) { |x|; puts x }  # also .downto method... same as 5..15.each?

# for debugging:
[1, 2, 3].respond_to?(:to_s) # returns false if the method can be called on the object

# the shovel!!

array = [1, 2, 3, 4] << 5  #-> [1,2,3,4,5]

# .select
# .each_key
# .each_value
