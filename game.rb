class Game

	def initialize(player, target_word)
		@player = player
		@target_word = target_word
		@playing = true
	end

	def check_word(word)

		word.downcase!
		target_word_downcased = @target_word.downcase

		@playing = !word.eql?(target_word_downcased)
		if @playing
			puts "Wrong word, keep trying mate!"
		else
			puts "Congrats, you have guessed the word!"
		end	
    end

    def check_character(character)

    	character.downcase!
    	target_word_downcased = @target_word.downcase

    	if target_word_downcased.include?(character) 
    		puts "Effectively, word contains letter #{character}"
    	else
    		@player.number_of_attempts -= 1
			puts "Attempts left: #{@player.number_of_attempts}"
		end
		@playing = @player.reached_attempts_limit? ? false : true
  	end  	

	def check_attemp(user_input)
		if user_input.size > 1
			check_word(user_input)		
		else
			check_character(user_input)		
		end
	end		
	
	def start_game
		while(@playing)
			check_attemp(@player.attempt)
		end
	end

end