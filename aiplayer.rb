require_relative 'player.rb'
require_relative 'thinker.rb'
require_relative 'game.rb'
require_relative 'guesser.rb'
require_relative 'dictionary.rb'

class AIPlayer < Player

	attr_reader :target_word

	def initialize(dictionary)
		super("Artificial Player")
		@target_word = dictionary.get_random_word
	end	
end