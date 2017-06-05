require 'test_helper'

class MonteCarloControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get monte_carlo_new_url
    assert_response :success
    assert_select "title", "Monte Carlo Simulation"
  end

  test "should have submit button" do
    get monte_carlo_new_url
    #assert_select
  end

end
