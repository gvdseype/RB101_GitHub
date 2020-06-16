def can_be_integer?(input)
  (input).to_i.to_s == input
end

def friend(friends)
  new_array = []
  new_array = friends.map do |element|
    case element
    when can_be_integer?(element) == true
      friends.delete(element)
    when element.split().size > 4
      friends.delete(element)
    else 
      element
    end
  end
  p new_array
end


friend(["Ryan", "Jimmy", "123", "4", "Cool Man"])