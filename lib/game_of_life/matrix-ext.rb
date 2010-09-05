require 'matrix'

module MatrixExtensions
  def neighbor_sum
    rows = []
    0.upto(self.row_size-1) do |row|
      cols = []
      0.upto(self.column_size-1) do |col|
        cols << (self.sub_matrix(row, col).sum)
      end
      rows << cols
    end
    Matrix.rows(rows, false)
  end

  def sub_matrix(x, y)
    from_col, size_col = calc_col_info(x)
    from_row, size_row = calc_row_info(y)
    self.minor(from_row, size_row, from_col, size_col)
  end

  def sum
    self.to_a.flatten.sum
  end

  private

  def calc_col_info(x)
    0 == x ? [x, 2] : [x-1, 3]
  end

  def calc_row_info(y)
    0 == y ? [y, 2] : [y-1, 3]
  end
end
