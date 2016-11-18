class Game
  attr_reader :board

  def initialize
    @board = Board.new
    board.populate_grid
  end

  def play
    until game_over?
      action = ask_for_action
      pos = ask_for_pos

      case action
      when :reveal then reveal(pos)
      when :flag then flag(pos)
      end
    end
  end

  def game_over?
    won? || bombed?
  end

  def ask_for_action
    puts 'Do you want to Reveal of Flag? (r / f)'
    print '> '
    action = nil

    begin
      action = gets.chomp.downcase
    rescue
      raise "Put either 'r' for Reveal or 'f' for Flag"
      action = nil
    end

    action
  end

  def ask_for_pos
    pos = nil
    until pos && valid_pos?(pos)
      puts 'What position? (i.e. 0,0)'
      print '> '

      begin
        pos = parse_pos(gets.chomp)
      rescue
        puts "Invalid position entered (did you use a comma?)"
        puts ""

        action = nil
      end
    end
    action
  end

  def parse_pos(string)
    string.split(',').map { |char| Integer(char) }
  end

  def valid_pos?(pos)
    if pos.is_a?(Array) &&
      pos.length == 2 &&
      pos.all? { |x| x.between?(0, board.size - 1) }
      return true
    else
      get_pos
    end
  end
end

if $PROGRAM_NAME == __FILE__
  game = Game.new
  game.play
end
