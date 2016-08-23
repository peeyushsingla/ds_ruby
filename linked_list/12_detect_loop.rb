require 'rubygems'
require 'pry'
require 'active_support'
require 'active_support/core_ext/object/blank'

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

  def detect_loop_using_flag
    _current_node = head

    _found_loop = false
    while _current_node.present?
      if _current_node.read
        _found_loop = true
        break
      else
        _current_node.read = true
      end
      _current_node = _current_node.next
    end

    return _found_loop
  end

end


class Node

  attr_accessor :data, :next, :read

  def initialize(_data)
    @data = _data
  end

end


llist   = LinkedList.new
first   = Node.new(1)
second  = Node.new(2)
third   = Node.new(3)
fourth  = Node.new(4)
fifth   = Node.new(5)

llist.head  = first
first.next  = second
second.next = third
third.next  = fourth
fourth.next = fifth

fifth.next = second

puts llist.detect_loop_using_flag

