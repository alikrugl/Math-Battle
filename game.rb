require './source/methods'

include Methods
# Greeting with the name of game
greeting
sleep(1)
# Players enter their names
names = enter_names
# array to call method sample for the random choice of the turn
players = [Player.new(names[0]), Player.new(names[1])]

