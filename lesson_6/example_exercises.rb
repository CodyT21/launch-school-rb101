require 'pry-byebug'

# def century(year)
#   year_str = year.to_s  
#   century_str = year_str[0, year_str.length - 2]  
#   century_str = (century_str.to_i + 1).to_s unless year_str[-2,2] == '00'  
#   puts century_str

#   last_digit = century_str[-1]
#   if last_digit == '1' && (century_str[-2,2] != '11')
#     century_str + 'st'
#   elsif last_digit == '2' && (century_str[-2,2] != '12')  
#     century_str + 'nd'
#   elsif last_digit == '3' && (century_str[-2,2] != '13') 
#     century_str + 'rd'
#   else  
#     century_str + 'th'
#   end  
# end

# def leap_year?(year)
#   if year < 1752
#     return year % 4 == 0
#   end

#   if year % 4 == 0
#     if year % 100 == 0
#       return false unless year % 400 == 0
#     end
#     return true
#   end
#   return false
# end

# def multisum(end_num)
#   nums_to_sum = []
#   (1..end_num).each do |num|
#     nums_to_sum << num if num % 3 == 0 || num % 5 == 0
#   end
#   nums_to_sum.sum
# end

# =begin
# def running_total(arr)
#   curr_sum = 0 # initialize current sum
#   # loop through array and transform each element to be the current sum
#   arr.map do |num|
#     curr_sum += num
#   end
# end
# =end

# def running_total(arr)
#   curr_sum = 0
#   arr.each_with_object([]) do |num, diff_arr|
#     curr_sum += num
#     diff_arr << curr_sum
#   end
# end

# def string_to_integer(num_str)
#   output_int = 0
#   current_power = num_str.length - 1
  
#   num_str.chars.each do |digit|
#     output_int += (10 ** current_power) * eval(digit)
#     current_power -= 1
#   end
#   output_int
# end

# def string_to_signed_integer(num_str)
#   if num_str.include?('+') || num_str.include?('-')
#     sign = num_str[0]
#     num_int = string_to_integer(num_str[1..-1])
#     # puts num_int
#     num_int *= -1 if sign == '-'
#   else
#     num_int = string_to_integer(num_str)
#   end
#   num_int
# end

# # DIGITS = %w(0 1 2 3 4 5 6 7 8 9)
# def integer_to_string(num_int)
#   num_str = ''
#   loop do
#     num_int, remainder = num_int.divmod(10)
#     num_str.prepend(DIGITS[remainder])
#     break if num_int == 0
#   end
#   num_str
# end

# def signed_integer_to_string(num_int)
#   if num_int > 0
#     sign = '+'
#   elsif num_int == 0
#     sign = ''
#   else
#     sign = '-'
#   end

#   sign + integer_to_string(num_int.abs)
# end

# def ascii_value(str)
#   str.chars.map { |char| char.ord }.sum
# end

# def time_of_day(minutes)
#   time = ''
#   num_hours, num_minutes = minutes.divmod(60)
  
#   num_hours = num_hours % 24
#   num_hours = 24 - num_hours unless num_hours >= 0

#   hours_str = num_hours.to_s.rjust(2, '0')
#   minutes_str = num_minutes.to_s.rjust(2, '0')
#   time << "#{hours_str}:#{minutes_str}"
# end

# def after_midnight(time_str)
#   minutes_after_midnight = 0
#   hours = time_str[0, 2].to_i
#   minutes = time_str[3, 2].to_i

#   minutes_after_midnight += hours * 60 unless hours == 24
#   minutes_after_midnight += minutes
# end

# def before_midnight(time_str)
#   minutes_before_midnight = 1440
#   hours = time_str[0, 2].to_i
#   minutes = time_str[3, 2].to_i

#   if hours == 0
#     0
#   else
#     minutes_before_midnight -= hours * 60
#     minutes_before_midnight -= minutes
#   end
# end

# def swap(string)
#   words = string.split()
#   swapped_words = words.map do |word|
#     word[0], word[-1] = word[-1], word[0]
#   end
#   swapped_words.join(' ')
# end

# def cleanup(str)
#   # check for non alphanumeric characters
#   pattern = /[^0-9a-zA-Z]/
#   # index_chars_to_clean = str.chars.each_index.select { |idx| str.chars[ind].match(pattern) }
#   # if character is found, check subsequent char for repeat
#   cleaned_str_chars = str.chars.each_with_index.map do |char, index|
#     if char.match(pattern)
#        if index < str.length - 1 && str[index + 1].match(pattern)
#         ''
#        else
#         ' '
#        end
#     else
#       char
#     end
#   end
#   cleaned_str_chars.join('')
#   # if repeat character is found, repeat until index of last char is found
#   # replace substring with single space
# end

# def word_sizes(str)
#   words = str.split(' ')
#   word_sizes = Hash.new(0)

#   words.each do |word|
#     word_sizes[word.gsub(/[^a-zA-Z]/, '').length] += 1
#   end
  
#   word_sizes
# end

# # NUMBERS = {
# #   0 => 'zero',
# #   1 => 'one',
# #   2 => 'two',
# #   3 => 'three',
# #   4 => 'four',
# #   5 => 'five',
# #   6 => 'six',
# #   7 => 'seven',
# #   8 => 'eight',
# #   9 => 'nine',
# #   10 => 'ten',
# #   11 => 'eleven',
# #   12 => 'twelve',
# #   13 => 'thirteen',
# #   14 => 'fourteen',
# #   15 => 'fifteen',
# #   16 => 'sixteen',
# #   17 => 'seventeen',
# #   18 => 'eighteen',
# #   19 => 'nineteen',
# # }

# def alphabetic_number_sort(num_arr)
#   # num_arr.sort_by { |num| NUMBERS[num]}
#   num_arr.sort { |num1, num2| NUMBERS[num1] <=> NUMBERS[num2] }
# end

# def crunch(str)
#   words = str.split(' ')
#   crunched_words = []
  
#   words.each do |word|
#     new_word = ''
#     word.chars.each_with_index do |char, index|
#       if char != word[index + 1]
#         new_word << char
#       end
#     end
#     crunched_words << new_word
#   end

#   crunched_words.join(' ')
# end

