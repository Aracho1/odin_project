class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end


class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = Node.new
    @tail = @head
    @size = 0
  end
  # add a new node containing value to the end of the list
  def append(value)
    @size += 1
    if @head == @tail && @head.value.nil?
      @head.value = value
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    @size += 1
    if @head == @tail && @head.value.nil?
      @head.value = value
    else
      @head = Node.new(value, @head)
    end
  end

  # returns the node at the given index
  def at(index)
    return if index >= size
    tmp = @head
    index.times { tmp = tmp.next_node }
    tmp
  end

  # remove the last element from the list
  def pop
    if @head == @tail
      @head.value = nil
      @size = 0
    else
      @size -= 1
      tmp = @head
      until tmp.next_node == @tail do
        tmp = tmp.next_node
      end
      tmp.next_node = nil
      @tail = tmp
    end
  end

  # return true if the passed in value is in the list. Otherwise return false
  def contains?(value)
    tmp = @head
    while tmp != nil
      if tmp.value == value
        return true
      else
        tmp = tmp.next_node
      end
    end
    return false
  end

  # returns the index of the node containing the value or nil if not found
  def find(value)
    index = 0
    tmp = @head
    while index < @size do
      if tmp.value == value
        return index
      else
        tmp = tmp.next_node
        index += 1
      end
    end
    return nil
  end

  # print out linkedlist objects
  # format: (value) -> (value) -> (value) -> nil
  def to_s
    if @head.value.nil?
      puts "nil"
    else
      tmp = @head
      until tmp.next_node == nil
        print "#{tmp.value} -> "
        tmp = tmp.next_node
      end
      puts "nil"
    end
  end


  def insert_at(value, index)
  end

  def remove_at(index)
  end
end

list = LinkedList.new
10.times{ list.append(Random.rand(20))}
p list.to_s
list.pop
p list.to_s
