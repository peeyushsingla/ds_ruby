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

  def find_length_iteratively
    _count = 0
    _current_node = head
    while _current_node.present?
      _count += 1
      _current_node = _current_node.next
    end
    return _count
  end

  def find_length_recursively
    self.get_length(self.head)
  end

  def get_length(node)
    if node.blank?
      0
    else
      get_length(node.next) + 1
    end
  end

  def swap_the_element(_first_key, _second_key)
    if _first_key.present? and _second_key.present? and _first_key != _second_key
      _current_node   = self.head
      _previous_node  = nil
      while _current_node.present?
        if _current_node.data == _first_key
          _first_key_previous = _previous_node
          _first_key_element  = _current_node
        elsif _current_node.data == _second_key
          _second_key_previous = _previous_node
          _second_key_element  = _current_node
        end
        _previous_node  = _current_node
        _current_node   = _current_node.next
      end

      swap(_first_key_previous, _first_key_element, _second_key_previous, _second_key_element)
    end
  end

  # If element don't have anything in the corresponding previous key that means its head
  def swap(_first_key_previous, _first_key_element, _second_key_previous, _second_key_element)
    if _first_key_element.present? and _second_key_element.present?
      if _first_key_previous.blank? #Frist key element is head element
        temp_element = _second_key_element.next

        _second_key_element.next = _first_key_element.next
        self.head = _second_key_element

        _first_key_element.next = temp_element
        _second_key_previous.next = _first_key_element
      elsif _second_key_previous.blank? #Second key element is head element
        temp_element = _first_key_element.next

        _first_key_element.next = _second_key_element.next
        self.head = _first_key_element

        _second_key_element.next = temp_element
        _first_key_previous.next = _second_key_element
      else # None of the elemenet is head

        # Not sure what was the issue in this login
        # temp_element =  _second_key_element.next

        # _second_key_element.next = _first_key_element.next
        # _first_key_previous.next = _second_key_element

        # _first_key_element.next   = temp_element
        # _second_key_previous.next = _first_key_element


        _first_key_previous.next = _second_key_element
        _second_key_previous.next = _first_key_element

        temp_element =  _second_key_element.next
        _second_key_element.next = _first_key_element.next
        _first_key_element.next = temp_element

      end
    else
      puts "element not found"
    end
  end

  def reverse_list_iteratively
    _previous_node  = nil
    _current_node   = head
    while _current_node.present?
      _temp = _current_node.next
      _current_node.next = _previous_node

      _previous_node = _current_node
      _current_node  = _temp
    end
    self.head = _previous_node
  end

  def reverse_list_recursively
    _current_node = self.head
    reverse_recurr(_current_node)
  end

  def reverse_recurr(_node)
    if _node.next.present?
      reverse_recurr(_node.next)
      temp       = _node.next
      _node.next = nil
      temp.next  = _node
    else
      self.head = _node
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
fourth  = Node.new(4)

llist.head  = first
first.next  = second
second.next = third
third.next  = fourth

llist.insert_in_begining(7)
puts llist.inspect

llist.insert_at_end(10)
llist.print_list


llist.reverse_list_iteratively
llist.print_list

llist.reverse_list_recursively
llist.print_list
