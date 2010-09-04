require "test/unit"

require "game_of_life"

class TestGameOfLife < Test::Unit::TestCase
  def setup
    @game = GameOfLife.new
  end

  def test_initialize_game
    assert GameOfLife.new
  end

  def test_check_for_reproduction
  end
#  def test_get_grid
#    assert @game.grid
#  end
#
#  def test_print_grid
#    assert @game.print_grid
#  end
#
#  def test_run_game
#    assert @game.run(10)
#  end
#
#  def test_can_get_neighbor
#    grid = [
#      [1,0,0,],
#      [0,0,0,],
#      [0,0,0,]
#    ]
#
#    @game.grid = grid
#    assert_equal 1, @game.get_neighbor(1, 1, 1)
#  end
end
