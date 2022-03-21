require 'colorize'
require 'pry'

CARD_VALUES = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6,
                7 => 7, 8 => 8, 9 => 9, 10 => 10,
                'Jack' => 10, 'Queen' => 10, 'King' => 10,
                'Ace' => [1, 11] }

WINNING_VALUE = 21

def prompt(msg)
  puts ">>> #{msg}".cyan
end

def clear_screen
  system 'clear'
end

def initialize_deck
  deck = []
  4.times { (2..10).each { |num| deck << num } }
  4.times { ['Jack', 'Queen', 'King', 'Ace'].each { |word| deck << word } }
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

def joinor(options, delimit = ', ', join_word = 'and')
  if options.size < 3
    options[0].to_s + " #{join_word} " + options[1].to_s
  else
    options.join(delimit)
  end
end

def display_cards(ply_hand, deal_hand, display = 'hide')
  if display == 'hide'
    prompt "Dealer has: #{deal_hand[0]} and unknown card."
    prompt "You have: #{joinor(ply_hand)}"
  elsif display == 'show'
    prompt "Dealer has: #{joinor(deal_hand)}."
    prompt "You have: #{joinor(ply_hand)}."
  end
end

def determine_ace(hand)
  total_ace = hand.map do |card|
    if card == 'Ace'
      CARD_VALUES[card][1]
    else
      CARD_VALUES[card]
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
    if card == 'Ace'
      determine_ace(hand)
    else
      CARD_VALUES[card]
    end
  end
  card_values.sum.to_i
end

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

def display_winner(winner)
  case winner
  when 'dealer' then prompt("Dealer won!")
  when 'player' then prompt("Player won!")
  when 'tie' then prompt("It's a tie!")
  end
end

def increment_score(winner, scores)
  if winner == 'player'
    scores[0] = 1 + scores[0]
  elsif winner == 'dealer'
    scores[1] = 1 + scores[1]
  end
end

def display_score(scores)
  puts "==============SCOREBOARD===============".colorize(:red)
  prompt("Player: #{scores[0]}")
  prompt("Dealer: #{scores[1]}")
  puts "=======================================".colorize(:red)
end

def end_of_game(ply_hand, dlr_hand, ply_total, dlr_total, scores)
  clear_screen
  display_cards(ply_hand, dlr_hand, 'show')
  display_winner(determine_winner(ply_total, dlr_total))
  increment_score(determine_winner(ply_total, dlr_total), scores)
  display_score(scores)
end

def next_game?(scoreboard)
  return true if scoreboard[0] == 5
  return true if scoreboard[1] == 5

  prompt("Do you want to play again? (yes or no)")
  answer = gets.chomp.downcase
  return true if answer.start_with?('n')
end

def drumroll
  puts "***************************************".colorize(:red)
  puts "**************  drum roll  ************".colorize(:red)
  sleep 2
end

def display_grand_winner(scoreboard)
  if scoreboard[0] == 5
    prompt("Player is the GRAND WINNER with a score of 5!")
  elsif scoreboard[1] == 5
    prompt("Dealer is the GRAND WINNER with a score of 5!")
  elsif scoreboard[0] > scoreboard[1]
    prompt("Player is the winner...by not the GRAND winner.")
  elsif scoreboard[1] > scoreboard[0]
    prompt("Dealer is the winner..by not the GRAND winner.")
  else
    prompt("Looks like we have a tie!")
  end
end

player_dealer_scoreboard = [0, 0]

loop do
  clear_screen

  prompt("Welcome to the Game of #{WINNING_VALUE}!")
  card_deck = initialize_deck
  player_hand = []
  dealer_hand = []
  player_total = 0
  dealer_total = 0

  start_game(player_hand, dealer_hand, card_deck)
  display_cards(player_hand, dealer_hand)

  loop do
    prompt("Do you want to hit or stay?")
    answer = gets.chomp.downcase

    if answer == 'hit'
      deal_card(player_hand, card_deck)
    end

    player_total = calculate_score(player_hand)

    clear_screen
    display_cards(player_hand, dealer_hand)
    break if answer == 'stay' || hand_busted?(player_total)
  end

  dealer_total = calculate_score(dealer_hand)

  if hand_busted?(player_total)
    end_of_game(player_hand, dealer_hand, player_total,
                dealer_total, player_dealer_scoreboard)
    break if next_game?(player_dealer_scoreboard)
    next
  end

  loop do
    dealer_total = calculate_score(dealer_hand)
    break if dealer_total > (WINNING_VALUE - 4) || hand_busted?(dealer_total)
    deal_card(dealer_hand, card_deck)
    sleep 1.5
    clear_screen
    display_cards(player_hand, dealer_hand, 'show')
  end

  clear_screen
  end_of_game(player_hand, dealer_hand, player_total,
              dealer_total, player_dealer_scoreboard)
  break if next_game?(player_dealer_scoreboard)
end

drumroll
display_grand_winner(player_dealer_scoreboard)
prompt("Thank you for playing the Game of #{WINNING_VALUE}!")
