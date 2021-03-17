require_relative  './player.rb'

class Battle
  def initialize
    # Players enter their names
    names = enter_names
    # array to call method sample for the random choice of the turn
    @players = [Player.new(names[0]), Player.new(names[1])]
  end
end

