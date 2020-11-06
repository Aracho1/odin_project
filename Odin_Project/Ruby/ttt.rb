# Build a tic-tac-toe game

class Game
  def initialize
    @board = [["_", "_", "_"],["_","_","_"],["_","_","_"]]
    run_game
  end

  def start_game
    puts "Let's play tic-tac-toe!"
    display_board
  end

  def display_board
    @board.each{ |row| puts row.join("") }
  end

  def add(player)
    puts "Player #{player}'s turn!"
    puts "Mark your next move (row,column)"
    row, column = gets.split(",").map(&:to_i)
    if @board[row][column] == "_"
      @board[row][column] = player
      display_board
    else
      puts "Invalid!"
      add(player)
    end
  end

  def turn(player)
    player == "X" ? "O" : "X"
  end

  def check_space
    @board.flatten.include?("_")
  end

  def end_game
    puts "End of the game!"
    exit
  end

  def check_score
    if @board[0].flatten.join("").include?("OOO") ||
      @board[1].flatten.join("").include?("OOO") ||
      @board[2].flatten.join("").include?("OOO") ||
      @board.transpose[0].flatten.join("").include?("OOO") ||
      @board.transpose[1].flatten.join("").include?("OOO") ||
      @board.transpose[2].flatten.join("").include?("OOO") ||
      @board[0][0] == "O" && @board[1][1] == "O" && @board[2][2] == "O" ||
      @board[0][2] == "O" && @board[1][1] == "O" && @board[2][0] == "O"
      puts "Player O wins!"
      end_game
    elsif @board[0].flatten.join("").include?("XXX") ||
      @board[1].flatten.join("").include?("XXX") ||
      @board[2].flatten.join("").include?("XXX") ||
      @board.transpose[0].flatten.join("").include?("XXX") ||
      @board.transpose[1].flatten.join("").include?("XXX") ||
      @board.transpose[2].flatten.join("").include?("XXX") ||
      @board[0][0] == "X" && @board[1][1] == "X" && @board[2][2] == "X" ||
      @board[0][2] == "X" && @board[1][1] == "X" && @board[2][0] == "X"
      puts "Player X wins!"
      end_game
    else
    end
  end

  def run_game
    start_game
    player = "X"
    while check_score == nil
      while check_space == true
        player = turn(player)
        add(player)
        check_score
        end_game if check_space == false
      end
    end
  end

end

new_game = Game.new
