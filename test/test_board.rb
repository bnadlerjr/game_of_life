require "test/unit"
require "game_of_life/board"

class TestBoard < Test::Unit::TestCase
  # Helper class that acts as a test double for STDOUT. Will reset itself if
  # the CLS string is set.
  class Output
    CLS = "\e[H\e[2J"

    def messages; @messages ||= []; end    

    def puts(message)
      CLS == message ? @messages = [] : messages << message
    end
  end

  def setup
    @output = Output.new
    @board = Board.new(@output)
  end

  def test_create_board
    assert Board.new
  end

  def test_reset_board
    @board.instance_eval { @grid[1][1] = 0 }
    assert_equal 0, @board.instance_eval { @grid[1][1] }
    @board.reset
    assert_equal 1, @board.instance_eval { @grid[1][1] }
  end

  def test_show_board
    @board.show
    assert_equal "[000]", @output.messages[0]
    assert_equal "[010]", @output.messages[1]
    assert_equal "[000]", @output.messages[2]
  end

  def test_get_cell
    assert_equal 1, @board.get_cell(1,1)
  end

  def test_toggle_cell
    @board.toggle_cell(1,1)
    assert_equal 0, @board.get_cell(1,1)
  end

  def test_show_board_in_place
    @board.show
    assert_equal 3, @output.messages.size

    @board.show
    assert_equal 3, @output.messages.size
  end

  def test_get_neighbors
    positions = {
      1 => [0,0], 2 => [1,0], 3 => [2,0],
      4 => [0,1],             5 => [2,1],
      6 => [0,2], 7 => [1,2], 8 => [2,2]
    }

    positions.each do |k,v|
      @board.toggle_cell(v[0], v[1])
      assert_equal 1, @board.get_neighbor(1,1, k)
    end
  end

  def test_get_live_neighbors
    [
      { :grid => [[0,0,0], [0,1,0], [0,0,0]], :num_live => 0 },
      { :grid => [[1,0,0], [0,1,0], [0,0,0]], :num_live => 1 },
      { :grid => [[1,1,0], [0,1,0], [0,0,0]], :num_live => 2 },
      { :grid => [[1,1,1], [0,1,0], [0,0,0]], :num_live => 3 },
      { :grid => [[1,1,1], [1,1,0], [0,0,0]], :num_live => 4 },
      { :grid => [[1,1,1], [1,1,1], [0,0,0]], :num_live => 5 },
      { :grid => [[1,1,1], [1,1,1], [1,0,0]], :num_live => 6 },
      { :grid => [[1,1,1], [1,1,1], [1,1,0]], :num_live => 7 },
      { :grid => [[1,1,1], [1,1,1], [1,1,1]], :num_live => 8 }
    ].each do |scenario|
      @board.instance_eval { @grid = scenario[:grid] }
      assert_equal scenario[:num_live], @board.num_live_neighbors(1, 1)
    end
  end
end
