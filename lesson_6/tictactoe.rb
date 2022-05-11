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
  converted_board.each do |row|
    p row.join(' | ')
    p '- + - + -' unless converted_board.index(row) == board.length - 1
  end
end

def valid_input?(move)
  move.match(/^[012]$/)
end

# takes in a validated user string index passed in as a 2 element array,
# and current board layout
# outputs whether move interferes with any previous moves
def valid_move?(index, board)
  row = index[0].to_i - 1
  col = index[1].to_i - 1
  board[row][col] == '0'
end

board = [['0', '0', '0'], ['1', '2', '0'], ['1', '2', '0']]

