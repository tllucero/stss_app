require 'test_helper'

class StssTradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stss_trade = stss_trades(:one)
  end

  test "should get index" do
    get stss_trades_url
    assert_response :success
  end

#  test "should get new" do
#    get new_stss_trade_url
#    assert_response :success
#  end

#  test "should create stss_trade" do
#    assert_difference('StssTrade.count') do
#      post stss_trades_url, params: { stss_trade: {  } }
#    end

#    assert_redirected_to stss_trade_url(StssTrade.last)
#  end

#  test "should show stss_trade" do
#    get stss_trade_url(@stss_trade)
#    assert_response :success
#  end

#  test "should get edit" do
#    get edit_stss_trade_url(@stss_trade)
#    assert_response :success
#  end

#  test "should update stss_trade" do
#    patch stss_trade_url(@stss_trade), params: { stss_trade: {  } }
#    assert_redirected_to stss_trade_url(@stss_trade)
#  end

#  test "should destroy stss_trade" do
#    assert_difference('StssTrade.count', -1) do
#      delete stss_trade_url(@stss_trade)
#    end

#    assert_redirected_to stss_trades_url
#  end
end
