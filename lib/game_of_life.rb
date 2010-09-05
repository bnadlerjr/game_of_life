$: << File.dirname(__FILE__)

class Array
  def sum
    self.inject { |sum, i| sum+=i }
  end
end

require 'game_of_life/board'

class GameOfLife
  VERSION = '0.1.0'
  ALIVE = 1
  DEAD = 0

  def initialize(output=STDOUT)
    @grid = [
      [0,0,0],
      [0,1,0],
      [0,0,0]
    ]
    @board = Board.new(output)
  end

  def run(generations)
    1.upto(generations) do |tick|
      @grid.each do |row|
        row.each do |cell|
          if ALIVE == cell
          else
          end
        end
      end
    end
  end

  private

  def check_for_reproduction(row, col)
    @board.num_live_neighbors(row, col) == 3
  end
end

#@game = GameOfLife.new
#@game.run(10)
