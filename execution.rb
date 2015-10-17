require_relative 'player.rb'
require_relative 'game.rb'


p = Player.new("Emilio")
g = Game.new(p, "Muerte en Venecia")

g.start_game