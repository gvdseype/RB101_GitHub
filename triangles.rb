def valid?(num1, num2, num3)
  if ([num1, num2, num3].sum == 180) && (num1 != 0 && num2 != 0 && num3 != 0)
    true
  else
    false 
  end
end

def triangle(num1, num2, num3)
angles = [num1, num2, num3]
angles.sort! { |a, b| a <=> b }
  if valid?(num1, num2, num3) == false
    :invalid
  else 
    if angles[2] == 90
      :right
    elsif angles[2] > 90
      :obtuse
    else
      :acute
    end
  end
end
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid


