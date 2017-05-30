# monte_carlo.rb
# TLL 2017/05/23
# runs a series of monte carlo simulations
# of stock trading
# with option to save the results

require 'active_record'
require 'date'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'stss_app_development',
  username: 'markov',
  password: ENV['STSS_APP_DATABASE_PASSWORD']
)

class StssTrade < ActiveRecord::Base
end

def process_file
  starting_value = 100000
  start_date = get_start_date
  #start_date = Date.parse("1996-04-10")
  print "starting value: ", starting_value, " start date: ", start_date, "\n"
end

def get_start_date
  start_date = StssTrade.order(:buy_date).first(1)[0].buy_date
end

process_file
