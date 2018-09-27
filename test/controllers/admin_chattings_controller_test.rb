require 'test_helper'

class AdminChattingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_chatting = admin_chattings(:one)
  end

  test "should get index" do
    get admin_chattings_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_chatting_url
    assert_response :success
  end

  test "should create admin_chatting" do
    assert_difference('AdminChatting.count') do
      post admin_chattings_url, params: { admin_chatting: { admin_id: @admin_chatting.admin_id, chat_id: @admin_chatting.chat_id, end_at: @admin_chatting.end_at, start_at: @admin_chatting.start_at } }
    end

    assert_redirected_to admin_chatting_url(AdminChatting.last)
  end

  test "should show admin_chatting" do
    get admin_chatting_url(@admin_chatting)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_chatting_url(@admin_chatting)
    assert_response :success
  end

  test "should update admin_chatting" do
    patch admin_chatting_url(@admin_chatting), params: { admin_chatting: { admin_id: @admin_chatting.admin_id, chat_id: @admin_chatting.chat_id, end_at: @admin_chatting.end_at, start_at: @admin_chatting.start_at } }
    assert_redirected_to admin_chatting_url(@admin_chatting)
  end

  test "should destroy admin_chatting" do
    assert_difference('AdminChatting.count', -1) do
      delete admin_chatting_url(@admin_chatting)
    end

    assert_redirected_to admin_chattings_url
  end
end
