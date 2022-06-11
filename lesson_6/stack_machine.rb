=begin
Stack Machine Interpretation
  stack-and-register implementation in which a stack of valus
  operates on the register value
  
  inputs: string of values and commands
  outputs: only with PRINT command, prints current register value

  rules
  -operations to implements
    - n: place the value in the register; stack is not modified
    - PUSH: push rgister value to stack; register stays at same value
    - ADD: pops value from stack and adds to register; changes register value
    - SUB: similar to add but substracts
    - MULT: similar to add but multiplies
    - DIV: similar to add but divides
    - MOD: stores remainder of the division in the register value
    - POP: removes topmost item in stack and places in register; modifies both
    - PRINT: prints the register value
  -all operations are integer based
- inputs will only be strings and will only be known values
- register will start at a value of 0

test cases
minilang('PRINT') == 0
minilang('5 PUSH 3 MULT PRINT') == 15
minilang('5 PRINT PUSH 3 PRINT ADD PRINT') == 5 3 8
minilang('5 PUSH POP PRINT') == 5
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') == 5 10 4 7
minilang('3 PUSH PUSH 7 DIV MULT PRINT ') == 6
minilang('4 PUSH PUSH 7 MOD MULT PRINT ') == 12
minilang('-3 PUSH 5 SUB PRINT') == 8
minilang('6 PUSH') == 

Datatypes
  stack - array
  register - integer
  input string - split into array and parse for integers/commands strings

Algorithm
  split input string into an array, separate by spaces
  check each input for whether its an integer or a string
  if integer: set register to given value
  if string: perform the command calling the corresponding method
=end

def push(stack, register)
  stack << register
end

def add(stack, register)
  register + stack.pop
end

def subtract(stack, register)
  register - stack.pop
end

def mult(stack, register)
  register * stack.pop
end

def div(stack, register)
  register / stack.pop
end

def mod(stack, register)
  quotient, remainder = register.divmod(stack.pop)
  remainder
end

def print_register(register)
  puts "=> Register value: #{register}"
end

def execute_command(command_str, stack, register)
  case command_str
  when 'PUSH' then push(stack, register)
  when 'ADD'then register = add(stack, register)
  when 'SUB'then register = subtract(stack, register)
  when 'MULT'then register = mult(stack, register)
  when 'DIV' then register = div(stack, register)
  when 'MOD' then register = mod(stack, register)
  when 'POP' then register = stack.pop
  else print_register(register)
  end

  [stack, register]
end 

def minilang(str)
  stack = []
  register = 0
  commands = str.split(' ')

  commands.each do |command|
    if command =~ /^-?\d{1,}$/
      register = command.to_i
    else
      stack, register = execute_command(command, stack, register)
    end
  end
  puts
end


# minilang('PRINT')
# 0

# minilang('5 PUSH 3 MULT PRINT')
# 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

# minilang('5 PUSH POP PRINT')
# 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

# minilang('6 PUSH')
# (nothing printed; no PRINT commands)

