require 'test_helper'

class TeacherChattingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_chatting = teacher_chattings(:one)
  end

  test "should get index" do
    get teacher_chattings_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_chatting_url
    assert_response :success
  end

  test "should create teacher_chatting" do
    assert_difference('TeacherChatting.count') do
      post teacher_chattings_url, params: { teacher_chatting: { chat_id: @teacher_chatting.chat_id, end_at: @teacher_chatting.end_at, start_at: @teacher_chatting.start_at, teacher_id: @teacher_chatting.teacher_id } }
    end

    assert_redirected_to teacher_chatting_url(TeacherChatting.last)
  end

  test "should show teacher_chatting" do
    get teacher_chatting_url(@teacher_chatting)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_chatting_url(@teacher_chatting)
    assert_response :success
  end

  test "should update teacher_chatting" do
    patch teacher_chatting_url(@teacher_chatting), params: { teacher_chatting: { chat_id: @teacher_chatting.chat_id, end_at: @teacher_chatting.end_at, start_at: @teacher_chatting.start_at, teacher_id: @teacher_chatting.teacher_id } }
    assert_redirected_to teacher_chatting_url(@teacher_chatting)
  end

  test "should destroy teacher_chatting" do
    assert_difference('TeacherChatting.count', -1) do
      delete teacher_chatting_url(@teacher_chatting)
    end

    assert_redirected_to teacher_chattings_url
  end
end
