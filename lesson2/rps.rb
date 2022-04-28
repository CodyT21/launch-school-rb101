# Rock, Paper, Scissors App
# require "pry"

VALID_CHOICES = %w(rock paper scissors)
VALID_WINS = {
  rock: 'scissors',
  paper: 'rock',
  scissors: 'paper'
}

def prompt(message)
  puts "=> #{message}"
end

def validate_choice(choice)
  VALID_CHOICES.include?(choice.downcase)
end

def display_winner(player, computer)
  if player == computer
    prompt 'It was a draw!'
  elsif VALID_WINS[player.to_sym] == computer
    prompt "You win! #{player.capitalize} beats #{computer.capitalize}!"
  else
    prompt "Sorry you lost. #{computer.capitalize} beats #{player.capitalize}."
  end
end

# welcome user to game
prompt 'Welcome to the Rock, Paper, Scissors App!'

loop do
  # get player choice
  player_choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    player_choice = gets.chomp
    break if validate_choice(player_choice)
    prompt 'Invalid input. Please enter either rock, paper, or scissors.'
  end

  # get computer move
  computer_choice = VALID_CHOICES.sample

  display_winner(player_choice, computer_choice)

  prompt 'Play again? Enter y to continue: '
  break unless gets.chomp.downcase.start_with?('y')
end
