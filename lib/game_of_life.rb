$: << File.dirname(__FILE__)

require 'game_of_life/matrix-ext'

class Matrix
  include MatrixExtensions
end

class GameOfLife
  VERSION      = '0.1.0'
  ALIVE        = 1
  DEAD         = 0
  GREEN        = "\e[32m"
  RED          = "\e[31m"
  CLEAR_SCREEN = "\e[H\e[2J"

  def initialize(output=STDOUT)
    @output = output
    @board = Matrix[
      [0, 0, 1, 1, 1],
      [1, 1, 0, 1, 0],
      [1, 0, 1, 0, 1],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 1]
    ]
  end

  def run(generations)
    print_board(0)
    1.upto(generations) do |tick|
      sleep(0.1)
      @neighbors = @board.neighbor_sum
      @board = evolve_board
      print_board(tick)
    end
  end

  private

  def evolve_board
    rows = []
    0.upto(@board.row_size-1) do |row|
      cols = []
      0.upto(@board.column_size-1) do |col|
        cols << evolve(@board[row, col], @neighbors[row, col])
      end
      rows << cols
    end
    Matrix.rows(rows)
  end

  def evolve(value, neighbor_sum)
    if ALIVE == value
      (neighbor_sum < 2 || neighbor_sum > 3) ? result = DEAD : result = ALIVE
    else
      neighbor_sum == value ? result = ALIVE : result = DEAD
    end
    result
  end

  def print_board(tick)
    @output.puts CLEAR_SCREEN
    @output.puts "Tick: #{tick}"
    @board.row_vectors.each do |row| 
      @output.print '[ '
      row.to_a.each do |col|
        ALIVE == col ? color = GREEN : color = RED
        @output.print colorize(col, color) + ' '
      end
      @output.print "]\n"
    end
  end

  def colorize(text, color=GREEN)
    "#{color}#{text}\e[0m"
  end
end

@game = GameOfLife.new
@game.run(50)
