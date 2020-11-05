module Movable
  def move
    "can move lots of stuff."
  end
end

class Vehicle
  @@number_of_cars = 0

  def initialize
    @@number_of_cars +=1
  end

  def self.number_of_cars
    @@number_of_cars
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  private

  def age
    
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  include Movable
end

class MyTruck < Vehicle
  Number_OF_DOORS = 2
end

p my_car = MyCar.new
p my_second_car = MyCar.new
p my_truck = MyTruck.new
p Vehicle.number_of_cars
p my_car.move
p MyCar.ancestors
