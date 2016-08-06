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

  def merge_sort
    devide_and_sort(self)
  end

  def devide_and_sort(_list)
    list_length =  _list.length
    return _list if list_length == 1
    _breaking_point = ((list_length / 2) - 1)
    _first_list, _second_list = _list.devide_in_two(_breaking_point)
    merge_two_sorted(devide_and_sort(_first_list), devide_and_sort(_second_list))
  end

  def merge_two_sorted(_first_sorted_list, _second_sorted_list)
    _final_list = LinkedList.new
    _first_sorted_list = _first_sorted_list.head
    _second_sorted_list = _second_sorted_list.head
    while _first_sorted_list.present? or _second_sorted_list.present?
      if _first_sorted_list.blank?
        _final_list.set_last(_second_sorted_list)
        break;
      elsif _second_sorted_list.blank?
        _final_list.set_last(_first_sorted_list)
        break;
      else
        if _second_sorted_list.data <= _first_sorted_list.data
          _final_list.push(_second_sorted_list.data)
          _second_sorted_list = _second_sorted_list.next
        else
          _final_list.push(_first_sorted_list.data)
          _first_sorted_list = _first_sorted_list.next
        end
      end
    end

    return _final_list
  end

  def length
    _lenght = 0
    _current_node = self.head
    while(_current_node.present?)
      _current_node = _current_node.next
      _lenght += 1
    end
    return _lenght
  end

  def devide_in_two(_breaking_point)
    # binding.pry
    _first_list   = LinkedList.new
    _second_list  = LinkedList.new
    _counter = 0
    _current_node = self.head
    while _current_node.present?
      if _counter <= _breaking_point
        _first_list.push(_current_node.data)
      else
        _second_list.push(_current_node.data)
      end
      _current_node = _current_node.next
      _counter = _counter + 1
    end
    return _first_list, _second_list
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
first   = Node.new(15)
second  = Node.new(2)
third   = Node.new(1)
fourth  = Node.new(13)

_first_list.head  = first
first.next  = second
second.next = third
third.next  = fourth

_list_length = _first_list.length
_first_list.print_list
_list =_first_list.merge_sort


