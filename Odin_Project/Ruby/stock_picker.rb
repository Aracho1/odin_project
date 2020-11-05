# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

def stock_picker(stock_prices)
  best_margin = 0
  for day in 0..stock_prices.length-1 do
    lowest_price = stock_prices[day]
    highest_price = stock_prices[day..-1].max
    margin = highest_price - lowest_price
    if best_margin < margin
      best_margin = margin
      best = [lowest_price, highest_price]
    end
  end

  lowest_day = stock_prices.index(best[0])
  highest_day = stock_prices.index(best[1])
  [lowest_day, highest_day]
end
