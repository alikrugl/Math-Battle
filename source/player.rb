class Player
  attr_reader :name
  attr_accessor :health, :turn

  def initialize(name)
    @name = name
    @health = 100
    @turn = false
  end

end
