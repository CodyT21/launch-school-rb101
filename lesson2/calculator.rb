# Calculator application for RB101, Lesson 2 Walkthrough
# frozen_string_literal: true

def prompt(message)
  puts "=> #{message}"
end

def valid_int?(num_str)
  int_pattern = /^[+-]?\d{1,}\.?$/
  num_str.match(int_pattern)
end

def valid_float?(num_str)
  float_pattern = /^[+-]?\d{1,}\.\d{1,}$/
  num_str.match(float_pattern)
end

def valid_math_operation?(operation)
  valid_operations = %w[1 2 3 4]
  valid_operations.include?(operation)
end

prompt('Welcome to the calculator app!')
prompt('Functionality is limited to addition, subtraction, multiplication, and
division of 2 numbers (integer or float).')

# main loop
loop do
  num1 = nil
  num2 = nil
  # get the first number from the user
  loop do
    prompt('Enter the first number: ')
    num1_str = gets.chomp
    if valid_int?(num1_str)
      num1 = num1_str.to_i
      break
    elsif valid_float?(num1_str)
      num1 = num1_str.to_f
      break
    else
      prompt('Invalid input. Please input either an integer or a float.')
    end
  end

  # get the second number from the user
  loop do
    prompt('Enter the second number: ')
    num2_str = gets.chomp
    if valid_int?(num2_str)
      num2 = num2_str.to_i
      break
    elsif valid_float?(num2_str)
      num2 = num2_str.to_f
      break
    else
      prompt('Invalid input. Please input either an integer or a float.')
    end
  end

  # get mathematical operation to perform
  math_op = ''
  loop do
    prompt(<<-MSG
      Which mathematical operation would you like to perform?
        1 Add
        2 Subtract
        3 Multiply
        4 Divide
      MSG
          )
    math_op = gets.chomp
    break if valid_math_operation?(math_op)

    prompt('Invalid input. Please enter 1, 2, 3, or 4.')
  end

  # calculate and return result
  result =
    case math_op
    when '1' then num1 + num2
    when '2' then num1 - num2
    when '3' then num1 * num2
    when '4' then num1 / num2.to_f # ensure division is more accurate
    end

  prompt(result)

  prompt('Would you like to perform another calucation? (Enter y to continue)')
  break if !gets.chomp.downcase.start_with?('y')
end

prompt('Thank you for using the calculator app!')
