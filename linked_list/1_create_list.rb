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

llist.head  = first
first.next  = second
second.next = third

llist.print_list
