def toggle(input)
  input == 'on' ? input = 'off' : input = 'on'
end

def toggle_through_hash(hsh, indx)
  hsh.keys.each do |key|
    if key % indx == 0
      hsh[key] = toggle(hsh[key])
    end
  end
  hsh
end

def make_hash(n)
  hash = {}
  n.times do |t|
    hash[t + 1] = "off"
  end
  hash
end

def change_hash(n)
  hash = make_hash(n)
  n.times do |i|
    toggle_through_hash(hash, i + 1)
  end
  hash
end

def select_lights(n)
  array = []
  change_hash(n).select { |k, v| array << k if v == 'on' }
  array
end

p select_lights(100)
