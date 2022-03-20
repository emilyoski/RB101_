WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(options, delimit = ', ', join_word = 'or')
  if options.size < 2
    options[0]
  elsif options.size < 3
    options[0].to_s + " #{join_word} " + options[1].to_s
  else
    options[-1] = join_word << " #{options[-1]}"
    options.map! do |num|
      num.to_s
    end
    options.join(delimit)
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "Youre a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_defense(brd)
  WINNING_LINES.each do |line|
    current_brd = []
    current_brd << brd[line[0]]
    current_brd << brd[line[1]]
    current_brd << brd[line[2]]
    if current_brd.count(PLAYER_MARKER) == 2 &&
       current_brd.count(INITIAL_MARKER) == 1
      return line
    end
  end
  false
end

def computer_offense(brd)
  WINNING_LINES.each do |line|
    current_brd = []
    current_brd << brd[line[0]]
    current_brd << brd[line[1]]
    current_brd << brd[line[2]]
    if current_brd.count(COMPUTER_MARKER) == 2 &&
       current_brd.count(INITIAL_MARKER) == 1
      return line
    end
  end
  false
end

def find_the_move(brd, line)
  move = line[0] if brd[line[0]] == ' '
  move = line[1] if brd[line[1]] == ' '
  move = line[2] if brd[line[2]] == ' '
  move
end

def computer_places_piece!(brd)
  if computer_offense(brd)
    chosen_line = computer_offense(brd)
    square = find_the_move(brd, chosen_line)
  elsif computer_defense(brd)
    chosen_line = computer_defense(brd)
    square = find_the_move(brd, chosen_line)
  elsif brd[5] == INITIAL_MARKER
    square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def increment_score(brd, scores)
  if detect_winner(brd) == 'Player'
    scores[0] = scores[0] + 1
  elsif detect_winner(brd) == 'Computer'
    scores[1] = scores[1] + 1
  end
end

def overall_winner(scoreboard)
  return true if scoreboard[0] == 5
  return true if scoreboard[1] == 5
  nil
end

def place_piece!(brd, player)
  if player == 'player'
    player_places_piece!(brd)
  elsif player == 'computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  if player == 'player'
    'computer'
  elsif player == 'computer'
    'player'
  end
end

def display_winner(winner, brd)
  if winner
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "It's a tie!"
  end
end

def decide_first_move
  prompt "Do you want to decide who goes? (yes or no)"
  first_move_decide = gets.chomp.downcase

  if first_move_decide.start_with?('n')
    ['player', 'computer'].sample
  else
    prompt "Who should go first? Player or Computer?"
    gets.chomp.downcase
  end
end

def display_score(scoreboard)
  prompt "Current Score is.....*drum roll*"
  prompt "Player: #{scoreboard[0]}."
  prompt "Computer: #{scoreboard[1]}."
end

player_computer_score = [0, 0]

loop do
  board = initialize_board

  first_turn = decide_first_move
  current_player = first_turn

  if first_turn == 'player'
    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end
  elsif first_turn == 'computer'
    loop do
      place_piece!(board, current_player)
      display_board(board)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end
  else
    prompt "Okay so no one is playing this game!"
  end

  display_board(board)
  display_winner(detect_winner(board), board)

  increment_score(board, player_computer_score)
  display_score(player_computer_score)

  break if overall_winner(player_computer_score)

  prompt "Play again? (yes or no)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
