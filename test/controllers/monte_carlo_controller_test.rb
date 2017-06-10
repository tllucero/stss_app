require 'test_helper'

class MonteCarloControllerTest < ActionDispatch::IntegrationTest
  def setup
    @monte = MonteCarlo.new
  end

  test "should get new" do
    get monte_carlo_new_url
    assert_response :success
    assert_select "title", "Monte Carlo Simulation"
  end

  test "should have submit button" do
    get monte_carlo_new_url
    assert_select 'div.actions'
  end

  test 'should have invalid runs' do
    @monte.runs = -1
    post monte_carlo_new_url
    assert_not @monte.valid?
    assert_template 'monte_carlo/new'
  end

  test 'should have valid data' do
    post monte_carlo_new_url
    assert @monte.valid?

  end
end
