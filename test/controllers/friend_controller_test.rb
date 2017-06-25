require 'test_helper'

class FriendControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friend_index_url
    assert_response :success
  end

  test "should get index" do
    get friend_index_url
    assert_response :success
  end

  test "should get show" do
    get friend_show_url
    assert_response :success
  end

  test "should get friend_request" do
    get friend_friend_request_url
    assert_response :success
  end

  test "should get friend_accept" do
    get friend_friend_accept_url
    assert_response :success
  end

  test "should get friend_deny" do
    get friend_friend_deny_url
    assert_response :success
  end

  test "should get un_friend" do
    get friend_un_friend_url
    assert_response :success
  end

end
