# monte_carlo.rb
# TLL 2017/05/23
# runs a series of monte carlo simulations
# of stock trading
# with option to save the results

require 'date'

def process_file
  starting_value = 10000
  start_date = Date.parse("1996-04-10")
  print "starting value: ", starting_value, " start date: ", start_date, "\n"
end

process_file
