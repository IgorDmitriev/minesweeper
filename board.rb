class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }
  end

  def populate_grid
    10.times do
      pos = find_random_empty_pos
      self[pos] = "💣"
    end
  end

  def render
    puts "   #{0.upto(8).to_a.join(" ")}"
    grid.size.times do |i|
      puts "#{i}  #{grid[i].join(" ")}"
    end
  end


  def find_random_empty_pos
    loop do
      pos = [rand(9), rand(9)]
      return pos if self[pos].nil?
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

end
