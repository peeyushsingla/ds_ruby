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

  def delete_node(_key)
    if _key.present?
      if head.data == _key
        self.head = head.next
      else
        _current_node   = head
        _previous_node  = nil
        while _current_node.present?
          if _current_node.data == _key
            _previous_node.next = _current_node.next
            break
          end
          _previous_node = _current_node
          _current_node  = _current_node.next
        end
      end
    end
  end

  def delete_by_position(_position)
    if _position.present? and self.head.present?

      if (_position == 0)
        self.head = head.next
      else
        _count          = 0
        _current_node   = self.head
        _previous_node  = nil

        while _current_node.present?
          if _count == _position
            _previous_node.next = _current_node.next
            break;
          end
          _previous_node = _current_node
          _current_node = _current_node.next
          _count += 1
        end
      end
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
puts ""

llist.delete_node(7)

llist.print_list
puts ""

llist.delete_by_position(2)
llist.print_list

