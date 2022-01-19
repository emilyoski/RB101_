# building a mortgage calculator

def prompt(words)
  puts "-> #{words}"
end

prompt("Welcome to the Mortgage Calculator!")

loan_amount = 0
annual_rate = 0
loan_dur_years = 0

loop do
  prompt("Please enter your loan amount in dollars.")
  loan_amount = gets.chomp.to_i

  prompt("Please enter your Annual Percentage Rate (APR) in %.")
  annual_rate = gets.chomp.to_f

  prompt("Please enter your loan duration in years.")
  loan_dur_years = gets.chomp.to_i

  break if (loan_amount > 0) && (annual_rate > 0) && (loan_dur_years > 0)

  prompt("Invalid input. Please enter your information again.")
end

month_rate_display = annual_rate / 12
month_rate_use = (annual_rate / 12) * 0.01
loan_dur_month = loan_dur_years * 12
month_payment = loan_amount *
                (month_rate_use / (1 - (1 + month_rate_use)**(-loan_dur_month)))

prompt("Your monthly interest rate is: #{month_rate_display}%.")
prompt("Your loan duration in months is: #{loan_dur_month} months.")
prompt("Your monthly payment is: $#{month_payment}.")
