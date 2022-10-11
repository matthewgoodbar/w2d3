require_relative "board"
require_relative "player"

class Battleship

  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts @board.num_ships
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      return true
    else
      return false
    end
  end

  def win?
    if @board.num_ships > 0
      return false
    else
      puts "you win"
      return true
    end
  end

  def game_over?
    return true if win? || lose?
    return false
  end

  def turn
    user_input = @player.get_move
    hit = @board.attack(user_input)
    @board.print
    @remaining_misses -= 1 if !hit
    puts @remaining_misses
  end
end
