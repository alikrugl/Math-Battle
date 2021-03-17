module Methods
  def greeting
    puts 'Welcome to the Math-battle game!!!'
  end

  def enter_names
    name1 = ''
    name2 = ''
    while name1.length < 2
      print 'Player 1, please enter your name(more that 2 symbols): '
      name1 = gets.chomp.to_s
    end
    puts '  '
    while name2.length < 2
      print 'Player 2, please enter your name(more that 2 symbols): '
      name2 = gets.chomp.to_s
    end
    [name1, name2]
  end
end
