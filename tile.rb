

class Tile
  attr_reader :bomb, :adj_bombs, :revealed

  def initialize( bomb= false, revealed = false, bo)
    @bomb = bomb
    @flagged = false
    @adj_bombs = 0
    @revealed = revealed
  end

  def

  def reveal
    revealed = true
  end

  def bombify
    @bomb = true
  end

  def to_s
    return "X" unless revealed
    "#{adj_bombs}"
  end
  # def initialize(bombed= false,
end
