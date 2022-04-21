# Calculator application for RB101, Lesson 2 Walkthrough

def get_user_number()
  print "Enter the number: "
  num_str = gets.chomp
end

def is_valid_number?(num)
  # TO DO
end

# get 2 numbers from user
num1_str = get_user_number()
num2_str = get_user_number()

num1 = num1_str.match(/\d[.]\d/) ? num1_str.to_f : num1_str.to_i
num2 = num2_str.match(/\d[.]\d/) ? num2_str.to_f : num2_str.to_i

# get mathematical operation to perform
valid_operations = ["add", "subtract", "multiply", "divide"]
calc_operation = ""

until valid_operations.include?(calc_operation)
  puts "Enter the operation to perform (add, subtract, multiply, or divide): "
  calc_operation = gets.chomp.downcase
end

# calculate and return result
result = nil
case calc_operation
when "add" then result = num1 + num2
when "subtract" then result = num1 - num2
when "multiply" then result = num1 * num2
when "divide" then result = num1.to_f / num2.to_f
end

puts result