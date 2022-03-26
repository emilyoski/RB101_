require 'colorize'

# constants for game play
# ---------------------------------------------------

CARD_VALUES = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6,
                7 => 7, 8 => 8, 9 => 9, 10 => 10,
                'Jack' => 10, 'Queen' => 10, 'King' => 10,
                'Ace' => [1, 11] }

SUITS = ['Spades', 'Diamonds', 'Hearts', 'Clubs']

WINNING_VALUE = 21

# Methods for formatting/display
# ---------------------------------------------------

def prompt(msg)
  puts ">>> #{msg}".cyan
end

def clear_screen
  system 'clear'
end

def list(hand)
  cards_in_hand = hand.map do |card|
    card[0].to_s + " of " + card[1]
  end
  cards_in_hand.join(', ')
end

def display_cards(ply_hand, deal_hand, display = 'hide')
  if display == 'hide'
    prompt "Dealer has:
            #{deal_hand[0][0]} of #{deal_hand[0][1]} and unknown card."
    prompt "You have:
            #{list(ply_hand)} for a total of #{calculate_score(ply_hand)}"
  elsif display == 'show'
    prompt "Dealer has:
            #{list(deal_hand)} for a total of #{calculate_score(deal_hand)}."
    prompt "You have:
            #{list(ply_hand)} for a total of #{calculate_score(ply_hand)}."
  end
end

def display_winner(winner)
  case winner
  when 'dealer' then prompt("Dealer won!")
  when 'player' then prompt("Player won!")
  when 'tie' then prompt("It's a tie!")
  end
end

def display_score(scores)
  puts "==============SCOREBOARD===============".colorize(:red)
  prompt("Player: #{scores[0]}")
  prompt("Dealer: #{scores[1]}")
  puts "=======================================".colorize(:red)
end

def drumroll
  puts "***************************************".colorize(:red)
  puts "**************  drum roll  ************".colorize(:red)
  sleep 2
end

def display_grand_winner(score)
  if score[0] == 5
    prompt("Player is the GRAND WINNER with a score of 5!")
  elsif score[1] == 5
    prompt("Dealer is the GRAND WINNER with a score of 5!")
  elsif score[0] > score[1]
    prompt("Player is the winner...by not the GRAND winner.")
  elsif score[1] > score[0]
    prompt("Dealer is the winner..by not the GRAND winner.")
  else
    prompt("Looks like we have a tie!")
  end
end

# methods for game play
# ---------------------------------------------------

def initialize_deck
  deck = []
  (2..10).each do |num|
    SUITS.each do |suit|
      deck << [num, suit]
    end
  end
  ['Jack', 'Queen', 'King', 'Ace'].each do |word|
    SUITS.each do |suit|
      deck << [word, suit]
    end
  end
  deck
end

def deal_card(hand, deck)
  deck.shuffle!
  card = deck.shift
  hand << card
end

def start_game(ply_hand, dlr_hand, deck)
  deal_card(ply_hand, deck)
  deal_card(dlr_hand, deck)
  deal_card(ply_hand, deck)
  deal_card(dlr_hand, deck)
end

def player_turn(ply_hand, dlr_hand, deck)
  loop do
    prompt("Do you want to hit(h) or stay(s)?")
    answer = gets.chomp.downcase
    next if invalid_move?(answer)

    if answer.start_with?('h')
      deal_card(ply_hand, deck)
    end

    ply_total = calculate_score(ply_hand)

    clear_screen
    display_cards(ply_hand, dlr_hand)
    break if answer.start_with?('s') || hand_busted?(ply_total)
  end
end

def dealer_turn(ply_hand, dlr_hand, deck)
  loop do
    dealer_total = calculate_score(dlr_hand)
    break if dealer_total > (WINNING_VALUE - 4) || hand_busted?(dealer_total)
    deal_card(dlr_hand, deck)
    sleep 1.5
    clear_screen
    display_cards(ply_hand, dlr_hand, 'show')
  end
end

def invalid_move?(ans)
  if ans.start_with?('h') || ans.start_with?('s')
    false
  else
    prompt("That doesn't seem right...")
    true
  end
end

# methods for scoring
# ---------------------------------------------------

def determine_ace(hand)
  total_ace = hand.map do |card|
    if card[0] == 'Ace'
      CARD_VALUES[card[0]][1]
    else
      CARD_VALUES[card[0]]
    end
  end

  if total_ace.sum.to_i > WINNING_VALUE
    CARD_VALUES['Ace'][0]
  else
    CARD_VALUES['Ace'][1]
  end
end

def calculate_score(hand)
  card_values = hand.map do |card|
    if card[0] == 'Ace'
      determine_ace(hand)
    else
      CARD_VALUES[card[0]]
    end
  end
  card_values.sum.to_i
end

def increment_score(winner, scores)
  if winner == 'player'
    scores[0] = 1 + scores[0]
  elsif winner == 'dealer'
    scores[1] = 1 + scores[1]
  end
end

# methods for winning
# ---------------------------------------------------

def hand_busted?(hand_total)
  if hand_total > WINNING_VALUE
    return true
  end
  false
end

def determine_winner(ply_total, dlr_total)
  if hand_busted?(ply_total)
    'dealer'
  elsif hand_busted?(dlr_total)
    'player'
  elsif ply_total > dlr_total
    'player'
  elsif ply_total < dlr_total
    'dealer'
  else
    'tie'
  end
end

# methods for end of game
# ---------------------------------------------------

def end_of_game(ply_hand, dlr_hand, ply_total, dlr_total, scores)
  clear_screen
  display_cards(ply_hand, dlr_hand, 'show')
  display_winner(determine_winner(ply_total, dlr_total))
  increment_score(determine_winner(ply_total, dlr_total), scores)
  display_score(scores)
end

def next_game?(score)
  return true if score[0] == 5
  return true if score[1] == 5

  prompt("Do you want to play again? (yes(y) or no(n))")
  answer = gets.chomp.downcase
  return true if answer.start_with?('n')
end

# main loop for game
# ---------------------------------------------------

scoreboard = [0, 0]

loop do
  clear_screen

  prompt("Welcome to the Game of #{WINNING_VALUE}!")
  card_deck = initialize_deck
  player_hand = []
  dealer_hand = []

  start_game(player_hand, dealer_hand, card_deck)
  display_cards(player_hand, dealer_hand)

  player_turn(player_hand, dealer_hand, card_deck)

  player_total = calculate_score(player_hand)
  dealer_total = calculate_score(dealer_hand)

  if hand_busted?(player_total)
    end_of_game(player_hand, dealer_hand, player_total,
                dealer_total, scoreboard)
    break if next_game?(scoreboard)
    next
  end

  dealer_turn(player_hand, dealer_hand, card_deck)

  player_total = calculate_score(player_hand)
  dealer_total = calculate_score(dealer_hand)

  clear_screen
  end_of_game(player_hand, dealer_hand, player_total,
              dealer_total, scoreboard)
  break if next_game?(scoreboard)
end

drumroll
display_grand_winner(scoreboard)
prompt("Thank you for playing the Game of #{WINNING_VALUE}!")
