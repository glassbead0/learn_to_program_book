# pet dragon - this in an interactive text based game about a pet dragon.

class Dragon
	def initialize
		 puts 'After cultivating a mysterious egg for months, you notice a few cracks and realize that the egg is about to hatch.'
		 puts 'Not knowing what kind of creature will emerge, you must quickly come up with a name.'
		 puts 'What are you going to name the creature?'
		 name = gets.chomp
		 @name = name
		 @asleep = false
		 @food_in_belly = 10
		 @stuff_in_intestine = 0
		 if rand > 0.5
 			 @gender = 'his'
 			 @gender2 = 'he'
 		else
 			 @gender = 'her'
 			 @gender2 = 'she'
 		end

		puts "#{@name}, a baby dragon, hatches from  #{@gender} egg."
		puts 'You can...'
		puts " Play\n Feed\n Walk\n Put to bed\n Use Bathroom\n Exit\n"
	end

	def play
		puts "You take #{@name} out to play. When you throw the ball, instead of fetching it, #{@gender2} aims #{@gender} fiery breath at the ball and incinerates it."
		pass_time
	end

	def feed
		 puts 'mmmmm, dragon food.'
		 @food_in_belly += 1
		 pass_time
	end

	def walk
		 puts "Dragons don't walk, silly, they fly"
		 pass_time
	end

	def fly
		puts "Do you ride along or just keep #{@name} on a very long leash?"
		choice = gets.chomp.downcase
		if choice == 'ride along'
			puts "You hold on tight as #{@name} takes off and flies you around the countryside. WEEEEEEEE."
		elsif choice == 'leash'
			puts "As #{@name} takes off, you realize your bodyweight will do little to harness #{@gender} great strength.
           You are wildly pulled into the air, clinging tightly to the leash. This is not what you expected!"
		end
		pass_time
	end

	def put_to_bed
		puts "#{@name} lies down in #{@gender} dragon cradle and starts snoring. You then realize you should not have made the crib out of wood. You must diligently keep throwing water on the wood as it catches fire. "
		puts "#{@name} wakes up after a nice long nap."
		pass_time
	end

	def use_bathroom
    if @stuff_in_intestine > 0
			   @stuff_in_intestine = 0
			   puts 'Ewwww, now you have to use a giant poop bag to pick up dragon poop'
    elsif @stuff_in_intestine == 0
      puts "#{@name} doesn't have to go."
		end
		  pass_time
	end

	def confused
    puts "What? #{@name} doesn't know how to do that"
	end

	def exit_game
		 exit
	end

	def pass_time
	  if @food_in_belly > 0
 		  @food_in_belly -= 1
 		  @stuff_in_intestine += 1
 		end

		if @food_in_belly <= 0
			puts "#{@name} is so hungry, #{@gender2} has no choice but to eat you"
			@food_in_belly = 100
			exit
		end

		if @stuff_in_intestine >= 8
      puts "#{@name} had an accident"
      @stuff_in_intestine = 0
		end
	end
end

pet = Dragon.new

while true
  puts 'What would you like to do?'
	 move = gets.chomp.downcase
  if move == 'play'; pet.play
  elsif move == 'feed'; pet.feed
  elsif move == 'walk'; pet.walk
  elsif move == 'fly'; pet.fly
  elsif move == 'put to bed'; pet.put_to_bed
  elsif move == 'use bathroom'; pet.use_bathroom
  elsif move == 'exit'; pet.exit_game
  else; pet.confused
  end
end
