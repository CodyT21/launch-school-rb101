# Rock, Paper, Scissors App
# require "pry"

VALID_CHOICES = ['rock', 'paper', 'scissors']
VALID_OUTCOMES = {
  'rock' => {
    'rock' => 0,
    'paper' => -1,
    'scissors' => 1
  },
  'paper' => {
    'rock' => 1,
    'paper' => 0,
    'scissors' => -1
  },
  'scissors' => {
    'rock' => -1,
    'paper' => 1,
    'scissors' => 0
  }
}

def prompt(message)
  puts "=> #{message}"
end

def validate_choice(choice)
  VALID_CHOICES.include?(choice.downcase)
end

def display_winner(player, computer)
  # 1 indicates player wins
  # 0 indicates a tie
  # -1 indicates player lost

  if VALID_OUTCOMES[player][computer] == 0
    prompt 'It was a draw!'
  elsif VALID_OUTCOMES[player][computer] == 1
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
