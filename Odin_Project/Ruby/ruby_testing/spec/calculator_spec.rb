require './lib/calculator'

describe Calculator do # describe the class
  describe "#add" do # describe the method
    it "returns the sum of two numbers" do # individual example
      calculator = Calculator.new
      expect(calculator.add(5,2)).to eq(7)
    end

    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eq(14)
    end
  end

  describe '#multiply' do
    it "multiplies two numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(3,4)).to eq(12)
    end

    it "multiplies three or more numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(1,2,3)).to eq(6)
      expect(calculator.multiply(1,2,3,4)).to eq(24)
    end
  end

  describe '#subtract' do
    it "subtracts two numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(10,3)).to eq(7)
      expect(calculator.subtract(3,10)).to eq(-7)
    end

    it "subtracts three numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(10,2,3)).to eq(5)
      expect(calculator.subtract(2,3,7)).to eq(-8)
    end
  end

  describe '#divide' do
    it "divides two numbers" do
      calculator = Calculator.new
      expect(calculator.divide(10,2)).to eq(5)
      expect(calculator.divide(2,10)).to eq(0.2)
    end

    it "divides three numbers" do
      calculator = Calculator.new
      expect(calculator.divide(10,2,1)).to eq(5)
      expect(calculator.divide(2,10,2)).to eq(0.1)
    end

    it "returns nil if divided by zero" do
      calculator = Calculator.new
      expect(calculator.divide(10,0)).to eq(nil)
      expect(calculator.divide(0,10)).to eq(0)
    end
  end
end
