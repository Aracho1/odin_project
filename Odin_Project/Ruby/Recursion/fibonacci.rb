# # iteration version
def fibs(n)
  if n == 1
    [0]
  elsif n == 2
    [0, 1]
  else
    sequence = [0, 1]
    while n > 2
      sequence << (sequence[-1] + sequence[-2])
      n -= 1
    end
  end
  sequence
end

# recursive version
def fibs_rec(n)
  if n == 1
    [0]
  elsif n == 2
    [0, 1]
  else
    array = fibs_rec(n-1)
    array << seq[-2] + seq[-1]
  end
end