# def print_in_box(text)
#   # determine length of text
#   text_length = text.length
#   line_length = 78
#   split_text = []
#   if text_length > line_length
#     text_length = line_length
    
#     i = 0
#     while i < text.length
#       split_text << text[i, i+line_length]
#       i += line_length
#     end
#   else
#     line_length = text_length
#     split_text << text
#   end

#   upper_bottom_border = "+#{'-' * (line_length + 2)}+"
#   mid_layers = "|#{" " * (line_length + 2)}|"
#   # write line one using text length for reference
#   puts upper_bottom_border
#   # write second line with empty spaces on inside
#   puts mid_layers
#   # write text line(s)
#   split_text.each { |line| puts "| #{line}#{' ' * (line_length - line.length)} |" }
#   # repeat second and first line
#   puts mid_layers
#   puts upper_bottom_border
# end

# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end

# def word_cap(words)
#   words.split.map(&:capitalize).join(' ')
# end

# def letter_case_count(str)
#   counts = { lowercase: 0, uppercase: 0, neither: 0 }
#   str.chars.each do |char|
#     if char.match(/[a-z]/)
#       counts[:lowercase] += 1
#     elsif char.match(/[A-Z]/)
#       counts[:uppercase] += 1
#     else
#       counts[:neither] += 1
#     end
#   end
#   counts
# end

# def swapcase(str)
#   swapped_chars = str.chars.map do |char|
#     if char =~ /[a-z]/
#       char.upcase
#     elsif char =~ /[A-Z]/
#       char.downcase
#     else
#       char
#     end
#   end
#   swapped_chars.join('')
# end

# def staggered_case(str, start_upcase=true, count_all_chars=false)
#   staggered_str = ''
#   need_upper = start_upcase
#   str.chars.each do |char|
#     if char =~ /[A-Za-z]/
#       if need_upper
#         staggered_str << char.upcase
#       else
#         staggered_str << char.downcase
#       end
#       need_upper = !need_upper
#     else
#       staggered_str << char
#       need_upper = !need_upper if count_all_chars
#     end
#   end
#   staggered_str
# end

# def show_multiplicative_average(arr)
#   multiplicative_sum = arr.reduce(1, :*)
#   multiplicative_avg = multiplicative_sum / arr.length.to_f
#   puts "#{format("%.3f", multiplicative_avg)}"
# end

# def multiply_list(arr1, arr2)
#   multiplied_list = []
#   # arr1.each_with_index do |num, index|
#   #   multiplied_list << num * arr2[index]
#   # end
#   # multiplied_list
#   arr1.zip(arr2) { |elem| multiplied_list << elem.reduce(1, :*) }
#   multiplied_list
# end

# def multiply_all_pairs(arr1, arr2)
#   num_pairs = []
#   arr1.each do |num1|
#     arr2.each do |num2|
#       num_pairs << num1 * num2
#     end
#   end
#   num_pairs.sort
# end

# def penultimate(str)
#   words = str.split(' ')
#   words.length > 1 ? words[-2] : str
# end

# def sum_of_sums(arr)
#   end_index = 0
#   sum_of_sums = 0
#   until end_index == arr.length
#     (0..end_index).each do |index|
#       sum_of_sums += arr[index]
#     end
#     end_index += 1
#   end
#   sum_of_sums
# end

# def leading_substrings(str)
#   substrings = []
#   0.upto(str.length - 1) do |end_index|
#     substrings << str[0..end_index]
#   end
#   substrings
# end

# def palindromes(str)
#   substrings = substrings(str)
#   substrings.select { |substr| substr.length > 1 && substr == substr.reverse }
# end

# def substrings(str)
#   substrings = []
#   start_index = 0
#   until start_index == str.length
#     substrings << leading_substrings(str[start_index..-1])
#     start_index += 1
#   end
#   substrings.flatten
# end

# def rotate_array(arr)
#   arr[1..-1] + [arr[0]]
# end

# def rotate_rightmost_digits(num, n)
#   digits = num.to_s.chars
#   digits[-n..-1] = rotate_array(digits[-n..-1])
#   digits.join('').to_i
# end

# =begin
# 1000 Lights
# inputs: number of switches as an integer
# outputs: array with the light numbers that are still on
# rules: 
#   - number of lights and number of repitions use the same input value
#   - all lights start off as off
#   - light numbers go from 0 to (n-1)

# test cases:
#   - input 5, return [1, 4]
#   - input 10, return [1, 4, 9]

# data type:
#   - array of 0s and 1s; 0 is off, 1 is on
#   - light numbers are 1 more than their index in the array

# algorith:
#   - define array of lights with length equal to num of lights and default value of 0
#   - initialize loop that will execute 'number of lights' times
#   - at each iteration loop through the lights array with the curr iteration number in between the elements
#   - swap elements at the current iteration to either 0 or 1 depending on current value
#   - return array of indices with a '1'
# =end

# def on_lights(lights)
#   on_lights = []
#   lights.each_with_index do |_, index|
#     on_lights << index + 1 if lights[index] == 1
#   end
#   on_lights
# end

# def toggle_every_nth_light(lights, nth)
#   curr_index = nth - 1
#   until curr_index >= lights.length
#     if lights[curr_index] == 0
#       lights[curr_index] = 1
#     else
#       lights[curr_index] = 0
#     end
#     curr_index += nth
#   end
#   lights
# end

# def toggle_lights(n)
#   lights = Array.new(n, 0)

#   1.upto(n) do |pass_num|
#     lights = toggle_every_nth_light(lights, pass_num)
#   end

#   p on_lights(lights)
# end

# =begin
# Diamonds!
# inputs - integer corresponding to length of middle layer of diamond
# outputs - print asterists of a diamons with the middle the length of the input
# rules - 
#   - every new line adds one asterisk to each side until the middle layer matches the length of the input integer
#   - input also corresponds to the number of lines in the diamond

# =end
# def print_diamond_top(num_spaces)
#   num_asterisks = 1
#   until num_spaces <= 0
#     puts "#{' ' * num_spaces}#{'*' * num_asterisks}"
#     num_spaces -= 1
#     num_asterisks += 2
#   end
# end

