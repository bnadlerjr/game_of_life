require "test/unit"
require "game_of_life/matrix-ext"

class Matrix
  include MatrixExtensions
end

class TestMatrixExtensions < Test::Unit::TestCase
  def test_matrix_sum
    m = Matrix[ [1, 0, 0], [0, 1, 1], [0, 0, 0] ]
    assert_equal 3, m.sum
  end

  def test_neighbor_sum
    m = Matrix[
      [0, 0, 1, 1, 1],
      [1, 1, 0, 1, 0],
      [1, 0, 1, 0, 1],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 1]
    ]

    expected = Matrix[
      [2, 3, 3, 3, 2],
      [2, 4, 5, 5, 4],
      [3, 6, 4, 4, 1],
      [2, 4, 3, 5, 2],
      [1, 3, 2, 3, 0]
    ]

    assert_equal expected, m.neighbor_sum
  end

  def test_sub_matrix
    m = Matrix[
      [0, 0, 1, 1, 1],
      [1, 1, 0, 1, 0],
      [1, 0, 1, 0, 1],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 1]
    ]

    [ { :x => 0, :y => 0, :m => Matrix[[0,0],[1,1]] },             #top left
      { :x => 2, :y => 0, :m => Matrix[[0,1,1],[1,0,1]] },         #top ctr
      { :x => 4, :y => 0, :m => Matrix[[1,1],[1,0]] },             #top right
      { :x => 0, :y => 2, :m => Matrix[[1,1],[1,0],[0,1]] },       #ctr left
      { :x => 2, :y => 2, :m => Matrix[[1,0,1],[0,1,0],[1,1,0]] }, #ctr
      { :x => 4, :y => 2, :m => Matrix[[1,0],[0,1],[0,0]] },       #ctr right
      { :x => 0, :y => 4, :m => Matrix[[0,1],[0,0]] },             #btm left
      { :x => 2, :y => 4, :m => Matrix[[1,1,0],[0,1,0]] },         #btm ctr
      { :x => 4, :y => 4, :m => Matrix[[0,0],[0,1]] }              #btm right
    ].each do |expected|
      assert_equal expected[:m], m.sub_matrix(expected[:x], expected[:y])
    end
  end
end
