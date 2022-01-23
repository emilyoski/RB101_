# building a mortgage calculator
system 'clear'

def prompt(words)
  puts "-> #{words}"
end

def valid_input?(num)
  if num >= 0
    "yes"
  else
    "no"
  end
end

prompt("Welcome to the Mortgage Calculator!")

loan_amount = 0
annual_rate = 0
loan_dur_years = 0

loop do
  prompt("Please enter your loan amount in dollars.")
  loan_amount = gets.chomp.to_i

  break if valid_input?(loan_amount) == 'yes'
  prompt("Invalid input. Please enter your information again.")
end

loop do
  prompt("Please enter your Annual Percentage Rate (APR) in %.")
  annual_rate = gets.chomp.to_f

  break if valid_input?(annual_rate) == 'yes'
  prompt("Invalid input. Please enter your information again.")
end

loop do
  prompt("Please enter your loan duration in years.")
  loan_dur_years = gets.chomp.to_i

  break if valid_input?(loan_dur_years) == 'yes'
  prompt("Invalid input. Please enter your information again.")
end

month_rate_display = annual_rate / 12
month_rate_use = (annual_rate / 12) * 0.01
loan_dur_month = loan_dur_years * 12

if month_rate_use > 0
  month_payment = loan_amount *
                 (month_rate_use / (1 - (1 + month_rate_use)**(-loan_dur_month)))
else
  month_payment = loan_amount / loan_dur_month
end

prompt("Your monthly interest rate is: #{month_rate_display}%.")
prompt("Your loan duration in months is: #{loan_dur_month} months.")
prompt("Your monthly payment is: $#{format('%.2f', month_payment)}.")
