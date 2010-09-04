require 'pp'

class GameOfLife
  VERSION = '0.1.0'
  ALIVE = 1
  DEAD = 0

  def initialize(output=STDOUT)
    @board = Board.new(output)
  end

  def run(generations)
    1.upto(generations) do
      @grid.each do |row|
        row.each do |cell|
          if ALIVE == cell
          else
            check_for_reproduction(row, cell)
          end
        end
      end
    end
  end

  private

  def check_for_reproduction(row, col)
    
  end
end
