
require 'yaml'

class Hangman
  attr_accessor :counter, :secret_word, :guess, :counter, :wrong_guesses, :display_answer

  def initialize(text_file)
    @dictionary = File.open(text_file).readlines.map(&:chomp)
    @wrong_guesses = []
    @secret_word = choose_word
    @counter = 12
    @display_answer = "_" * @secret_word.length


  end

  def choose_word
    @dictionary.select{|word| 5 <= word.length && word.length <= 12}.sample.downcase
  end

  def game_menu
    puts 'clear'
    puts 'Welcome to Hangman'
    puts '(1) New game'
    puts '(2) Load a saved game'
    option = gets.chomp
    load_game if option == '2'
    new_game
  end


  def new_game
    @display_answer

    while @counter > 0
      puts "#{@counter} guesses left"
      puts "#{@display_answer} (#{@secret_word.length} letters)"

      @guess = gets.chomp.downcase

      if @guess == "save"
        save
      end

      if @secret_word.include?(@guess)
        @secret_word.chars.each_with_index do |val, index|
          if val == @guess
            @display_answer[index] = val
          end
        end
      else
        @wrong_guesses << guess
      end

      if guess == @secret_word || @display_answer == @secret_word
        puts "Well done! You've craked the word!"
        exit
      end

      @counter -= 1
      if @counter == 0
        puts "Sorry! You've run out of the guesses! The correct word was '#{@secret_word}'."
        exit
      end
      puts "Wrong guesses so far: #{@wrong_guesses.join(", ") if @wrong_guesses.length > 0}"
    end
  end

  def save
    puts "Saving the current game..."
    sleep 1
    Dir.mkdir("saved_games") unless Dir.exist? "saved_games"
    puts "Enter the name of your saved file"
    save_file = gets.chomp
    filename = "saved_games/#{save_file}.yml"
    File.open(filename, 'w') do |file|
      YAML.dump([]<< self, file)
    end
    puts "Successfully saved the game. Exiting the game..."
    sleep 1
    exit
  end

  def load_game
    unless Dir.exist?("saved_games")
      puts "No saved games found. Starting new game..."
      sleep 5
      exit
    end
    games = saved_games
    puts games
    deserialize(load_file(games))
  end

  def load_file(games)
    loop do
      puts "Enter which saved_game would you like to load: "
      load_file = gets.chomp
      return load_file if games.include?(load_file)

      puts "The game you requested does not exist."
    end
  end

  def deserialize(load_file)
    yaml = YAML.load_file("./saved_games/#{load_file}.yml")
    self.secret_word = yaml[0].secret_word
    self.guess = yaml[0].guess
    self.counter = yaml[0].counter
    self.wrong_guesses = yaml[0].wrong_guesses
    self.display_answer = yaml[0].display_answer
  end

  def saved_games
    puts "saved games: "
    Dir["./saved_games/*"].map{ |file| file.split('/')[-1].split('.')[0]}
  end
end

game = Hangman.new("5desk.txt")
game.game_menu
# at the start of any turn, the player have the option to save the game

# when the program loads, add in an option to open one of the saved games
