=begin
Program to simulate a tic-tac-toe game with a computer. Computer will
make random choices and the board will be displayed after each set
of moves.
=end

def prompt(message)
  puts "=> #{message}"
end

# takes in a 3 x 3 nested array of strings of '0', '1', or '2'
# outputs a 3 x 3 tictactoe board
def display_board(board)
  # convert '0' to empty space, '1' to an 'X', and '2' to an 'O'
  converted_board = board.map do |row|
    row.map do |num|
      converted_num = case num
                      when '1' then 'X'
                      when '2' then 'O'
                      else ' '
                      end
      converted_num
    end
  end

  # output board as string over 5 lines
  converted_board.each_with_index do |row, index|
    p row.join(' | ')
    p '- + - + -' unless index == board.length - 1
  end
end

def valid_input?(move)
  move.match(/^[123]$/)
end

# takes in a validated user index passed in as a 2 element array of
# integers, and current board layout
# outputs whether move interferes with any previous moves
def valid_move?(index, board)
  row = index[0]
  col = index[1]
  board[row][col] == '0'
end

prompt('Welcome to the Tic Tac Toe game!')
prompt('You will take turns playing with a computer player.')

board = [['0', '0', '0'], ['0', '0', '0'], ['0', '0' ,'0']]
loop do # main loop
  display_board(board)

  # player move
  row_str = ''
  col_str = ''
  row = nil
  col = nil

  loop do
    # row of player move
    prompt('Enter the row number for your next move (1, 2, or 3): ')
    row_str = gets.chomp
    if !valid_input?(row_str)
      prompt("Invalid input. Enter only '1', '2', or '3'.")
      next
    end
    
    # col of player move
    loop do
      prompt('Enter the column number for your next move (1, 2, or 3): ')
      col_str = gets.chomp
      break if valid_input?(col_str)
      prompt("Invalid input. Enter only '1', '2', or '3'.")
    end

    row = row_str.to_i - 1
    col = col_str.to_i - 1
    break if valid_move?([row, col], board)
    prompt('Invalid move. That space has already been played. Try again.')
  end
  
  board[row][col] = '1' # add player move to board
end
