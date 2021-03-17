module Methods
  def greeting
    puts 'Welcome to the Math-battle game!!!'
  end

  def enter_names
    name1 = ''
    name2 = ''
    while name1.length <= 2
      print 'Player 1, please enter your name(more that 2 symbols): '
      name1 = gets.chomp.to_s
    end
    puts ' '
    while name2.length <= 2
      print 'Player 2, please enter your name(more that 2 symbols): '
      name2 = gets.chomp.to_s
    end
    puts ' '
    [name1.capitalize, name2.capitalize]
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
end
