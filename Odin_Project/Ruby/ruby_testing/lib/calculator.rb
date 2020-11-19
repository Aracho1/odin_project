class Calculator
  def add(a, *rest)
    rest.reduce(a) { |sum, n| sum + n}
  end

  def multiply(a, *rest)
    rest.reduce(a) { |sum, n| sum * n}
  end

  def subtract(a, *rest)
    rest.reduce(a) { |sum, n| sum - n}
  end

  def divide(a, *rest)
    if rest.include?(0)
      nil
    else
      rest.reduce(a) { |sum, n| sum / n.to_f}
    end
  end
end
