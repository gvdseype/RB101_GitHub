def sum_square_difference(n)
  sum_square_first_integers = 0
  square_sum = (1.upto(n).sum)**2
  1.upto(n) do |el|
    sum_square_first_integers += el**2
  end
  p square_sum - sum_square_first_integers
end

sum_square_difference(100)