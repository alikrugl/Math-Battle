require_relative './player'
require_relative './expression'
require 'colorize'
require 'benchmark'

class Battle
  # fisrt player will move first
  attr_accessor :first_player, :second_player

  def initialize
    # Players enter their names
    names = enter_names
    # array to call method sample for the random choice of the turn
    @players = [Player.new(names[0]), Player.new(names[1])]
    puts "Every player has only#{" #{Player.new('Name').health}".red} health."
  end

  # Main game
  def game
    puts "Have a nice game #{@players[0].name} and #{@players[1].name}!"
    puts ''
    select_first_player
    puts "#{@first_player.name} your turn is first."
    loop do
      round(@first_player, @second_player)
      if @second_player.health <= 0
        win_info(@first_player, @second_player)
        break
      end
      players_info

      round(@second_player, @first_player)
      if @first_player.health <= 0
        win_info(@second_player, @first_player)
        break
      end
      players_info
    end
  end

  # 1 round of the game for 2 players
  def round(first_player, second_player)
    puts "The turn of the player #{first_player.name.to_s.underline}!"
    puts 'Enter any key if you are ready to start: '
    gets
    wait_for_the_expr
    # the expression to calculate
    expression = Expression.new
    # answer that entered player
    player_answer = nil
    p expression.question
    time = Benchmark.measure do
      player_answer = gets.to_i
    end
    if expression.answer == player_answer && time.real.round(0) < 20
      damage = 20 - time.real.round(0)
      second_player.health -= damage
      puts "Time of answering -- #{time.real.round(0)} seconds. #{second_player.name} lost #{damage} health points."
    elsif  expression.answer == player_answer && time.real.round(0) >= 20
      puts "Whoops, #{second_player.name} has beaten off your hit! But you have answered correctly!"
    else
      puts "The correct answer was #{expression.answer}. #{first_player.name} has missed."
    end
  end

  # displays players health
  def players_info
    print "#{@first_player.name.to_s.underline} has #{@first_player.health.to_s.red} health. "
    puts "#{@second_player.name.to_s.underline} has #{@second_player.health.to_s.red} health."
    puts ' '
    puts ' '
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

  # displays info of the winner
  #
  # @param first_player is a winner
  # @param second_player is a looser
  def win_info(first_player, second_player)
    puts 'THE WINNER IS'.green + " #{first_player.name}".green.underline
    print "#{first_player.name.to_s.underline} has #{first_player.health.to_s.red} health. "
    puts "#{second_player.name.to_s.underline} has #{'0'.red} health."
  end
end

