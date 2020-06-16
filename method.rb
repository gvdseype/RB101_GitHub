
def nb_year(base, population_increase, new_habitants, end_year)
  population_increase = population_increase / 100
  index = 0
  loop do
    index += 1
    base += (base * (population_increase)) + new_habitants
    break if base >= end_year
    end
  p index
end

nb_year(1500, 5, 100, 5000)
