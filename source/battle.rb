require_relative './player.rb'
require_relative './expression.rb'
require 'colorize'
require 'benchmark'

class Battle
  attr_accessor :first_player, :second_player

  def initialize
    # Players enter their names
    names = enter_names
    # array to call method sample for the random choice of the turn
    @players = [Player.new(names[0]), Player.new(names[1])]
  end

  # Main game
  def game
    puts "Have a nice game #{@players[0].name} and #{@players[1].name}!"
    puts " "
    select_first_player
    puts "#{@first_player.name} your turn is first."
    loop do
      round(@first_player, @second_player)
      round(@second_player, @first_player)
    end
  end

  # 1 round of the game for 2 players
  def round(first_player, second_player)
    puts "The turn of the player " + "#{first_player.name}".underline + "!"
    puts 'Enter any key if you are ready to start: '
    gets
    wait_for_the_expr
    question = Expression.new
    player_answer = nil
    p question.question
    time = Benchmark.measure do
      player_answer = gets.to_i
    end
    if question.answer == player_answer && time.real.round(0) < 5
      damage = 20 - time.real.round(0)
      second_player.health -= damage
      puts "Time of answering -- #{time.real.round(0)}. #{second_player.name} lost #{damage} health points."
    elsif  question.answer == player_answer && time.real.round(0) >= 5
      puts "Woops, #{second_player.name} has beated off your hit! But you have answered correctly!"
    else
      puts "The correct answer was #{question.answer}. #{first_player.name} has missed."
    end
    players_info
  end



  # displays players health
  def players_info
    print "#{@first_player.name}".underline + " has " + "#{@first_player.health}".red + " health. "
    puts "#{@second_player.name}".underline + " has " + "#{second_player.health}".red + " health."
    puts " "
    puts " "
  end

  # choosing the first player
  def select_first_player
    # random turn of the players
    @first_player = @players.sample
    if @first_player == @players[0]
      @second_player = @players[1]
    else
      @second_player = @players[0]
    end
  end

  # condition to end the game
  def end_of_the_game?
    true if @first_player.health <= 0 || @second_player.health <= 0
    false
  end
end

