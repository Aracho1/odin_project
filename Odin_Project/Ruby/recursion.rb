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
    seq = fibs_rec(n-1)
    seq << seq[-2] + seq[-1]
  end
end

def merge_sort(array)
  n = array.size
  if n < 2
    array
  else
    i = n / 2
    merge_sort(array[0..i]) + merge_sort(array[i+1..-1])
    n -= 2
  end
end

array = [9,3,2,11,8,3,4,5]
puts merge_sort(array)
