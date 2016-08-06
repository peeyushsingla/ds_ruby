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
        _dummy_linked_list.set_last(_current_second_node)
        break;
      elsif _current_second_node.blank?
        _dummy_linked_list.set_last(_current_first_node)
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
    return _dummy_linked_list
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

  def set_last(_new_node)
    current_node = self.head
    while current_node.next.present?
      current_node = current_node.next
    end
    current_node.next = _new_node
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
# second.next = third
# third.next  = fourth

_first_list.print_list
puts ""
_second_list.print_list

merged_list = LinkedList.merge_sorted(_first_list, _second_list)
puts ""
merged_list.print_list
