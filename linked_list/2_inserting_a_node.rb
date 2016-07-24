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

  def insert_in_begining(_data)
    _new_node = Node.new(_data)
    if self.head.blank?
      self.head = _new_node
    else
      _temp = self.head
      _new_node.next = _temp
      self.head = _new_node
    end
  end

  def insert_at_end(_data)
    _new_node = Node.new(_data)
    if self.head.blank?
      self.head = _new_node
    else
      _current_node = self.head
      until _current_node.next.blank?
        _current_node = _current_node.next
      end
      _current_node.next = _new_node
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


llist.insert_in_begining(7)
llist.insert_at_end(10)
llist.print_list

