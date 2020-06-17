def duplicate?(input)
  answer = nil
  input = input.to_s.chars
    if input.uniq.size < input.size
      answer = true
    else
      answer = false
    end
  answer
end

def featured(number)
  answer = nil
  number = number 
  loop do 
    number += 1
    if number.odd? && number % 7 == 0 && duplicate?(number) == false
      answer = number
      break
    else
    end
  end
  p answer
end

featured(9_999_999_999)