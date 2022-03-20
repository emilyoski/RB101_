require 'colorize'

CARD_VALUES = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6,
                7 => 7, 8 => 8, 9 => 9, 10 => 10,
                'Jack' => 10, 'Queen' => 10, 'King' => 10,
                'Ace' => [1, 11] }

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
  total_ace = []

  hand.each do |card|
    if card == 'Ace'
      total_ace << CARD_VALUES[card][1]
    else
      total_ace << CARD_VALUES[card]
    end
  end

  if total_ace.sum.to_i > 21
    CARD_VALUES['Ace'][0]
  else
    CARD_VALUES['Ace'][1]
  end
end

def calculate_score(hand)
  card_values = []
  hand.each do |card|
    if card == 'Ace'
      card_values << determine_ace(hand)
    else
      card_values << CARD_VALUES[card]
    end
  end
  card_values.sum.to_i
end

def hand_busted?(hand)
  if calculate_score(hand) > 21
    return true
  end
  false
end

def determine_winner(ply_hand, dlr_hand)
  if hand_busted?(ply_hand)
    'dealer'
  elsif hand_busted?(dlr_hand)
    'player'
  elsif calculate_score(ply_hand) > calculate_score(dlr_hand)
    'player'
  elsif calculate_score(ply_hand) < calculate_score(dlr_hand)
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
  exit
end

def game_flow_player(ply_hand, dlr_hand, deck)
  loop do
    prompt("Do you want to hit or stay?")
    answer = gets.chomp.downcase

    if answer == 'hit'
      deal_card(ply_hand, deck)
    end

    clear_screen
    display_cards(ply_hand, dlr_hand)
    break if answer == 'stay' || hand_busted?(ply_hand)
  end
end

def game_flow_dealer(ply_hand, dlr_hand, deck)
  loop do
    break if calculate_score(dlr_hand) > 17 || hand_busted?(dlr_hand)
    deal_card(dlr_hand, deck)
    sleep 1.5
    clear_screen
    display_cards(ply_hand, dlr_hand, 'show')
  end
end

clear_screen

prompt("Welcome to the Game of 21!")
card_deck = initialize_deck
player_hand = []
dealer_hand = []

start_game(player_hand, dealer_hand, card_deck)
display_cards(player_hand, dealer_hand)

game_flow_player(player_hand, dealer_hand, card_deck)

if hand_busted?(player_hand)
  clear_screen
  display_cards(player_hand, dealer_hand, 'show')
  display_winner(determine_winner(player_hand, dealer_hand))
end

game_flow_dealer(player_hand, dealer_hand, card_deck)

clear_screen
display_cards(player_hand, dealer_hand, 'show')
display_winner(determine_winner(player_hand, dealer_hand))
