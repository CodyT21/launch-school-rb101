=begin
Loan Monthly Payment Calculator App

Takes in user input for the loan amount, apr, and loan duration and
outputs a string with the monthly payment
=end

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(str_num)
  num_pattern = /^+?\d{1,}\.?\d{,2}$/
  str_num.match(num_pattern)
end

prompt(MESSAGES['welcome'])

loan_amount = nil
apr = nil
loan_duration = nil

# get loan amount
loop do
  prompt(MESSAGES['loan_amount_input'])
  str_loan_amount = gets.chomp
  if valid_number?(str_loan_amount)
    loan_amount = str_loan_amount.to_f
    break
  end
  prompt(MESSAGES['invalid_loan_amount'])
end

# get apr
loop do
  prompt(MESSAGES['apr_input'])
  str_apr = gets.chomp
  if valid_number?(str_apr)
    apr = str_apr.to_f / 100
    break
  end
  prompt(MESSAGES['invalid_apr'])
end
monthly_apr = apr / 12

# get loan duration
loop do
  prompt(MESSAGES['loan_duration_input'])
  str_loan_duration = gets.chomp
  if valid_number?(str_loan_duration)
    loan_duration = str_loan_duration.to_f * 12
    break
  end
  prompt(MESSAGES['invalid_duration'])
end

# calculate monthly payment
monthly_payment = loan_amount * (monthly_apr / (1 - (1 + monthly_apr)**(-loan_duration)))
prompt(MESSAGES['monthly_payment'] + "$#{monthly_payment.round(2)}")
