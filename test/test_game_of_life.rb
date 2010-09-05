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
end
