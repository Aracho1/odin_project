class Board
  @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']

  def display_board(@board)
    puts row = ["  " "|" "   " "|" "   "]
end

board = Board.new
board.init_board
