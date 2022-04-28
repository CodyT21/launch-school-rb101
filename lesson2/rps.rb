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

def prompt(message)
  puts "=> #{message}"
end

def validate_game_choice(game_choice)
  game_choice.match(/^[12]$/)
end

def validate_player_choice(player_choice, game_type='1')
  if game_type == '1'
    VALID_CHOICES_RPS.include?(player_choice.downcase)
  else
    VALID_CHOICES_RPSSL.include?(player_choice.downcase)
  end
end

def display_winner(player, computer)
  if player == computer
    prompt 'It was a draw!'
  elsif VALID_WINS[player.to_sym].include?(computer)
    prompt "You win! #{player.capitalize} beats #{computer.capitalize}!"
  else
    prompt "Sorry you lost. #{computer.capitalize} beats #{player.capitalize}."
  end
end

# welcome user to game and determine game type
prompt 'Welcome to the Rock, Paper, Scissors App!\n'
prompt <<-MSG
  Which game would you like to play?
    1 Rock, Paper, Scissors
    2 Rock, Paper, Scissors, Spock
  MSG

game_choice = gets.chomp
until validate_game_choice(game_choice)
  prompt 'Invalid input, enter only 1 or 2. Try again:'
  game_choice = gets.chomp
end

loop do
  # get player choice
  player_choice = ''
  loop do
    if game_choice == '1' # 1 corresponds to rock, paper, scissors
      prompt "Choose one: #{VALID_CHOICES_RPS.join(', ')}"
    else
      prompt "Choose one: #{VALID_CHOICES_RPSSL.join(', ')}"
    end
    player_choice = gets.chomp
    break if validate_player_choice(player_choice, game_choice)
    if game_choice == '1'
      prompt 'Invalid input. Please enter either rock, paper, or scissors.'
    else
      prompt 'Invalid input. Please enter either r, p, sc, sp, or l'
    end
  end

  # get computer move
  if game_choice == '1'
    computer_choice = VALID_CHOICES_RPS.sample
  else
    computer_choice = VALID_CHOICES_RPSSL.sample
  end

  display_winner(player_choice, computer_choice)

  prompt 'Play again? Enter y to continue: '
  break unless gets.chomp.downcase.start_with?('y')
end
