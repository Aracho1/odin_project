def merge_sort(array)
  if array.size < 2
    array
  else
    left = merge_sort(array[0...array.size / 2])
    right = merge_sort(array[array.size / 2...-1])
    merge(left, right)
  end
end

def merge(left, right)
  array = []
  (left.size + right.size).times do
    if left.empty?
      array << right.shift
    elsif right.empty?
      array << left.shift
    else
      compare = left <=> right
      if compare == -1
        array << left.shift
      elsif compare == 1
        array << right.shift
      else
        array << left.shift
      end
    end
  end
  array
end

array = []
rand(100).times do
  array << rand(100)
end

puts merge_sort(array).join(", ")
