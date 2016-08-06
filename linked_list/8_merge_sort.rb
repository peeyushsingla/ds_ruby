# This is For array
# Now you will ask why its in the Linked list because I didn't knew how it works
# Now next will be mege_sort_linked_list.

require 'rubygems'
require 'pry'
require 'active_support'
require 'active_support/core_ext/object/blank'

class Array

  def merge_sort_me
    devide_and_sort(self)
  end

  def devide_and_sort(_array)
    _length = _array.length

    return _array if _length == 1
    _break_point = ((_length / 2)  - 1)

    _first_array  = _array[0.._break_point]
    _second_array = _array[(_break_point + 1)..(_length-1)]
    merge_sorted_array(devide_and_sort(_first_array), devide_and_sort(_second_array))
  end

  def merge_sorted_array(_first_sorted_array, _second_sorted_array )
    _final_array = []
    while _first_sorted_array.present? or _second_sorted_array.present?

      if _first_sorted_array.blank?
        _final_array.concat(_second_sorted_array)
        break;
      elsif _second_sorted_array.blank?
        _final_array.concat(_first_sorted_array)
        break;
      else
        if _first_sorted_array.first <= _second_sorted_array.first
          _final_array.push(_first_sorted_array.delete_at(0))
        elsif _second_sorted_array.first < _first_sorted_array.first
          _final_array.push(_second_sorted_array.delete_at(0))
        end
      end
    end
    return _final_array
  end

end


a = [2, 10, 8, 12, 1, 5, 2, 6].merge_sort_me

