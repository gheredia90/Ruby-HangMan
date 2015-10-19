require_relative 'player.rb'
require_relative 'thinker.rb'
require_relative 'aiplayer.rb'
require_relative 'game.rb'
require_relative 'dictionary.rb'

class Guesser < Player

	attr_writer :number_of_attempts
	attr_reader :name, :number_of_attempts

	MAXIMUM_NUMBER_OF_ATTEMPTS = 6

	def initialize(name)
		super(name)
		@number_of_attempts = MAXIMUM_NUMBER_OF_ATTEMPTS
	end	

	def number_of_attempts
		@number_of_attempts
	end	

	def attempt
		puts "Please enter a letter"
		user_input = gets.chomp
	end	

	def reached_attempts_limit?
		@number_of_attempts == 0
	end	

end