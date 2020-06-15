# total = 10

hash = {"one" => 1, "two" => 2}
new_hash = {}
hash.each do |k, v|
  hash[k] = (v.to_f / 2).to_f.round(2)
end
p hash