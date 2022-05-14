=begin
Program to simulate a tic-tac-toe game with a computer. Computer will
make random choices and the board will be displayed after each set
of moves.
=end

WINNING_OUTCOMES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                    [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

def prompt(message)
  puts "=> #{message}"
end

def joinor(nums, separator=', ', last_separator='or')
  case nums.length
  when 0 then ''
  when 1 then nums.first.to_s
  when 2 then nums.join(" #{last_separator} ")
  else
    str = ''
    nums.each_with_index do |num, index|
      if index < nums.length - 1
        str += num.to_s + separator
      else
        str += "#{last_separator} #{num}"
      end
    end
    str
  end
end

# takes in board hash
# outputs a 3 x 3 tictactoe board
def display_board(board)
  start_key = 1
  end_key = 3
  # output board as string over 5 lines
  loop do
    puts board.fetch_values(start_key, end_key - 1, end_key).join(' | ')
    puts '- + - + -' unless end_key == 9
    start_key += 3
    end_key += 3
    break if end_key > 9
  end
end

def empty_spaces(board)
  board.select { |_, value| value == ' ' }.keys
end

def valid_input?(move)
  move.match(/^[1-9]$/)
end

# takes in a validated user key and current board layout
# outputs whether move interferes with any previous moves
def valid_move?(key, board)
  board[key] == ' '
end

def board_full?(board)
  !board.values.any?(' ')
end

def find_winner(board)
  WINNING_OUTCOMES.each do |arr|
    if arr.all? { |key| board[key] == 'X' }
      return 1
    elsif arr.all? { |key| board[key] == 'O' }
      return 2
    end
  end
  0
end

prompt('Welcome to the Tic Tac Toe game!')
prompt('You will take turns playing with a computer player.')

board = {
  1 => ' ',
  2 => ' ',
  3 => ' ',
  4 => ' ',
  5 => ' ',
  6 => ' ',
  7 => ' ',
  8 => ' ',
  9 => ' '
}
loop do # play again loop
  loop do # main loop
    display_board(board)

    # player move
    key_str = ''
    space_key = 0

    loop do
      prompt('Choose a position to place a piece: ' + joinor(empty_spaces(board)))
      key_str = gets.chomp
      if !valid_input?(key_str)
        prompt("Invalid input. Enter only an integer betwwen 1 and 9.")
        next
      end
      space_key = key_str.to_i

      break if valid_move?(space_key, board)
      prompt('Invalid move. That space has already been played. Try again.')
    end
    board[space_key] = 'X' # add player move to board
    break if board_full?(board) || find_winner(board) > 0

    # computer move - random sampling until an unplayed tile is found
    loop do
      space_key = board.keys.sample
      if board[space_key] == ' '
        board[space_key] = 'O'
        break
      end
    end

    break if board_full?(board) || find_winner(board) > 0
  end

  display_board(board)
  game_status = find_winner(board) # 0 for tie, 1 for player win, 2 for comp win
  if game_status == 0
    prompt("It's a tie!")
  elsif game_status == 1
    prompt('Congratulations, you won!')
  else
    prompt('Sorry, you lost this game.')
  end

  # play again prompts
  prompt('Would you like to play again (y/n): ')
  if gets.chomp.downcase.start_with?('y')
    board.each { |key, _| board[key] = ' ' }
  else
    prompt('Thank you for playing!')
    break
  end
end