# def print_diamond_bottom(num_asterisks)
#   num_spaces = 1
#   until num_asterisks <= 0
#     puts "#{' ' * num_spaces}#{'*' * num_asterisks}"
#     num_asterisks -= 2
#     num_spaces += 1
#   end
# end

# def diamond(n)
#   space_buffer = n.even? ? (n / 2) - 1 : n / 2
#   print_diamond_top(space_buffer)
#   puts "#{'*' * n}"
#   print_diamond_bottom(n - 2)
# end

# # Word to Digit
# # inputs - string
# # output - sane string with number words replaced with the integer value in string form
# # algorithm
# #   parse array for word numbers
# #   replace with integer value as string
# #   return same string with replacements

# # DIGITS = {
# #   'one' => '1',
# #   'two' => '2',
# #   'three' => '3',
# #   'four' => '4',
# #   'five' => '5',
# #   'six' => '6',
# #   'seven' => '7',
# #   'eight' => '8',
# #   'nine' => '9'
# # }

# def word_to_digit(str)
#   DIGITS.keys.each do |digit_word|
#     str.gsub!(/\b#{digit_word}\b/, DIGITS[digit_word])
#   end

#   # fix spaces between numbers
#   str.gsub!(/(\d)\s(?=\d)/, '\1\2')

#   # format phone number if 10 digits are given
#   str.gsub!(/\b(\d{3})(\d{3})(\d{4})\b/, '(\1) \2-\3')
#   str
# end


# # Fibonacci Numbers (Recursion)
# # input: integer - fibonacci sequence number to return
# # output: integer of the given part of the sequence

# def fibonacci(n)
#   # return 1 if n <= 2
#   # fibonacci(n - 1) + fibonacci(n - 2)
#   if n <= 2
#     return 1
#   else
#     first = 1
#     last = 1
#     3.upto(n) do
#       first, last = [last, first + last]
#     end
#   end
#   last
# end

# def fibonacci_last(n)
#   first, last = [1, 1]
#   3.upto(n % 60) do
#     first, last = [last, (first + last) % 10]
#   end
#   last
# end

# # Longest Sentence 
# # input - long string of text
# # output - length of longest text snippet by word count as an integer
# # rules -
# #   sentences ending characters are only '.', '!', or '?'
# #   any other characters that are not spaces or sentence ending chars will be treated as words
# #   
# def display_longest_sentence(text)
#   sentences = text.gsub(/\n/, ' ').split(/\.|\!|\?/)
#   longest_word_count = 0
#   longest_sentence = ''
#   sentences.each do |sentence|
#     sentence_length = sentence.split.length
#     longest_word_count = sentence_length unless longest_word_count > sentence_length
#     longest_sentence = sentence
#   end
#   puts "#{longest_sentence}"
#   puts "Containing #{longest_word_count} words"
# end

# # Now I Know My ABCs
# # inputs - single word passed in as a string
# # outputs - boolean true of false
# # rules - 
# #   words cannot use both the key and its value in the word
# #   upper and lower case words should be treated the same 'ABC' is the same as 'abc'
# # algorithm -
# #   loop through string characters
# #   if character is one of the keys, check if value is also in the word
# #   if character is not one of the keys, check the values
# #   return false if key and value are in the word or character is not a key or value
# #   return true otherwise

# # BLOCK_HSH = {
# #   'B' => 'O',
# #   'G' => 'T',
# #   'V' => 'I',
# #   'X' => 'K',
# #   'R' => 'E',
# #   'L' => 'Y',
# #   'D' => 'Q',
# #   'F' => 'S',
# #   'Z' => 'M',
# #   'C' => 'P',
# #   'J' => 'W',
# #   'N' => 'A',
# #   'H' => 'U'
# # }
# def block_word?(word)
#   word.each_char do |char|
#     if BLOCK_HSH.keys.include?(char.upcase)
#       return false if word.include?(BLOCK_HSH[char.upcase])
#     else
#       return false if !BLOCK_HSH.values.include?(char.upcase)
#     end
#     return false if word.upcase.count(char.upcase) > 1
#   end
#   return true
# end

# # Lettercase Percentage Ratio
# def letter_percentages(str)
#   counts = letter_case_count(str)
#   total_chars = str.length
#   counts.map do |(key, count)|
#     percentage = (count / total_chars.to_f) * 100
#     [key, percentage.round(1)]
#   end.to_h
# end

# # Matching Parentheses
# # input - string
# # ouput - boolean true or false
# # rules -
# #   - 2 criteria for properly balanced parentheses
# #     1. Must have equal number of '(' and ')'
# #     2. Balanced pairs must start with '(' and end with ')'
# # algorithm
# #   count number of each parentheses type
# #     if these are not equal return false
# #     remove all characters except parentheses in the string
# #     remove pairs of parenthese, if a blank string is left return true
# #     if a backwards pair is left over, return false

# # FRONT_PARENS = ['(', '[', '{']
# # BACK_PARENS = [')', ']', '}']
# def balanced?(str)
#   # return false if str.count('(') != str.count(')')
#   # str_parentheses = str.gsub(/[^()]/, '')
#   # 1.upto(str_parentheses.count('(')) do
#   #   # will remove sets of parentheses until empty string, or mismatched pair are left
#   #   str_parentheses.gsub!(/\B\(\)\B/, '')
#   # end
#   # str_parentheses.length > 0 ? false : true
#   return false if !str.count("'").even? || !str.count('"').even?
#   char_counts = Hash.new(0)
#   str.each_char do |char|
#     if FRONT_PARENS.any? { |front_paren| char.include?(front_paren) }
#       char_counts[char] += 1
#     elsif BACK_PARENS.any? { |back_paren| char.include?(back_paren) }
#       char_counts[char] -= 1
#     end
#     (1..FRONT_PARENS.length).each do |index|
#       return false if char_counts[FRONT_PARENS[index - 1]] < char_counts[BACK_PARENS[index - 1]].abs
#     end
#   end
#   parentheses = char_counts['('] + char_counts[')']
#   square_brackets = char_counts['['] + char_counts[']']
#   curly_brackets = char_counts['{'] + char_counts['}']
#   parentheses.zero? && square_brackets.zero? && curly_brackets.zero?
# end

