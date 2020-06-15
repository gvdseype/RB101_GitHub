def make_array!(input)
  array = input.split('')
  array
end

def count_cases!(input)
  hash_counts = {"uppercase" => 0, "lowercase" => 0, "neither" => 0}
  make_array!(input).each do |sign|
    if (/[A-Z]/).match(sign)
      hash_counts["uppercase"] += 1
    elsif (/[a-z]/).match(sign)
      hash_counts["lowercase"] += 1
    else
      hash_counts["neither"] += 1
    end
  end
  hash_counts
end

def letter_percentage(input)
  final_hash = {}
  count_cases!(input).each do |k, v|
    final_hash[k] = ((v.to_f / make_array!(input).size) * 100).to_i
  end
  p final_hash
end

letter_percentage('abCdef 123')
