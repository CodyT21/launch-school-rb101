# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# input - array of integers
# output - array of integers
# rules
#   - output array is the count of unique values in the array less than that element
#   - output will be a new array, the input array should not be mutated during the method execution
#   - empty array input?
#   - numbers that occur multiple times should only be counted once when compared to other numbers 

# test cases
# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
#                             == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# algorithm
#   - initialize unique elements array
#   - initialize empty output array
#   - loop through each element in input array
#   - compare value to every element in unique elements array
#   - add count of elements less than current input array element to output array
#   - return output array

def smaller_numbers_than_current(arr)
  counts = []
  unique_elements = []

  arr.each do |ele|
    unique_elements << ele unless unique_elements.include?(ele)
  end

  arr.each do |current_num|
    counts << unique_elements.count { |num| current_num > num }
  end

  counts
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
#                             == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]