# # Triangle Sides
# # inputs: 3 integers corresponding to side lengths
# # output: symbol of trianlge type (equilateral, isosceles, scalene, or invalid)
# # rules
# #   - equilateral triangle: all 3 sides lengths are the same
# #   - isosceles triangle: 2 sides lengths are equal, 3rd is different
# #   - scalene triangle: all 3 sides are different lengths
# #   - sum of the 2 shorter sides of the triangle must be greater than length of the longest side
# #   - all side lengths must be greater than 0
# #   - if above 2 criteria are not met, triangle is invalid
# # algorithm
# #   - check if all side lengths inputs are valid (> 0); return invalid if false
# #   - check if all sides lengths are equal; return :equilateral if true
# #   - find 2 shortest sides and check if sum is greater than 3rd side length
# #   - if true, check if all values are different, or if 2 match; return scalene or isosceles, respectively

# # def triangle(side1, side2, side3)
# #   side_lengths = [side1, side2, side3].sort

# #   return :invalid if side_lengths.any? { |side_length| side_length <= 0 }
# #   return :equilateral if side_lengths.all? { |side_length| side_length == side1 }

# #   sum_short_sides = side_lengths[0..1].sum
# #   return :invalid if sum_short_sides < side_lengths[-1]

# #   return :isosceles if side1 == side2 || side1 == side3 || side2 == side3
# #   return :scalene
# # end

# def triangle(angle1, angle2, angle3)
#   angles = [angle1, angle2, angle3]
#   return :invalid if angles.sum != 180
  
#   case
#   when angles.max > 90 then :obtuse
#   when angles.all? { |angle| angle < 90 } then :acute
#   when angles.count(90) == 1 then :right
#   else :invalid
#   end
# end

# # Unluck Days
# # input - integer (year)
# # output - integer (number of Friday the 13ths in the given year)
# # rules
# #   - inputs will only be positive integers greater than 1752
# # algorithm
# #   - loop through the calendar months in the given year
# #   - check the thirteenth day of the month
# #   - if it is a Friday, add one to the count
# #   - return the count after iterating through all 12 months

# def friday_13th(year)
#   count = 0
#   (1..12).each do |month|
#     date = Time.local(year, month, 13)
#     count += 1 if date.friday?
#   end
#   count
# end

# # Next Featured Number High than a Given Value
# # input - integer (starting point for finding next featured number)
# # output - integer (next featured number)
# # rules
# #   - a feature number if an odd number that is a multiple of 7 with no repeating digits
# #   - the returned next feature number will always be greater than the input value
# #   - if there is no next featured number, return an error message
# # algorithm
# #   - find next factor of 7 from the input value
# #   - if new number is the next featured number, return the number
# #   - else continually add 7 to the value and check if it meets the criteria for the next featured number


# def repeating_digits?(num)
#   num_str = num.to_s
#   num_str.each_char do |char|
#     return true if num_str.count(char) > 1
#   end
#   false
# end

# def featured(num)
#   if num % 7 != 0
#     num += 7 - num % 7
#   else
#     num += 7
#   end

#   until num > 9_876_543_210 # guarenteed to have a repeating number
#     return num if num.odd? && !repeating_digits?(num)
#     num += 7
#   end

#   'There is no possible number that fulfills those requirements'
# end

# # Bubble Sort
# # input - array (length is a minimum of 2)
# # ouput - sorted array (same object) from smallest to largers
# # algorithm
# #   - loop through all but the last element in the array
# #   - compare element with the next elements
# #   - if later element is smaller, swap the values at the indices
# #   - repeat the looping until no mutations are made in a single iteration

# def bubble_sort!(arr)
#   # loop do
#   #   exchanged = false
#   #   arr.each_with_index do |ele, index|
#   #     break if index == arr.length - 1
#   #     next_ele = arr[index + 1]

#   #     if ele > next_ele
#   #       arr[index], arr[index + 1] = next_ele, ele
#   #       exchanged = true
#   #     end
#   #   end
#   #   break if exchanged == false
#   # end
#   # nil
#   n = arr.length
#   until n <= 1 do
#     new_n = 0
#     1.upto(n - 1) do |i|
#       if arr[i - 1] > arr[i]
#         arr[i - 1], arr[i] = arr[i], arr[i - 1]
#         new_n = i
#       end
#     end
#     n = new_n
#   end
#   nil
# end

# # Sum Square - Square Sum
# # input - positive integer
# # output - integer
# # rules
# #   - output (sum of first n positive ints) ** 2 - sum of squares of first n positive ints
# def sum_square_difference(num)
#   sum_of_ints = 0
#   sum_of_squares = 0
#   1.upto(num) do |n|
#     sum_of_ints += n
#     sum_of_squares += n ** 2
#   end
#   (sum_of_ints) ** 2 - sum_of_squares
# end

# # Seeing Stars
# # input - odd integer corresponding to dimensions of grid for 8 pointed star
# # output - 8 point star denoted by '*'s that take up the full length and width of the grid
# # rules
# #   - smallest star to be handled is 7 x 7
# #   - input will always be odd integers
# #   - must always output an 8 pointed star
# # algorithm
# #   - print star line by line
# #   - line 1
# #     - num_spaces before and after = 1
# #     - num_spaces between = n - 3 - 2 * num_spaces before
# #   - line 2
# #     - num_spaces before and after = 2

# def star(n)
#   num_spaces_start = 0
#   num_spaces_between = n - (2 * num_spaces_start) - 3 # top and bottom have 3 points
  
#   # print top half of star
#   (n / 2).times do
#     print "#{' ' * num_spaces_start}"
#     puts "*#{' ' * num_spaces_between}*#{' ' * num_spaces_between}*"
#     num_spaces_start += 1
#     num_spaces_between -= 1
#   end
  
#   puts "#{'*' * n}"
  
#   # print bottom half of star
#   (n / 2).times do
#     print "#{' ' * num_spaces_start}"
#     puts "*#{' ' * num_spaces_between}*#{' ' * num_spaces_between}*"
#     num_spaces_start -= 1
#     num_spaces_between += 1
#   end
#   nil
# end


# # Transpose 3x3
# # input - 3 x 3 array of numbers
# # output - new 3 x 3 array that is the original array, transposed
# # algorithm
# #   - loop through each sub array
# #   - each index will correspond to the row number in the new array
# #   - add all values to new sub arrays
# #   - repeat will all sub arrays in the original array

