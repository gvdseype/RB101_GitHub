require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'


def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts 
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = ' '}
  new_board
end

def empty_squares(brd)
  brd.keys.select {|num| brd[num] == ' '}
end

def joinor(array, delimiter, finalizer='or')
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join( " #{finalizer} ")
  else
    array[-1] = "#{finalizer} #{array.last}"
    array.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do 
    prompt "Choose a posotion to place a piece: #{joinor(empty_squares(brd), ", ")}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "sorry, thats not a valid choice."
  end
  brd[square] = 'X'
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
       return "PLAYER"
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
        return "COMPUTER"
    end
  end
  nil 
end

player_count = 0
computer_count = 0
loop do 
  board = initialize_board

  loop do 
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end


  if someone_won?(board)
    display_board(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == "PLAYER"
      player_count += 1
    elsif detect_winner(board) == "COMPUTER"
      computer_count += 1
    end
  else
    display_board(board)
    prompt "It's a tie!"
  end
    
    puts "The player count is: #{player_count}. | The computer count is: #{computer_count}
    First one to 5 has won the game, Mr. Anderson."
    if player_count == 5 
      puts "Well played, Mr. Anderson."
      break
    elsif computer_count == 5
      puts "Computer wins"
      break
    end

    prompt "Play again? (y or n)"
    answer = gets.chomp
    break if answer.downcase.start_with?('n') 
end

