require 'active_record'
require 'date'

def process_file
  inputFile = '/srv/Markets/STSS/History/2012/STSS-hist-2012-01-25.clean.txt'
  puts inputFile
  # max_diff = 0
  stss_trades = []

  File.readlines(inputFile).drop(2).each.with_index do |line, line_num|
    puts "#{line_num}: #{line}"
    # test_line(line)
    process_line(line)

    trade = line.split("\t")
    stss_trade = StssTrade.new

#    exit if line_num >= 0
  end
end

def process_line(line)
  trade = line.split("\t")

  stss_trade = StssTrade.new
  stss_trade.id = trade[0]
  stss_trade.trade_type = trade[1]
  stss_trade.ticker = trade[2]
  stss_trade.buy_date = Date.strptime(trade[3], "%m/%d/%Y")
  stss_trade.buy_price = trade[4].to_f
  stss_trade.sell_date = Date.strptime(trade[5], "%m/%d/%Y")
  stss_trade.sell_price = trade[6].to_f

  loss = trade[8].to_f
  if loss  < 0
    stss_trade.gain = loss
  else
    stss_trade.gain = trade[7].to_f
  end

  stss_trade.days = trade[9].to_i
  stss_trade.save
end

def test_line(line)
  trade = line.split("\t")
  # puts 'trade: ', trade
  loss = trade[8].to_f
  if loss  < 0
    gain = loss
  else
    gain = trade[7].to_f
  end
  buy_price = trade[4].to_f
  sell_price = trade[6].to_f
  calc_gain = ((sell_price - buy_price)/buy_price * 100).round(2)
  if gain != calc_gain
#    print "gain: ", gain, " calc_gain: ", calc_gain, "\n"
    diff = (gain  - calc_gain).abs
    if max_diff < diff
      max_diff = diff
      print trade[0], " ", max_diff, "\n"
    end
  end
  trade.slice!(7..8)
  # puts 'trade: ', trade
end

process_file
