# inputs: loan amount (float), annual percentage rate (percentage, not decimal), loan duration (years)
# outputs: monthly payment

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(str_num)
  num_pattern = /^+?\d{1,}\.?\d{,2}$/
  str_num.match(num_pattern)
end

loan_amount = nil
apr = nil
loan_duration = nil

# get loan amount
loop do
  prompt('Enter your loan amount: ')
  str_loan_amount = gets.chomp
  if valid_number?(str_loan_amount)
    loan_amount = str_loan_amount.to_f
    break
  end
  prompt('Invalid input. Enter only digits and do not include commas.')
end

# get apr
loop do
  prompt('Enter your APR as a percent: ')
  str_apr = gets.chomp
  if valid_number?(str_apr)
    apr = str_apr.to_f / 100
    break
  end
  prompt('Invalid input. Enter your percentage without the percent sign, rounded to 2 decimals.')
end
monthly_apr = apr / 12

# get loan duration
loop do
  prompt('Enter your loan duration in years: ')
  str_loan_duration = gets.chomp
  if valid_number?(str_loan_duration)
    loan_duration = str_loan_duration.to_f * 12
    break
  end
  prompt('Invalid input. That does not look like a number of years.')
end

# calculate monthly payment
monthly_payment = loan_amount * (monthly_apr / (1 - (1 + monthly_apr)**(-loan_duration)))
prompt("Your monthly payment is : $#{monthly_payment.round(2)}")
