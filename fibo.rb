def fibonacci(nth)
index = 1
array = [0, 1]

  loop do 
    last = (array[index-1] + array[index])
    array << last
    index += 1
    break if index == nth
  end

array[-1]
end

p fibonacci(8)