# def transpose(matrix)
#   num_rows = matrix[0].length
#   output_matrix = Array.new(num_rows).map { |_| [] }
  
#   matrix.each do |sub_arr|
#     sub_arr.each_with_index do |ele, index|
#       output_matrix[index] << ele
#     end
#   end
  
#   output_matrix
# end

# def transpose!(matrix)
#   # [
#   #   [1, 2, 3],
#   #   [4, 5, 6],
#   #   [7, 8, 9]
#   # ]
#   # [
#   #   [1, 4, 7],
#   #   [2, 5, 8],
#   #   [3, 6, 9]
#   # ]
#   # 1 -> 0, 0 -> 0, 0
#   # 2 -> 0, 1 -> 1, 0
#   # 3 -> 0, 2 -> 2, 0
#   # 4 -> 1, 0 -> 0, 1
#   # 5 -> 1, 1 -> 1, 1
#   # 6 -> 1, 2 -> 2, 1
#   # 7 -> 2, 0 -> 0, 2
#   # 8 -> 2, 1 -> 1, 2
#   # 9 -> 2, 2 -> 2, 2
#   (0..1).each do |row_index|
#     (0..2).each do |col_index|
#       next if row_index == 0 && col_index == 1
#       matrix[row_index][col_index], matrix[col_index][row_index] = matrix[col_index][row_index], matrix[row_index][col_index]
#     end
#   end
#   matrix
# end


# # Rotating Matrices
# # input - array of arrays
# # output - new array of arrays rotated 90 degrees
# # rules
# #   - input sub arrays will always be of the same length
# #   - the rotation can change the dimensions of the matrix
# #     - i.e. 2 x 3 matrix becomes a 3 x 2 matrix
# # algorithm
# #   - create empty matrix with output dimensions
# #   - loop through the sub arrays
# #     - add the elements to each the beginning of each sub array in the output matrix

# def rotate90(matrix, rotation=90)
#   num_rows = matrix[0].length
#   rotated_matrix = Array.new(num_rows).map { |_| [] }

#   matrix.each do |sub_arr|
#     sub_arr.each_with_index do |ele, index|
#       rotated_matrix[index].unshift(ele)
#     end
#   end

#   num_rotations = (rotation - 90) / 90
#   num_rotations.times do
#     rotated_matrix = rotate90(rotated_matrix)
#   end
#   rotated_matrix
# end


# # Merge Sorted List
# # input - 2 arrays of sorted integers; length can differ
# # output - new array of all elements from both arrays sorted smallest to largest
# # rules
# #   - cannot combine arrays and use the sort method on the combined array
# #   - result array must be built one element at a time
# #   - input arrays should not be mutated
# # algorithm
# #   - loops through the elements of each array
# #   - add the smaller of the elements to the result array
# #   - increment current index for the array with the added element
# #   - continue comparisons until on array is at the final index
# #   - add the remaining elements from the other array to the result array

# def merge(arr1, arr2)
#   merged_arr = []
#   arr2_index = 0

#   arr1.each do |ele|
#     while arr2_index < arr2.length && arr2[arr2_index] <= ele
#       merged_arr << arr2[arr2_index]
#       arr2_index += 1
#     end
#     merged_arr << ele
#   end

#   merged_arr.concat(arr2[arr2_index..-1])  
# end


# # Merge Sort
# # input - array
# # output - sorted array
# # rules
# #   - will use the merge sort sorting algorithm
# #   - input array will only include either all numbers or all strings

# # merge sort recursively
# # def merge_sort(arr)
# #   if arr.length == 1
# #     return arr
# #   end

# #   arr_first_half = arr[0..(arr.length / 2) - 1]
# #   arr_last_half = arr[(arr.length / 2)..-1]

# #   arr_first_half = merge_sort(arr_first_half)
# #   arr_last_half = merge_sort(arr_last_half)

# #   merge(arr_first_half, arr_last_half)
# # end

# # merge sort non-recursively
# def merge_sort(arr)
#   width = 1
#   n = arr.length

#   while width < n
#     i = 0
#     while i < n
#       l1 = i
#       r1 = i + width - 1
#       l2 = i + width
#       r2 = i + 2 * width - 1
#       break if l2 >= n
#       r2 = n - 1 if r2 >= n

#       temp = merge(arr[l1..r1], arr[l2..r2])
#       (0..(r2 - l1 + 1)).each do |index|
#         arr[i + index] = temp[index]
#       end
      
#       i += 2 * width
#     end
#     width *= 2
#   end
#   arr
# end


# # Egyptian Fractions
# def egyptian(num)
#   unit_frac_denoms = []
#   curr_denom = 1

#   until num == 0
#     if num - Rational(1, curr_denom) < 0
#       curr_denom += 1
#       next
#     else
#       num -= Rational(1, curr_denom)
#       unit_frac_denoms << curr_denom
#       curr_denom += 1
#     end
#   end
#   unit_frac_denoms
# end

# def unegyptian(denoms)
#   denoms.reduce(0) do |sum, denom|
#     sum + Rational(1, denom)
#   end
# end



# # TF-IDF Debugging

# # Term frequency - inverse document frequency:
# # A measure of how important a term is to a document in a collection of documents
# # (the importance increases proportionally to the term frequency in the document,
# # but decreases with the frequency of the word across documents)

# def tfidf(term, document, documents)
#   tf(term, document) * idf(term, documents)
# end

# # Term frequency (simple version):
# # the number of times a term occurs in a document

# def tf(term, document)
#   document.split(/[\s,.-]/).count { |word| word.downcase == term }

# end

# # Inverse document frequency:
# # measure of how much information the word provides,
# # based on the number of documents in which it occurs
# # (the rarer it is, the more information it provides)

# def idf(term, documents)
#   number_of_documents = documents.length
#   number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }
#   # binding.pry
#   Math.log(number_of_documents / number_of_documents_with_term.to_f)
# end

# # Very simple example

# document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
# "it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
# "a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
# "quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
# "In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

# document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
# "Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
# "Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

# document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
# "is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
# "but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
# "such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
# "Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

# documents = [document1, document2, document3]

