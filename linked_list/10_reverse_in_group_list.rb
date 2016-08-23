# Reverse the linked list upto some specific length.
# Input 1-> 2 ->3 -> 4 -> 5-> 6-> 7-> 8
# group size => 2


# Reverse:-

# 1->2->3->4->5->6->7->8
# Start with previous_node to nil
# _current_node = head
# check if _current_node.next is available'
# _Temp = _current_node.next
# _current_node.next = _previous_node
# _current_node = temp

# Reverse in Groups
# 1->2->3->4->5->6->7->8
# Size is three
# we have size of 3

# Logic:-




class LinkedList
  attr_accessor :head

  def initialize
    self.head = nil
  end

  def print_list
    current_node = self.head
    while current_node.present?
      print current_node.data
      print " "
      current_node = current_node.next
    end
  end

  def push(_data)
    _node = Node.new(_data)
    if self.head.blank?
      self.head = _node
    else
      _current_node = self.head
      while _current_node.next.present?
        _current_node = _current_node.next
      end
      _current_node.next = _node
    end
  end

  def reverse_in_k_group(_size)
    if _size > 0
      self.head = reverse_in_groups(self.head, _size)
    else
      puts "Its useless bitch"
    end
  end

  def reverse_in_groups(_head, _count)


  end

end

class Node

  attr_accessor :data, :next

  def initialize(_data)
    @data = _data
  end

end


_list = LinkedList.new
_list.push(1)
_list.push(2)
_list.push(3)
_list.push(4)
_list.push(5)
_list.push(6)

_list.reverse_in_k_group(2)
