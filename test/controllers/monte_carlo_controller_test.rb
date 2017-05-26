require 'test_helper'

class MonteCarloControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get monte_carlo_home_url
    assert_response :success
  end

end
