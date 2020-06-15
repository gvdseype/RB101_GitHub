
def word_to_digit(string)
numbers = {'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}

  numbers.keys.each do |word|
    string.gsub!(/\b#{word}\b/, numbers[word])
  end
string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') 