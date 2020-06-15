HASH = {1 => ["B", "O"], 2 => ["G", "T"], 3 => ["V", "I"], 4 => ["X", "K"], 5 => ["R", "E"], 6 => ["L", "Y"], 7 => ["D", "Q"], 8 => ["F", "S"], 9 => ["Z", "M"], 10 => ["C", "P"], 11 => ["J", "W"], 12 => ["N", "A"], 13 => ["H", "U"]}

def make_array(string)
array = string.split("")
array
end

def check_matches!(example_string, hash_example)
count_array = []
  make_array(example_string).each do |letter|
      hash_example.each do |k, subarray|
          subarray.each do |blockletter|
              if blockletter == letter 
                  count_array << k 
              else
              end
          end
      end
  end
count_array
end

def block_word?(word)
  if check_matches!(word, HASH).uniq.length < check_matches!(word, HASH).length
      puts "false"
  else 
      puts "true"
  end
end

block_word?("BUTCH")