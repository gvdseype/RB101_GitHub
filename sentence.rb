# 1 scan through the text and look for the first sentence. 
# 2 put sentence in a temporary string. provide the size of the sentence in a temporary total
# 3 find the next sentence and compare its size with the temporary total
# 4 do this until 

sentence = File.read('frankenstein.txt').strip!

# is a sentence: first word is capital and has either a space and dot in front of it or nothing in front of it (first sentence), 
#last word has a dot after it. 

def text_to_array(string)
  delimiters = ['.', '!', '?']
  array = string.split(/\.|\?|\!/)
  array
end

def select_longest_sentence(input)
  total = 0
  largest_count = 0
  largest_sentence = nil
  array = text_to_array(input)
  array.each do |sentence_line|
    if sentence_line.split(' ').count > largest_count
      largest_count = sentence_line.split(' ').count
      largest_sentence = sentence_line.tr("\n", " ")
    end
  end
  p largest_sentence
  p largest_count
end

select_longest_sentence(sentence)