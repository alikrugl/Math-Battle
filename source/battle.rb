require_relative './player.rb'
require_relative './expression.rb'

class Battle
  attr_accessor :first_player, :second_player

  def initialize
    # Players enter their names
    names = enter_names
    # array to call method sample for the random choice of the turn
    @players = [Player.new(names[0]), Player.new(names[1])]
  end

  def round
    wait_for_the_expr
  end

  def game
    puts "Have a nice game #{@players[0].name} and #{@players[1].name}"
    current_player = select_first_player
    puts "#{current_player.name} your turn is first."
    puts 'Enter any key if you are ready to start: '
    gets
    round
  end

  def wait_for_the_expr
    puts "3"
    sleep(1)
    puts "2"
    sleep(1)
    puts "1"
    sleep(1)
  end

  def select_first_player
    # random turn of the players
    @players.sample.turn = true
    if @players[0].turn == true
      @first_player = @players[0]
      @second_player = @players[1]
    else
      @first_player = @players[1]
      @second_player = @players[0]
    end
    first_player
  end
end

