require 'test_helper'

class MonteCarloTest < ActiveSupport::TestCase
  def setup
    @monte = MonteCarlo.new
  end

  test "should be valid" do
    assert @monte.valid?
  end

  test "start date should be present" do
    @monte.start_date = ''
    assert_not @monte.valid?
  end

  test 'start_date before earliest' do
    @monte.start_date = Date.strptime("04/10/1996", "%m/%d/%Y")
    assert_not @monte.valid?
  end

  test 'start_date valid' do
    @monte.start_date = Date.strptime("01/11/2012", "%m/%d/%Y")
    assert @monte.valid?
  end

  test 'start_date after latest' do
    @monte.start_date = Date.strptime("01/21/2012", "%m/%d/%Y")
    assert_not @monte.valid?
  end

  test 'end_date should be present' do
    @monte.end_date = ''
    assert_not @monte.valid?
  end

  test 'end_date before start_date' do
    @monte.start_date = Date.strptime("04/20/1996", "%m/%d/%Y")
    @monte.end_date   = Date.strptime("04/15/1996", "%m/%d/%Y")
    assert_not @monte.valid?
  end

  test 'end_date after latest' do
    @monte.end_date = Date.strptime("01/25/2012", "%m/%d/%Y")
    assert_not @monte.valid?
  end

  test 'runs must be positive' do
    @monte.runs = 0
    assert_not @monte.valid?
  end

  test 'trade_type cannot be blank' do
    @monte.trade_type = ''
    assert_not @monte.valid?
  end

  test 'starting amount must be at least 1000' do
    @monte.starting_amount = 999.99
    assert_not @monte.valid?
  end

  test 'minimum price must be at least 0' do
    @monte.minimum_price = -0.01
    assert_not @monte.valid?
  end

  test 'maximum price must be greater than minimum price' do
    @monte.minimum_price = 2.00
    @monte.maximum_price = 1.01
    assert_not @monte.valid?
  end

  test 'maximum picks must be a positive integer' do
    @monte.max_picks  = 0
    assert_not @monte.valid?
  end

  test 'commission must be greater than or equal to 0' do
    @monte.commission  = -0.01
    assert_not @monte.valid?
  end
end
