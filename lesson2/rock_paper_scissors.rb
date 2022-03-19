VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

winning_combos = { rock: ['lizard', 'scissors'],
                   paper: ['rock', 'spock'],
                   scissors: ['paper', 'lizard'],
                   spock: ['scissors', 'rock'],
                   lizard: ['paper', 'spock'] }

def win?(first, second, winning_methods)
  answer = first.to_sym
  winning_results = winning_methods[answer]
  winning_results.include?(second)
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer, win_methods)
  if win?(player, computer, win_methods)
    puts "You won!"
  elsif win?(computer, player, win_methods)
    puts "Computer won!"
  else
    puts "It's a tie!"
  end
end

def display_game_winner(play_wins, comp_wins)
  if play_wins == 3
    prompt("You are the MASTER of the game!")
  elsif comp_wins == 3
    prompt("The computer is the MASTER of the game!")
  end
end

loop do
  player_wins = 0
  computer_wins = 0

  loop do
    choice = ' '
    loop do
      prompt("Enter the first letter of your move: #{VALID_CHOICES.join(', ')}")
      choice_letter = Kernel.gets().chomp().downcase

      if choice_letter == 's'
        prompt("Did you mean scissors or spock?")
        choice = Kernel.gets().chomp().downcase
      elsif choice_letter == 'r'
        choice = 'rock'
      elsif choice_letter == 'p'
        choice = 'paper'
      elsif choice_letter == 'l'
        choice = 'lizard'
      end

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

    display_results(choice, computer_choice, winning_combos)

    player_won = false
    computer_won = false

    player_won = true if win?(choice, computer_choice, winning_combos)
    computer_won = true if win?(computer_choice, choice, winning_combos)

    if player_won
      player_wins += 1
    elsif computer_won
      computer_wins += 1
    end

    display_game_winner(player_wins, computer_wins)

    break if player_wins == 3
    break if computer_wins == 3
  end

  prompt("Do you want to play again?")
  repeat_play = gets.chomp.downcase
  break if repeat_play == 'no'
end

prompt("Thank you for playing, Good bye!")
