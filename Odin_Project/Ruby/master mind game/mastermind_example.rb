class Mastermind
  attr_reader :maker, :breaker, :game_mode

  WELCOME_MESSAGE = "\n\t\t\tWELCOME TO MASTERMIND\n\n  If you play as the Codemaker, you have to pick four colors from the following options:\n
  \t[R]ed, [G]reen, [Y]ellow, [O]range, [B]lack, [W]hite\n
  Use only the color's initial to input your code, or your guesses if you are playing as the codebreaker. The codebreaker has 12 turns to figure
  out the secret code. An asterisk (*) will indicate that a color is in the correct position. A plus sign (+) will indicate that a color
  is in the wrong position, but is part of the solution.\n
  Would you like to be the Codemaker[M] or the Codebreaker[B]? (Press any other key to exit game) >> "

  CODE_OPTIONS = %w[R G Y O B W].freeze

  def initialize
    print WELCOME_MESSAGE
    @game_mode = gets.chomp.upcase
    if game_mode == 'M' || game_mode == 'B'
      @maker = Codemaker.new(game_mode)
      @breaker = Codebreaker.new(game_mode, maker.code)
      puts out_of_tries(breaker.tries)
    else
      puts "\n  Exiting game..."
      sleep 1
    end
  end

  def out_of_tries(tries)
    "\n  You ran out of tries. The secret code was #{maker.code}" if tries == 12 && game_mode == 'B'
    "\n  Good Job! The computer couldn't crack your code!" if tries == 12 && game_mode == 'M'
  end

  def decoded?
    if guess.eql?(secret_code)
      true
    else
      @correct_pos = []
      @correct_color = 0
      guess.each_with_index do |color, i|
        if color == secret_code[i]
          correct_pos.push(color)
        elsif secret_code.any?(color)
          self.correct_color += 1
        end
      end
      false
    end
  end

  def feedback
    puts '  '
    print "   #{guess}"
    print '    ', '*' * correct_pos.length
    print '+' * correct_color
    puts '  '
  end
end

class Codemaker < Mastermind
  attr_reader :code

  def initialize(game_mode)
    if game_mode == 'B'
      @code = CODE_OPTIONS.sample(4)
    else
      input_code
    end
  end

  def input_code
    print "\n  Enter your secret code (use 4 different colors)>> "
    @code = gets.chomp.upcase.split('')
    # @code = STDIN.noecho(&:gets).chomp.upcase.split('')
  end
end

class Codebreaker < Mastermind
  private

  attr_accessor :correct_color, :correct_pos, :current_guess
  attr_reader :guess, :secret_code
  attr_writer :tries

  public

  attr_reader :tries

  def initialize(game_mode, secret_code)
    @secret_code = secret_code
    @tries = 0
    if game_mode == 'B'
      make_guess
    else
      @current_guess = []
      computer_guess
    end
  end

  def auto_guess
    if tries.zero?
      self.current_guess = CODE_OPTIONS.sample(4)
    elsif correct_color + correct_pos.length == 4
      self.current_guess = current_guess.shuffle
    else
      available_colors = CODE_OPTIONS.difference(current_guess)
      self.current_guess = current_guess.sample(correct_pos.length + correct_color)
      current_guess.push(available_colors.sample(4 - current_guess.length)) if current_guess.length < 4
    end
    self.current_guess = current_guess.flatten
  end

  def make_guess
    12.times do |turn|
      print "\n  \##{turn + 1}. Please enter your guess>> "
      @guess = gets.chomp.upcase.split('')
      if decoded?
        puts '  '
        print "   #{guess}"
        puts "\n\n  Congratulations! You cracked the code!"
        break
      end
      feedback
      self.tries += 1
    end
  end

  def computer_guess
    12.times do |turn|
      print "\n  \##{turn + 1}. Computer's guess>> "
      auto_guess
      @guess = current_guess
      if decoded?
        puts '  '
        print "   #{guess}"
        puts "\n  Too bad! The computer cracked your code!"
        break
      end
      feedback
      self.tries += 1
      sleep 0.5
    end
  end
end

Mastermind.new