# # The higher the tf-idf score of a term for a document, the more informative
# # it is for that document.
# # E.g. when someone searches for the term 'cat' in your document collection,
# # you want to return document1 and document2, but not document3.
# # For the term 'quantum mechanics', on the other hand, you only want to return document1.

# # expected outputs:
# puts tfidf("cat", document1, documents) # ~ 1.2
# puts tfidf("cat", document2, documents) # ~ 1.6
# puts tfidf("cat", document3, documents) # 0

# puts tfidf("quantum", document1, documents) # ~ 5.5
# puts tfidf("quantum", document2, documents) # 0
# puts tfidf("quantum", document3, documents) # 0

# puts tfidf("mastery", document1, documents) # 0
# puts tfidf("mastery", document2, documents) # 0
# puts tfidf("mastery", document3, documents) # ~ 4.4

# puts tfidf("some", document1, documents) # 0
# puts tfidf("some", document2, documents) # ~ 0.4
# puts tfidf("some", document3, documents) # ~ 0.4


# arr = ["9", "8", "7", "10", "11"]
# new_arr = arr.sort do |x, y|
#     y.to_i <=> x.to_i
#   end
# p new_arr


# Repeeated Substring Pattern method
# inputs - str
# outputs - boolean true or false
# rules
#   - return true if substring of input string can be repeated to create the same string pattern as the input str
#   - substrings can be length 1 or larger
#   - input str will bee on at least length 2
# algorithm
#   - find midpoint index in the array
#   - loop through string from start until the midpoint index
#   - continually add characters to the substring strating with the char at the first index
#   - multiple substring by (length of str - length of substring) / length of substring
#   - if this string matches input string return true
#   - if loop finishes executing, return false

# def repeated_substring_pattern(str)
#   midpoint_index = str.length / 2
#   end_index = 0
  
#   str[0...midpoint_index].each_char do |char|
#     substr = str[0..end_index]
#     repeats = str.length / substr.length
#     # binding.pry
#     return true if  substr * repeats == str
#     end_index += 1
#   end

#   false
# end

# p repeated_substring_pattern('abab')
# p repeated_substring_pattern('aba')
# p repeated_substring_pattern('aabaaba')
# p repeated_substring_pattern('abaababaab')
# p repeated_substring_pattern('abcabcabcabc')



# Common_chars method
# input - array of strings
# output - array of characters
# rules
#   - include character in the output array if it shows up in all strings in the input array
#   - duplicate letters all count and need to be included as unique elements in the output array
#   - input array strings do not have to be of equal length
# algorithm
#   - loop through characters of the first string in the array
#   - check if character is in all other strings in the array
#   - skip to next letter if not in all other strings
#   - if char is in all str, count occurances in output array and occurances in th string
#   - do not include char in output array if the output array would contain more occurancs of the char than the string
#   - return output array

# def common_chars(arr)
#   common_chars = []

#   arr[0].each_char do |char|
#     next if arr.any? { |str| !str.include?(char) }

#     if common_chars.include?(char)
#       curr_count = common_chars.count { |c| c == char }
#       str_counts = []
#       arr.each do |str|
#         str_counts << str.split('').count { |c| c == char }
#       end
      
#       next if str_counts.any? { |char_count| curr_count + 1 > char_count }
#     end

#     common_chars << char
#   end

#   common_chars
# end

# p common_chars(['bella', 'label', 'roller'])
# p common_chars(['cool', 'lock', 'cook'])
# p common_chars(['hello', 'goodbye', 'booya', 'random'])
# p common_chars(['aabbaaaa', 'ccdddddd', 'eeffee', 'ggrrrrr', 'yyyzzz'])


# inputs - integer
# output - integer
# rules
#   - output the next largest number that can be formed by the same digits as the input
#   - return -1 if there is not a larger number that can be formed by the input digits
#   - input will only consist of integers
# alorithm
#   - convert input integer to a string
#   - return -1 if string is already sorted in reverse order
#   - starting from last element, find num pairs that can be reversed
#   - convert from string back to integer and return the integer

# def next_bigger_num(num)
#   digits = num.to_s.split('')
#   max_num = digits.sort { |a, b| b <=> a}.join.to_i
#   return -1 if digits.join.to_i == max_num

#   (num + 1).upto(max_num).each do |curr_num|
#     curr_digits = curr_num.to_s.split('')
#     return curr_num if curr_digits.sort == digits.sort
#   end
# end

# p next_bigger_num(9) == -1
# p next_bigger_num(12) == 21
# p next_bigger_num(513) == 531
# p next_bigger_num(2017) == 2071
# p next_bigger_num(111) == -1
# p next_bigger_num(531) == -1
# p next_bigger_num(123456789) == 123456798
# p next_bigger_num(1432) == 2134


# algorithm
#   find all subarrays of numbers in the array
#   calculate sum of all subarrays and store results
#   return the max sum in the sums array
#   return 0 if input array was empty or none of the sums are positive

# def max_sequence(arr)
#   return 0 if arr.empty? || arr.all? { |num| num < 0 }

#   sums = []

#   (0...arr.length).each do |start_index|
#     (0...arr.length).each do |stop_index|
#       sums << arr[start_index..stop_index].sum
#     end
#   end

#   sums.max 
# end

# p max_sequence([]) == 0
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# p max_sequence([11]) == 11
# p max_sequence([-32]) == 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12


# algorithm
#   starting with the first character of the first string, check if all other strings start with character
#   move to next character and repeat
#   output the prefix once the character stop matching

# def common_prefix(strs)
#   prefix = ''
#   first_str = strs[0]

#   (0...first_str.length).each do |char_index|
#     curr_prefix = first_str[0..char_index]
#     if strs.all? { |str| str[0..char_index] == curr_prefix }
#       prefix = curr_prefix
#     else
#       break
#     end
#   end

#   prefix
# end

# p common_prefix(['flower', 'flow', 'flight']) == 'fl'
# p common_prefix(['dog', 'racecar', 'car']) == ''
# p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
# p common_prefix(['throne', 'dungeon']) == ''
# p common_prefix(['throne', 'throne']) == 'throne'


# inputs - 2 different string objects
# output - boolean true or falsee
# rules
#   - output true if a substring longer than 2 characters exists in both input strings
#   - case does not matter; upper and lowercase are treated the same
#   - input strings can be empty strings
# algorithm
#   - determine smallest string
#   - find all substrings in the smallest string
#   - loop through substrings and see if any appear in the larger input string
#   - return true if substring is found, otherwise return false if loop execution finishes

