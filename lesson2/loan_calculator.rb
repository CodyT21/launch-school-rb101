# inputs: loan amount (float), annual percentage rate (percentage, not decimal), loan duration (years)
# outputs: monthly payment

# get user input for loan amount
puts 'Enter your loan amount: '
str_loan_amount = gets.chomp
# validate loan amount input
loan_amount = str_loan_amount.to_f

# get user input for apr
puts 'Enter your APR as a percent: '
str_apr = gets.chomp
# validate apr input
apr = str_apr.to_f / 100

# get user input for loan duration
puts 'Enter your loan duration in years: '
str_loan_duration = gets.chomp
# validate loan duration input
loan_duration = str_loan_duration.to_i * 12

# calculate monthly interest rate
monthly_interest_rate = apr / 12

# calculate monthly payment
monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration)))
puts monthly_payment.round(2)