require_relative 'player.rb'
require_relative 'game.rb'
require_relative 'aiplayer.rb'
require_relative 'guesser.rb'
require_relative 'dictionary.rb'

class Thinker < Player

	attr_reader :target_word

	def initialize(name, target_word)
		super(name)
		@target_word = target_word
    end

end