# def find_substrings(str)
#   substrs = []
  
#   index2_start = 1
#   (0...(str.length - 1)).each do |index1|
#     (index2_start...str.length).each do |index2|
#       substrs << str[index1..index2]
#     end
#     index2_start += 1
#   end

#   substrs
# end

# def substring_test(str1, str2)
#   if str1.length > str2.length
#     substrings = find_substrings(str2.downcase)
#     return true if substrings.any? { |substr| str1.downcase.include?(substr) }
#   else
#     substrings = find_substrings(str1.downcase)
#     return true if substrings.any? { |substr| str2.downcase.include?(substr) }
#   end

#   false
# end

# p substring_test('Something', 'Fun') == false
# p substring_test('Something', 'Home') == true
# p substring_test('Something', 'Fun') == false
# p substring_test('Something', '') == false
# p substring_test('', 'Something') == false
# p substring_test('BANANA', 'banana') == true
# p substring_test('', '') == false
# p substring_test('test', 'lllt') == false
# p substring_test('1234567', '541265') == true
# p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrocious') == true



# algorithm
#   - split both strings in characters
#   - get count of each character in second string
#   - check if matching characters have equal or greater count in first string

# def scramble(str1, str2)
#   str1_chars = str1.downcase.chars
#   str2_chars = str2.downcase.chars
#   str2_letter_counts = Hash.new(0)

#   str2_chars.each { |char| str2_letter_counts[char] += 1 }
#   str1_matching_chars = str1_chars.select { |char| str2.include?(char) }

#   str2_letter_counts.keys.all? { |char| str2_letter_counts[char] <= str1_chars.count(char) }
# end

# p scramble('javaass', 'jiss') == false
# p scramble('rkqodlw', 'world') == true
# p scramble('codewaraaoossoqqyt', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('scriptjava', 'javascript') == true
# p scramble('scriptingjava', 'javascript') == true


# algorithm
# return 0 if string length is 0
# initialize longest palindrome variable and set to 0
# find all possible substrings in the input string
# check for palindromes
# if palindrome is found, replace longest palidrome value with length if length is larger than current value

# def find_substrings(str)
#   substrs = []
    
#   index2_start = 0
#   (0...str.length).each do |index1|
#     (index2_start...str.length).each do |index2|
#       substrs << str[index1..index2]
#     end
#     index2_start += 1
#   end
#   substrs
# end

# def is_palindrome?(str)
#   str.downcase == str.downcase.reverse
# end

# def longest_palindrome(str)
#   longest_palin = 0
#   substrings = find_substrings(str)

#   substrings.each do |substr|
#     if is_palindrome?(substr)
#       longest_palin = substr.length if substr.length > longest_palin
#     end
#   end

#   longest_palin
# end

# p longest_palindrome('a') == 1
# p longest_palindrome('aa') == 2
# p longest_palindrome('baa') == 2
# p longest_palindrome('aab') == 2
# p longest_palindrome('baabcd') == 4
# p longest_palindrome('baablkj12345432133d') == 9


# algorithm
#   - starting at index 0, see if right side equals 0
#   - loop through rest of indices, check if left side equals right side
#   - if index is found, return this index
#   - if loop execution finishes, return -1

# def find_even_index(arr)

#   0.upto(arr.length - 1) do |index|
#     if index == 0
#       return 0 if arr[1..-1].sum == 0
#     elsif index == arr.length - 1
#       return index if arr[0..-2].sum == 0
#     else
#       return index if arr[0...index].sum == arr[index + 1..-1].sum
#     end
#   end

#   -1
# end

# p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
# p find_even_index([1, 100, 50, -51, 1, 1]) == 1
# p find_even_index([1, 2, 3, 4, 5, 6]) == -1
# p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
# p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
# p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
# p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3


# input - array of integers
# output - new array of integers
# rules
#   - in the output array, each element corresponds to the count of unique numbers smaller than element at that index
#   - repeating numbers should only be countd once when comparing numbers
#   - if there are no elements smaller, 0 will be in the output array
# algorithm
#   - loop through each element in the input array
#   - at each element, compare with a set of unique elements in the array, count how many elements are smaller
#   - add count to output array and move to next element

# def smaller_numbers_than_current(arr)
#   # find unique elements
#   unique_eles = []
#   arr.each do |num|
#     unique_eles << num if !unique_eles.include?(num)
#   end

#   arr.map do |num|
#     unique_eles.count { |ele| ele < num }
#   end
# end

# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]


# input - array of integers
# output - integer
# rules
#   - return the minimum sum of 5 consequtive intgers in the input array
#   - input array will only include integers
#   - input array can contain fewer than 5 elements - return nil if so
# algorithm
#   - check length of input array and return nil if less than 5
#   - set current min sum to 0
#   - loop through all but last 4 elements of input array
#   - calculate sum for each set of 5 elements
#   - if sum if lower than current min sum, replace value
#   - return final value for the current min sum variable

# def minimum_sum(arr)
#   return nil if arr.length < 5

#   curr_min_sum = nil
#   stop_index = arr.length - 6

#   (0..stop_index).each do |index|
#     sum = arr[index...(index + 5)].sum
#     curr_min_sum = sum if !curr_min_sum || sum < curr_min_sum
#   end

#   curr_min_sum
# end

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10


# input - string
# output - new string
# rules -
#   - every second character of every third word should be capitalized
#   - other uppercase characters should be left unchanged
#   - 
# algorithm
#   - keep count of word index and loop through words in the input string
#   - at every third word (will be one less for index number), loop through all characters
#   - at every second character (will be every odd index), up case the character

# def to_weird_case(str)
#   words = []

#   str.split.each_with_index do |word, word_index|
#     if (word_index + 1) % 3 == 0
#       new_word = []
#       word.chars.each_with_index do |char, char_index|
#         char_index.odd? ? new_word << char.upcase : new_word << char
#       end
#       new_word = new_word.join

#       words << new_word
#     else
#       words << word
#     end
#   end

#   words.join(' ')
# end

# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'


