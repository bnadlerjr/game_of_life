require "test/unit"
require "game_of_life"

class TestGameOfLife < Test::Unit::TestCase
  def setup
    @game = GameOfLife.new
  end

  def test_initialize_game
    assert GameOfLife.new
  end

  def test_evolve_under_population
    assert_equal GameOfLife::DEAD, 
      @game.instance_eval { evolve_cell(GameOfLife::ALIVE, 1) }
  end

  def test_evolve_overcrowding
    assert_equal GameOfLife::DEAD,
      @game.instance_eval { evolve_cell(GameOfLife::ALIVE, 4) }
  end

  def test_evolve_live_on
    assert_equal GameOfLife::ALIVE,
      @game.instance_eval { evolve_cell(GameOfLife::ALIVE, 2) }

    assert_equal GameOfLife::ALIVE,
      @game.instance_eval { evolve_cell(GameOfLife::ALIVE, 3) }
  end

  def test_evolve_reproduction
    assert_equal GameOfLife::ALIVE,
      @game.instance_eval { evolve_cell(GameOfLife::DEAD, 3) }

    assert_equal GameOfLife::DEAD,
      @game.instance_eval { evolve_cell(GameOfLife::DEAD, 2) }
  end
end
