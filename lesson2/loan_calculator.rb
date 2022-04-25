=begin
Loan Monthly Payment Calculator App

Takes in user input for the loan amount, apr, and loan duration and
outputs a string with the monthly payment
=end

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def get_message(message_key, language='en')
  MESSAGES[language][message_key]
end

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(str_num)
  num_pattern = /^+?\d{1,}\.?\d{,2}$/
  str_num.match(num_pattern)
end

prompt(get_message('welcome', 'en'))

# main loop
loop do
  loan_amount = nil
  apr = nil
  loan_duration = nil

  # get loan amount
  loop do
    prompt(get_message('loan_amount_input', 'en'))
    str_loan_amount = gets.chomp
    if valid_number?(str_loan_amount)
      loan_amount = str_loan_amount.to_f
      break
    end
    prompt(get_message('invalid_loan_amount', 'en'))
  end

  # get apr
  loop do
    prompt(get_message('apr_input', 'en'))
    str_apr = gets.chomp
    if valid_number?(str_apr)
      apr = str_apr.to_f / 100
      break
    end
    prompt(get_message('invalid_apr', 'en'))
  end
  monthly_apr = apr / 12

  # get loan duration
  loop do
    prompt(get_message('loan_duration_input', 'en'))
    str_loan_duration = gets.chomp
    if valid_number?(str_loan_duration)
      loan_duration = str_loan_duration.to_f * 12
      break
    end
    prompt(get_message('invalid_duration', 'en'))
  end

  # calculate monthly payment
  monthly_payment = loan_amount * (monthly_apr / (1 - (1 + monthly_apr)**(-loan_duration)))
  prompt(get_message('monthly_payment', 'en') + "$#{monthly_payment.round(2)}")

  # determine if another calculation will be performed
  prompt(get_message('repeat', 'en'))
  break if !gets.chomp.downcase.start_with?('y')
end

prompt(get_message('exit', 'en'))
