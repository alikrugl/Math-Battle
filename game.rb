require './source/methods'

include Methods
greeting
sleep(1)
names = enter_names
players = [Player.new(names[0]), Player.new(names[1])]

