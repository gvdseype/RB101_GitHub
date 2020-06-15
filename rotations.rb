def rotate_array(array)
  array[1..-1] + [array[0]]
  end
  
  def rotate_rightmost_digits(number, index)
  number = number.to_s.chars
  number[-index..-1] = rotate_array(number[-index..-1])
  number.join.to_i
  end
  
  p rotate_rightmost_digits(735291, 3) == 735912