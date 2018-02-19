require 'test_helper'

class MonteCarloControllerTest < ActionDispatch::IntegrationTest
  def setup
    @monte_carlo = MonteCarlo.new
  end

  test "should get new" do
    get '/'
    assert_response :success
    assert_select "title", "Monte Carlo Simulation"
  end

  test "should have submit button" do
    get '/'
    assert_select 'div.actions'
  end

  test 'should have invalid runs' do
    @monte_carlo.runs = -1
    post monte_carlo_new_url
#    post '/'
    assert_not @monte_carlo.valid?
    assert_template 'monte_carlo/new'
  end

  test 'should have valid data' do
    post monte_carlo_new_url
#    post '/'
    assert @monte_carlo.valid?

  end
end
