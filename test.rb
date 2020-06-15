def prompt(msg)
  puts "=> #{msg}"
end

def pick_card(dck, cards, aces)
  card = dck[(rand(0..dck.size))]
  if card == 'Ace'
    aces << 1
  elsif card == 'Jack' || card == 'Queen' || card == 'King'
    cards << 10
  elsif card
    cards << card
  end
card
end

def turn(dck, card)
  dck.delete_at(dck.index(card))
end

def calculate_total(cards, aces)
  sum_cards = cards.sum
  index = 0
  value_aces = 0
    loop do
      if sum_cards + (value_aces + 11) > 21 && aces[index] == 1
        value_aces += 1
      elsif sum_cards + (value_aces + 11) <= 21 && aces[index] == 1
        value_aces += 11
      else
        value_aces += 0
      end
      index += 1
    break if index == aces.size
    end
  total = sum_cards + value_aces
  total
end

def busted?(score)
  if score > 21
    true
  else
    false
  end
end

def blackjack?(score)
  if score > 21
    true
  elsif score
    false
  end
end

loop do
  deck = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 
10, 10, 10, 10, 'Jack', 'Jack', 'Jack', 'Jack', 'Queen', 'Queen', 'Queen', 'Queen', 'King', 'King', 'King', 'King', 
'Ace', 'Ace', 'Ace', 'Ace']

player_cards = [0]
player_aces = [0]
total_player = 0
dealer_cards = [0]
dealer_aces = [0]
total_dealer = 0
prompt "Welcome to Casino Royale"
prompt "Player has drawn #{turn(deck, pick_card(deck, player_cards, player_aces))} and #{turn(deck, pick_card(deck, player_cards, player_aces))}"
total_player = calculate_total(player_cards, player_aces)
prompt "Total value of #{total_player}"
hidden_card = turn(deck, pick_card(deck, dealer_cards, dealer_aces))
visible_card = turn(deck, pick_card(deck, dealer_cards, dealer_aces))
prompt "Dealer drawed #{visible_card} and a hidden card"
total_dealer = calculate_total(dealer_cards, dealer_aces)

answer = nil
  loop do
    prompt "Hit or stay? (type 'hit' or 'stay)"
    answer = gets.chomp.downcase
    break if answer.include?('s')
    prompt "Player has drawn #{turn(deck, pick_card(deck, player_cards, player_aces))}"
    total_player = calculate_total(player_cards, player_aces)
    prompt "Total value of #{total_player}"
    break if busted?(total_player) == true
  end

if busted?(total_player) == true
  prompt "Player has #{total_player}, player lost"
else
  prompt "You chose to STAY!"
  prompt "The dealer's hidden card is #{hidden_card}, the dealer's total value is #{total_dealer}"
  if total_dealer < 17
    loop do
      prompt "Dealer has picked #{turn(deck, pick_card(deck, dealer_cards, dealer_aces))}"
      total_dealer = calculate_total(dealer_cards, dealer_aces)
      prompt "Dealer score is #{total_dealer}"
      break if total_dealer >= 17
      end
    if busted?(total_dealer)
      prompt "Player wins" 
    elsif total_player > total_dealer
      prompt "Player has a higher score than dealer, player wins"
    elsif total_player == total_dealer
      prompt "Player score and dealer score are equal. Deuce"
    elsif total_dealer > total_player
      prompt "Dealer has a higher score than player. Dealer wins"
    end
  elsif total_dealer >= 17
    if total_player > total_dealer
      prompt "Player has a higher score than dealer, player wins"
    elsif total_player == total_dealer
      prompt "Player score and dealer score are equal. Deuce"
    elsif total_dealer > total_player
      prompt "Dealer has a higher score than player. Dealer wins"
    end
  end
end

prompt "Would you like to play again? ('yes'/'no')"
final_answer = gets.chomp.downcase
break if final_answer.include?('n')
end