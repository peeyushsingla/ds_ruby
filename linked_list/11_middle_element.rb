# Slow
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

  def middle_element
    _slow_pointer = self.head
    _fast_pointer = self.head

    while _slow_pointer.present? and _fast_pointer.present? and _fast_pointer.next.present?
      _slow_pointer = _slow_pointer.next
      _fast_pointer = _fast_pointer.next.next
    end

    _slow_pointer
  end
end

class Node

  attr_accessor :data, :next

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

llist.print_list
mid_element = llist.middle_element