# input - array of integers
# output - array of 2 integers
# rules -
#   - output the 2 elements that are closest in value in the input array
#   - input arrray will only contain integers
#   - output should be ordered in the order they show in the input array
# algorithm
#   - loop through all but last elements in the array
#   - compare difference between each element with all other elements
#   - if difference is less than current smallest difference, set the new value and store elements
#   - once loop executes, return set of 2 elements

# def closest_numbers(arr)
#   min_diff = arr.max - arr.min + 1
#   min_diff_eles = []
#   mid_index = arr.length / 2

#   (0..arr.length / 2).each do |index1|
#     next_start_index = index1 + 1
#     (next_start_index...arr.length).each do |index2|
#       diff = (arr[index1] - arr[index2]).abs
#       if diff < min_diff
#         min_diff = diff
#         min_diff_eles = [arr[index1], arr[index2]]
#       end
#     end
#   end

#   min_diff_eles
# end

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]


# input - string
# output - string (single character)
# rules
#   - output the character that occurs least in the input string
#   - upper and lowercase are treated equally
#   - ouput lowercase character even if it only occurs as an uppercase letter
#   - if there is a tie, output the character that is found earlier in the string
# algorithm
#   - split string into characters
#   - get counts of all characters
#   - select for the characters that match the minimum count
#   - output the character that has the lowest index

# def least_common_char(str)
#   counts = Hash.new(0)
#   indices = Hash.new(-1)

#   str.downcase.chars.each_with_index do |char, index|
#     counts[char] += 1
#     indices[char] = index if indices[char] == -1
#   end

#   min_count = str.length + 1
#   min_index = str.length
#   min_char = ''

#   counts.keys.each do |char|
#     if counts[char] == min_count
#       min_index = indices[char] if indices[char] < min_index
#       min_char = char if indices[char] < min_index
#     elsif counts[char] < min_count
#       min_count = counts[char]
#       min_index = indices[char]
#       min_char = char
#     end
#   end

#   min_char
# end

# p least_common_char("Hello World") == "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
# p least_common_char("Mississippi") == "m"
# p least_common_char("Happy birthday!") == ' '
# p least_common_char("aaaaaAAAA") == 'a'


# # # Rotation (Part 1)
# def rotate_array(arr)
#   arr[1..-1] + [arr[0]]
# end

# # p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# # p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# # p rotate_array(['a']) == ['a']

# # x = [1, 2, 3, 4]
# # p rotate_array(x) == [2, 3, 4, 1]   # => true
# # p x == [1, 2, 3, 4]                 # => true


# # Rotation (Part 2)
# # algorithm
# #   - convert int to str to array
# #   - retain same order for all but last n (input 2) elements in the array
# #   - call rotate function on subset of array
# #   - combine array into string and convert back to int

# def rotate_rightmost_digits(num, n)
#   digits = num.to_s.chars
#   digits[-n..-1] = rotate_array(digits[-n..-1])
#   digits.join.to_i
# end

# # p rotate_rightmost_digits(735291, 1) == 735291
# # p rotate_rightmost_digits(735291, 2) == 735219
# # p rotate_rightmost_digits(735291, 3) == 735912
# # p rotate_rightmost_digits(735291, 4) == 732915
# # p rotate_rightmost_digits(735291, 5) == 752913
# # p rotate_rightmost_digits(735291, 6) == 352917


# # Rotation (Part 3)
# def max_rotation(num)
#   digits = num.to_s.chars
#   digits.length.downto(1).each do |n|
#     num = rotate_rightmost_digits(num, n)
#   end

#   num
# end

# # p max_rotation(735291) == 321579
# # p max_rotation(3) == 3
# # p max_rotation(35) == 53
# # p max_rotation(105) == 15 # the leading zero gets dropped
# # p max_rotation(8_703_529_146) == 7_321_609_845


# # 1000 Lights
# # input - integer (number of switches and loops)
# # output - array of light numbers that are still on (starts at 1)
# # algorithm
# #   - initialize array of length n of 0s (all lights off)
# #   - loop through array n times
# #   - at each iteration, replace 0 with light number if it will be on
# #   - return array of light numbers that are on

# def switch_lights(num_lights)
#   lights = [0] * num_lights
  
#   1.upto(num_lights).each do |n|
#     (0...num_lights).each do |index|
#       if (index + 1) % n == 0
#         lights[index] == 0 ? lights[index] = index + 1 : lights[index] = 0
#       else
#         next
#       end
#     end
#   end

#   lights.select { |light_num| light_num != 0 }
# end

# # p switch_lights(5)
# # p switch_lights(10)
# # p switch_lights(1000)    


# # Diamonds!
# def diamond(n)
#   num_spaces = (n - 1) / 2
#   num_stars = 1

#   # top half
#   until num_spaces == 0
#     puts "#{' ' * num_spaces}#{'*' * num_stars}"
#     num_stars += 2
#     num_spaces -= 1
#   end

#   puts "#{'*' * n}"
    
#   # bottom half
#   until num_spaces == (n - 1) / 2
#     num_stars -= 2
#     num_spaces += 1
#     puts "#{' ' * num_spaces}#{'*' * num_stars}"
#   end
# end

# # diamond(1)
# # diamond(3)
# # diamond(9)


# # # Fibonacci Numbers (Recursion)
# # def fibonacci(n)
# #   return 1 if n == 1 || n == 2
# #   fibonacci(n - 1) + fibonacci(n - 2)
# # end

# # Fibonacci Numbers (Procedural)
# def fibonacci(n)
#   return 1 if n <= 2
#   prev_num = 1
#   curr_num = 1
#   next_num = 0

#   3.upto(n) do 
#     next_num = prev_num + curr_num
#     prev_num = curr_num
#     curr_num = next_num
#   end

#   next_num
# end


# # p fibonacci(1)
# # p fibonacci(2)
# # p fibonacci(3)
# # p fibonacci(4)
# # p fibonacci(5)
# # p fibonacci(12)
# # p fibonacci(20)
# # p fibonacci(100)
# # p fibonacci(100_001)


# # Fibonacci Numbers (Last Digit)
# def fibonacci_last(n)
#   first, last = [1, 1]
#   3.upto(n) do
#     first, last = [last, (first + last) % 10]
#   end

#   last
# end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4