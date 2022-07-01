# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# input - array of numbers
# output - new array consisting of 2 elements from the input array
# rules
#   - returns the 2 elements that are closest in value
#   - input array will not be mutated

# Test Cases
# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]

# algorithm
#   - loop through each element in the array
#   - determine difference with each other element in the array
#   - repeat until all elements have been compared
#   - return pair with the smallest difference

def closest_numbers(arr)
  closest_nums = []
  smallest_diff = arr.max - arr.min

  arr.each_with_index do |num1, index1|
    arr.each_with_index do |num2, index2|
      next if index1 == index2
      diff = (num2 - num1).abs
      if diff < smallest_diff
        smallest_diff = diff
        closest_nums = [num1, num2]
      end
    end
  end
  closest_nums
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]
