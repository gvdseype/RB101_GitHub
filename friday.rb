require 'time'
def friday(input)
  count = 0
  1.upto(12) do |n|
    if Time.new(input, n, 13).friday? == true
      count += 1
    end
  end
  p count
end

friday(2019)