HASH = {"invalid" => :invalid, "equilateral" => :equilateral, "isosceles" => :isosceles, "scalene" => :scalene}

def made_array!(num1, num2, num3)
  example_array = []
  example_array << num1 << num2 << num3
  example_array
end

def is_valid_triangle?(num1, num2, num3)
  array = made_array!(num1, num2, num3).sort { |a, b| a <=> b }
  if (array[0] + array[1] > array[2]) && (array[0] != 0 && array[1] != 0 && array[2] != 0)
    true
  else
    false
  end
end

def delete_duplis!(num1, num2, num3)
  made_array!(num1, num2, num3).uniq.length #this will return the length of the array after having reduced duplicates to a single occurence
end

def triangle(num1, num2, num3)
  if is_valid_triangle?(num1, num2, num3) == false
    p HASH["invalid"]
  else
    if delete_duplis!(num1, num2, num3) == 2 
      p HASH["isosceles"]
    elsif delete_duplis!(num1, num2, num3) == 1
      p HASH["equilateral"] 
    else
      p HASH["scalene"]
    end
  end
end

triangle(3, 3, 3) 
triangle(3, 3, 1.5) 
triangle(3, 4, 5) 
triangle(0, 3, 3) 
triangle(3, 1, 1) 