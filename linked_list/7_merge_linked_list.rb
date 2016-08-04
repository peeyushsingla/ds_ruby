require 'rubygems'
require 'pry'
require 'active_support'
require 'active_support/core_ext/object/blank'

class LinkedList

  attr_accessor :head

  def self.merge_sorted(_first_list, _second_list)
    if _first_list.blank? and _second_list.blank?
      puts "Invalid Nodes"
    elsif _first_list.blank? or _second_list.blank?
      _final_list = _first_list or _second_list
      return _final_list
    else
      merge(_first_list, _second_list)
    end
  end

  def self.merge(_first_list, _second_list)
    _current_first_node   = _first_list.head
    _current_second_node  = _second_list.head
    _dummy_linked_list    = LinkedList.new

    loop do
    #   puts "testing"
      if _current_first_node.blank?
        # _dummy_linked_list.next = _current_second_node
        break;
      elsif _current_second_node.blank?
        # _dummy_linked_list.next = _current_first_node
        break
      else

        if _current_first_node.data < _current_second_node.data
          _dummy_linked_list.push(_current_first_node.data)
          _current_first_node = _current_first_node.next
        else
          _dummy_linked_list.push(_current_second_node.data)
          _current_second_node = _current_second_node.next
        end

      end
    end

    binding.pry
    # puts "testing"
  end

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

end

class Node

  attr_accessor :data, :next

  def initialize(_data)
    @data = _data
  end

end

_first_list   = LinkedList.new
first   = Node.new(1)
second  = Node.new(5)
third   = Node.new(7)
fourth  = Node.new(12)

_first_list.head  = first
first.next  = second
second.next = third
third.next  = fourth


_second_list   = LinkedList.new
first   = Node.new(2)
second  = Node.new(4)
third   = Node.new(8)
fourth  = Node.new(22)

_second_list.head  = first
first.next  = second
second.next = third
third.next  = fourth

LinkedList.merge_sorted(_first_list, _second_list)

# Requirements:-

# Have two linked list

# First:- 1 -> 4 -> 6 -> 7 -> 10

# Second:- 1 -> 5 -> 10 -> 15 -> 25

# Create one linked list.

# Cases:-

  # Any list can be empty.
  # Both can be empty.
  # Size can be different.

# Solution:-

  # First check if both are present.
  # If both blank show invalid data.
  # If any of one is blank then second is the linked list.

  # Both inputs are there set head by pulling out the first element of both.
  # Whichever is smaller set as head.


  # Start a loop

  # _current_first_node = 4

  # _current_second_node = 1

  # whichever is the smaller push that in the next

  # point that particular current node to next.

  #

  #




