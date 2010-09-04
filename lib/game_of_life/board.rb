class Board
  def initialize(output=STDOUT)
    @output = output
    reset
  end

  def reset
    @grid = [
      [0,0,0],
      [0,1,0],
      [0,0,0]
    ]
  end

  def get_cell(x, y)
    @grid[x][y]
  end

  def num_live_neighbors(x, y)
    @grid[x-1][y-1] +
    @grid[x][y-1]   +
    @grid[x+1][y-1] +
    @grid[x-1][y]   +
    @grid[x+1][y]   +
    @grid[x-1][y+1] +
    @grid[x][y+1]   +
    @grid[x+1][y+1]
  end

  def get_neighbor(x, y, position)
    return @grid[x-1][y-1] if 1 == position
    return @grid[x][y-1]   if 2 == position
    return @grid[x+1][y-1] if 3 == position
    return @grid[x-1][y]   if 4 == position
    return @grid[x+1][y]   if 5 == position
    return @grid[x-1][y+1] if 6 == position
    return @grid[x][y+1]   if 7 == position
    return @grid[x+1][y+1] if 8 == position

    raise ArgumentError, "Invalid position. Must be 1-8 (was #{position})."
  end

  def toggle_cell(x, y)
    @grid[x][y] = (@grid[x][y] - 1).abs
  end

  def show
    @output.puts "\e[H\e[2J"
    @grid.each { |row| @output.puts "[#{row.join}]" }
  end
end
