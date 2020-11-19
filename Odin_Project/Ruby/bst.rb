class Node
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil

  include Comparable
end


class Tree
  def initialize(array)
    @array = array.uniq.sort
    @root = build_tree(@array, 0, @array.length - 1)
  end

  # method should return level 1 root node
  def build_tree(array, start, last)
    return nil if start > last
    mid = (start, last) / 2
    root = Node.new(array[mid])
    root.left = build_tree(array, start, mid - 1)
    root.right = build_tree(array, mid + 1, last)
    root
  end

  def insert(root, value)
    if root == nil or root.data == value
      root
    elsif root.data < value
      root.right = insert(root.right, value)
    else
      root.left = insert(root.left, value)
    end
  end

  def delete(root, value)
    if root.nil?
      root
    else
      if value < root.data
        root.left = delete(root.left, value)
      elsif value > root.data
        root.right = delete(root.right, value)
      else
        # node with one child or none
        if root.left.nil?
          temp = root.right
          root = nil
          temp
        elsif root.right.nil?
          temp = root.left
          root = nil
          return temp
        else
        # node with two children
          temp =
  end

  def find(value)
  end

  def level_order
  end

  def inorder
  end

  def preorder
  end

  def postorder
  end

  def height(node)
  end

  def depth(node)
  end

  def balanced?(tree)
  end


end
# algorithm for BST



tree = Tree.new(Array.new(10) {rand(1..20)})
p tree.build_tree
