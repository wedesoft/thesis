require 'matrix'
class Matrix
  def inverse_from(src)
    size = row_size - 1
    a = src.to_a

    for k in 0..size

      i = k
      akk = a[k][k].abs
      for j in (k+1)..size
        v = a[j][k].abs
        if v > akk
          i = j
          akk = v
        end
      end
      Matrix.Raise ErrNotRegular if akk == 0
      if i != k
        a[i], a[k] = a[k], a[i]
        @rows[i], @rows[k] = @rows[k], @rows[i]
      end
      akk = a[k][k]

      for i in 0 .. size
        next if i == k
        q = a[i][k] / akk
        a[i][k] = 0

        (k + 1).upto(size) do
          |j|
          a[i][j] -= a[k][j] * q
        end
        0.upto(size) do
          |j|
          @rows[i][j] -= @rows[k][j] * q
        end
      end

      (k + 1).upto(size) do
        |j|
        a[k][j] /= akk
      end
      0.upto(size) do
        |j|
        @rows[k][j] /= akk
      end
    end
    self
  end
end
