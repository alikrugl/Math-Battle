require_relative './player.rb'
require_relative './expression.rb'
require 'colorize'

class Battle
  attr_accessor :first_player, :second_player

  def initialize
    # Players enter their names
    names = enter_names
    # array to call method sample for the random choice of the turn
    @players = [Player.new(names[0]), Player.new(names[1])]
  end
  # 1 round of the game for 2 players
  def round(first_player, second_player)
    puts "The turn of the player "+"#{first_player.name}".underline + "!"
    puts 'Enter any key if you are ready to start: '
    gets
    wait_for_the_expr
    question = Expression.new
    p question.question
    player_answer = gets.to_i
    if question.answer == player_answer
      puts "YES"
      second_player.health -= 20
    else
      puts "The correct answer was #{question.answer}. #{first_player.name} has missed."
    end
    players_info
  end
  # counting to the expression showed
  def wait_for_the_expr
    puts "3"
    sleep(1)
    puts "2"
    sleep(1)
    puts "1"
    sleep(1)
  end

  # displays players health
  def players_info
    print "#{@first_player.name}".underline + " has " + "#{@first_player.health}".red + " health. "
    puts "#{@second_player.name}".underline + " has " + "#{second_player.health}".red + " health."
    puts " "
    puts " "
  end

  # Main game
  def game
    puts "Have a nice game #{@players[0].name} and #{@players[1].name}!"
    select_first_player
    puts "#{@first_player.name} your turn is first."
    loop do
      round(@first_player,@second_player)
      round(@second_player,@first_player)
    end
  end

  # choosing the first player
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
    @first_player
  end
end

