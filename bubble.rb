array = [5, 3, 5]
index = 0
loop do
  if index == (array.size - 1)
    index = 0
  elsif array[index] > array[index+1]
    array[index], array[index+1] = array[index+1], array[index]
  end
    # binding.pry
  index += 1
  break if array = array.sort
end

p array

