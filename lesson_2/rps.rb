# Rock, Paper, Scissors App
# require "pry"

VALID_CHOICES_RPS = %w(rock paper scissors)
VALID_CHOICES_RPSSL = %w(rock paper scissors spock lizard)
VALID_WINS = {
  rock: %w(scissors lizard),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  spock: %w(scissors rock),
  lizard: %w(spock paper)
}
ABBREVIATIONS = {
  r: 'rock',
  p: 'paper',
  sc: 'scissors',
  sp: 'spock',
  l: 'lizard'
}

def prompt(message)
  puts "=> #{message}"
end

def validate_game_choice(game_choice)
  game_choice.match(/^[12]$/)
end

def validate_player_choice(player, game='1')
  if game == '1'
    VALID_CHOICES_RPS.include?(player)
  else
    VALID_CHOICES_RPSSL.include?(player)
  end
end

def player_win?(player, computer)
  VALID_WINS[player.to_sym].include?(computer)
end

def display_winner(player, computer)
  if player_win?(player, computer)
    prompt "You win! #{player.capitalize} beats #{computer.capitalize}!"
  elsif player == computer
    prompt 'It was a draw!'
  else
    prompt "Sorry you lost. #{computer.capitalize} beats #{player.capitalize}."
  end
end

def display_score(player_wins, computer_wins)
  prompt("The player has #{player_wins} wins.")
  prompt("The computer has #{computer_wins} wins.")
end

# welcome user to game and determine game type
prompt 'Welcome to the Rock, Paper, Scissors App!'
prompt <<-MSG
  Which game would you like to play?
    1 Rock, Paper, Scissors
    2 Rock, Paper, Scissors, Spock
  MSG

# get game choice - either rps or rps + spock and lizard
game = gets.chomp
until validate_game_choice(game)
  prompt 'Invalid input, enter only 1 or 2. Try again:'
  game = gets.chomp
end

player_wins = 0
computer_wins = 0
win_goal = 3
until player_wins == win_goal || computer_wins == win_goal
  # get player choice
  player = ''
  loop do
    if game == '1' # 1 corresponds to rock, paper, scissors
      prompt "Choose one: #{VALID_CHOICES_RPS.join(', ')}"
    else
      prompt "Choose one: #{VALID_CHOICES_RPSSL.join(', ')}"
    end
    player = gets.chomp

    # special case for s due to 'scissors' and 'spock'
    if player == 's' || player == 'S'
      prompt "Please enter either 'sc' for scissors or 'sp' for spock."
      next
    end
    # convert abbreviated choices back to full name choice
    if player.length == 1 || player.length == 2
      player = ABBREVIATIONS[player.downcase.to_sym]
    end

    break if validate_player_choice(player, game)
    if game == '1'
      prompt 'Invalid input. Please enter either rock, paper, or scissors.'
    else
      prompt 'Invalid input. Please enter either r, p, sc, sp, or l'
    end
  end

  # get computer move
  if game == '1'
    computer = VALID_CHOICES_RPS.sample
  else
    computer = VALID_CHOICES_RPSSL.sample
  end

  display_winner(player, computer)
  unless player == computer
    player_win?(player, computer) ? player_wins += 1 : computer_wins += 1
  end

  display_score(player_wins, computer_wins)

  # prompt 'Play again? Enter y to continue: '
  # break unless gets.chomp.downcase.start_with?('y')
end

# prompt final winner message for first to the win goal
if player_wins == win_goal
  prompt("Congratulations! You're th grand champion!")
else
  prompt("Sorry, you lost. The computer won this time.")
end
