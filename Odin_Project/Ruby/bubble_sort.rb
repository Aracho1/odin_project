# Build a method #bubble_sort that takes an array and returns a sorted array.

def bubble_sort(array)
  (array.length).times {
    array.each_with_index do |n, index|
      if array[index+1] != nil
        if n > array[index+1]
          temp = array[index]
          array[index] = array[index + 1]
          array[index + 1] = temp
          index += 1
        else
          next
        end
      end
    end
  }
  array
end
