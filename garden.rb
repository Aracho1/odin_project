# Our game will be a garden simulator.
# It will have an interface that asks you if you want to plant, weed, water or rest


class Interface
  ACTIONS = {
    'q' => :quit,
    'p' => :plant,
    'w' => :water,
    'x' => :weed,
    'r' => :rest
  }

  VALID_CHOICES = ACTIONS.keys

  def get_valid_action
    puts "What would you like to do? (q: quit, p: plant, w: water, w: weed, r: rest)"
    validate( gets.chomp ) || try_again
  end

  private

  def validate(action)
    VALID_ACTIONS.detect{ |valid_action| valid_action == action }
  end

  def get_action
    ACTIONS[get_valid_action]
  end

  def try_again
    puts "Sorry, I don't understand that."
    get_valid_action
  end
end

class Garden
  attr_reader :plants, :weeds

  def initialize
    @plants = 0
    @weeds = 0
  end

  def grow_weeds
    @weeds += 1
  end

  def plant
    @plant += 1
  end

  def weed
    @weeds -= 1
  end
end

def Controller
  def initialize(garden)
    @garden = garden
  end

  def plant
    @garden.plant
    puts "A new plant is in the ground."
  end

  def weed
    @garden.weed
    puts "Got rid of some weeds, good."
  end

  def water
    puts "The soil is damp now, good."
  end

  def rest
    puts "That was nice. Feeling rested now."
  end

  def quit
    puts "goodbye."
  end
end

class Game
  def initialize
    @interface = Interface.new
    @garden = Garden.new
    @controller = Controller.new(@garden)
    @action = nil
  end

  def play
    while @action != :quit
      grow_weeds
      report
      get_action
      handle_action
    end
  end

  private

  def get_action
    @action = @interface.get_action
  end

  def handle_action
    @controller.send @action
  end


  def report
    puts "There are #{@garden.plants} plants in your garden and #{@garden.weeds} weeds."
  end


  def grow_weeds
    @garden.grow_weeds
    puts "Some new weeds have grown"
  end
end


Game.new.play
