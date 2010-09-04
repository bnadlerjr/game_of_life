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
            
          end
        end
      end
    end
  end
end
