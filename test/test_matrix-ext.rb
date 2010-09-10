require "test/unit"
require "game_of_life/matrix-ext"

class Matrix
  include MatrixExtensions
end

class TestMatrixExtensions < Test::Unit::TestCase
  def setup
    @matrix = Matrix[
      [0, 0, 1, 1, 1],
      [1, 1, 0, 1, 0],
      [1, 0, 1, 0, 1],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 1]
    ]

    @examples = [
      { :x => 0, :y => 0, :s => 2, :m => Matrix[[0,0],[1,1]] },            #tl
      { :x => 2, :y => 0, :s => 4, :m => Matrix[[0,1,1],[1,0,1]] },        #tc
      { :x => 4, :y => 0, :s => 3, :m => Matrix[[1,1],[1,0]] },            #tr
      { :x => 0, :y => 2, :s => 4, :m => Matrix[[1,1],[1,0],[0,1]] },      #cl
      { :x => 2, :y => 2, :s => 5, :m => Matrix[[1,0,1],[0,1,0],[1,1,0]] },#c
      { :x => 4, :y => 2, :s => 2, :m => Matrix[[1,0],[0,1],[0,0]] },      #cr
      { :x => 0, :y => 4, :s => 1, :m => Matrix[[0,1],[0,0]] },            #bl
      { :x => 2, :y => 4, :s => 3, :m => Matrix[[1,1,0],[0,1,0]] },        #bc
      { :x => 4, :y => 4, :s => 1, :m => Matrix[[0,0],[0,1]] },            #br
      { :x => 3, :y => 0, :s => 4, :m => Matrix[[1,1,1],[0,1,0]] }
    ]
  end

  def test_matrix_sum
    @examples.each do |example|
      assert_equal example[:s], example[:m].sum
    end
  end

  def test_neighbor_sum
    expected = Matrix[
      [2, 3, 3, 3, 2],
      [2, 4, 5, 5, 4],
      [3, 6, 4, 4, 1],
      [2, 4, 3, 5, 2],
      [1, 3, 2, 3, 0]
    ]

    assert_equal expected, @matrix.neighbor_sum
  end

  def test_three_by_three_sub_matrix
    @examples.each do |expected|
      assert_equal expected[:m], 
        @matrix.three_by_three_sub_matrix(expected[:y], expected[:x])
    end
  end
end
