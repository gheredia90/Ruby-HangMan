require_relative 'player.rb'
require_relative 'thinker.rb'
require_relative 'aiplayer.rb'
require_relative 'guesser.rb'
require_relative 'dictionary.rb'

class Game

	def initialize
		puts "Enter the number_of_players: 1 or 2"

		number_of_players = enter_number_of_players

		if number_of_players == 2.to_s
			initialize_two_players
		else
			initialize_one_player		
		end		

		@target_word = @thinker.target_word

		@playing = true
		@partial_guessed_word = ""
		(@target_word.size).times{@partial_guessed_word += "*"}
		puts @target_word
	end

	def valid_target_word_size?(word)
		(word.size > 5) && (word.size < 12)			
	end

	def add_character_to_partial_guess(character)
		positions = (0 ... @target_word.length).find_all { 
			|i| @target_word[i,1] == character
		}
		positions.each do |i| 
			@partial_guessed_word[i] = character
		end	
	end		
		
	def enter_number_of_players
		number_of_players = gets.chomp
		while ((number_of_players != 2.to_s) && (number_of_players != 1.to_s))
			puts "Enter either 1 or 2 players"
			number_of_players = gets.chomp
		end
		number_of_players
	end	

	def initialize_two_players
		puts "Dear guesser, please enter your name:"
		guesser_name = gets.chomp
		puts "Dear thinker, please enter your name:"
		thinker_name = gets.chomp
		puts "Dear thinker, please enter the target word:"
		target_word = gets.chomp
		while(!valid_target_word_size?(@target_word))
			puts "Wrong target word size, please enter another word:"
			target_word = gets.chomp
		end	

		@guesser = Guesser.new(guesser_name)
		@thinker = Thinker.new(thinker_name, target_word)
	end	

	def initialize_one_player
		puts "Dear guesser, please enter your name:"
		guesser_name = gets.chomp
		puts "Dear guesser, enter the dictionary file name:"
		dictionary_file = gets.chomp


		@guesser = Guesser.new(guesser_name)
		@thinker = AIPlayer.new(Dictionary.new(dictionary_file))
	end	


	def check_word(word)

		word.downcase!
		target_word_downcased = @target_word.downcase

		@playing = !word.eql?(target_word_downcased)
		if @playing
			puts "Wrong word, keep trying mate!"
		else
			puts "Congrats #{@guesser.name}, you have guessed the word!"
		end	
    end

    def check_character(character)

    	character.downcase!
    	target_word_downcased = @target_word.downcase

    	if target_word_downcased.include?(character) 
    		puts "Effectively, word contains letter #{character}"
    		add_character_to_partial_guess(character)    		

    	else
    		@guesser.number_of_attempts -= 1
			puts "Attempts left: #{@guesser.number_of_attempts}"
		end
		puts @partial_guessed_word
		@playing = @guesser.reached_attempts_limit? ? false : true
		if @playing == false
			puts "Congrats #{@thinker.name}, you have won!"
		end	
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
			check_attemp(@guesser.attempt)
		end
	end

end