class LinkedList
  attr_accessor :head

  def initialize(node = nil)
    @head = node
  end

  def iterate()
    # return if @head.nil?
    count = 0
    node = @head
    # while node_next exists
    until node.nil?
      # go to next node    
      yield(node, count)
      node = node.next_node
      count += 1
    end
    @head
  end

  # print each node's value on its own line
  # use your iterate method to be DRY! Don't get caught in the code rain, brrr.
  def print
    iterate() { |node| puts node.value}
  end

  # find the node with the target value and return it
  # if not found return nil, use your iterate method to be DRY!
  def find(target)
    iterate() do |node| 
      return node if node.value === target
    end
    nil
  end

  # add the node to the start of the list, no nodes should be removed
  def add_first(node)
    node.next_node = @head
    @head = node
  end

  # add node to end of list, no nodes should be removed
  # you may wish to use the iterate method
  def add_last(node)
    return @head = node if @head.nil?
    iterate() do |n| 
      if n.next_node.nil?
        n.next_node = node
        break
      end
    end
  end

  # remove the first Node in the list and update head
  # and return the removed node
  def remove_first
    return if @head.nil?
    temp = @head
    @head = @head.next_node
    temp
  end

  # remove the tail node, iterate may be helpful
  # return the node you just removed
  def remove_last
    iterate() do |n|
      if n.next_node.next_node.nil?
        temp = n.next_node
        n.next_node = nil
        return temp
      end
    end
  end

  # replace the node at the given index with the given node
  def replace(idx, node)
    if idx == 0
      node.next_node = head.next_node
      head = node
      return node
    end
    iterate() do |n, count|
      if count == idx - 1
        node.next_node = n.next_node.next_node
        n.next_node = node
        return node
      end
    end
  end
  
  # insert the node at the given index
  # no existing nodes should be removed or replaced
  def insert(idx, node)

    # begining idx = 0
    return add_first(node) if idx == 0
    iterate() do |n, count|
      if count == idx - 1
        node.next_node = n.next_node
        n.next_node = node
        break
      end
    end
  end
  
  # remove the node at the given index, and return it
  def remove(idx)
    iterate() do |n, c|
      if c == idx - 1
        temp = n.next_node
        n.next_node = n.next_node.next_node
        return temp
      end
    end
  end

  def clear
    @head = nil
  end
end

class Node
  # next is a reserved word in Ruby, so we'll use next_node instead 
  # just to keep things clear
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

if __FILE__ == $PROGRAM_NAME
  # Don't forget to add your tests!
end

# Please add your pseudocode to this file
# And a written explanation of your solution
