# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# rules
#   - if array has less than 5 elements, return nil
#   - return minimum sum of 5 consequtive elements
#   - return a new array

# test cases
# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# algorithm
#   - check number of elements and return nil if less than 5
#   - loop through the first through n - 5 elements
#   - check sum for each subsection
#   - return minimum of the sums

require "pry-byebug"

def minimum_sum(arr)
  num_elements = arr.length
  return nil if num_elements < 5

  consecutive_nums = 5
  minimum_sum = arr[0...consecutive_nums].sum

  (1..num_elements - consecutive_nums).each do |index|
    sum = arr[index...index + consecutive_nums].sum
    # binding.pry
    minimum_sum = sum if sum < minimum_sum
  end

  minimum_sum
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10