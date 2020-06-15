def make_array(string)
  array = string.split('')
  new_array = []
  array.each do |element|
    if element == "("
      new_array << element
    elsif element == ")"
      new_array << element
    end
  end
  new_array
end

def balanced?(input)
  array = make_array(input)
  opening = 0
  closing = 0
  answer = nil 
  index = 0
  if array.size > 0
    loop do 
      if array[index] == "("
        opening += 1
      elsif array[index] == ")"
        closing += 1 
      end
      
      if closing > opening
        answer = false
        break
      elsif opening > closing
        answer = false
      elsif opening == closing
        answer = true
      end
      index += 1
      if index == array.size
        break
      end
    end
  else  
    answer = true
  end
  p answer
end
   
balanced?('What (is) this?')
balanced?('What is) this?')
balanced?('What (is this?')
balanced?('((What) (is this))?') 
balanced?('((What)) (is this))?')
balanced?('Hey!') 
balanced?(')Hey!(') 
balanced?('What ((is))) up(') 