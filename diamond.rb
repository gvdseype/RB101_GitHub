def diamond(number)
array = (1..number).to_a
new_array = []
mid_section_index = ((number - 1) / 2)
left_up = mid_section_index
right_up = mid_section_index 
  loop do 
  break if right_up == number
  new_array = array.each_with_index.map do |value, index|
      if left_up.upto(right_up).include?(index)
        value = "*"
      else
        value = " "
      end
    end
  left_up -= 1
  right_up += 1
  puts new_array.join
  end
left_up += 1
right_up -= 1
  loop do 
  break if right_up == mid_section_index
  left_up += 1
  right_up -= 1
  new_array = array.each_with_index.map do |val, ind|
      if left_up.upto(right_up).include?(ind)
        val = "*"
      else
        val = " "
      end
    end
  puts new_array.join
  end
end

diamond(9)


# array = ["*", " ", "*", " "]
# puts array.join