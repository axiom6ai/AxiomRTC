require 'test_helper'

class StudentChattingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_chatting = student_chattings(:one)
  end

  test "should get index" do
    get student_chattings_url
    assert_response :success
  end

  test "should get new" do
    get new_student_chatting_url
    assert_response :success
  end

  test "should create student_chatting" do
    assert_difference('StudentChatting.count') do
      post student_chattings_url, params: { student_chatting: { chat_id: @student_chatting.chat_id, end_at: @student_chatting.end_at, start_at: @student_chatting.start_at, student_id: @student_chatting.student_id } }
    end

    assert_redirected_to student_chatting_url(StudentChatting.last)
  end

  test "should show student_chatting" do
    get student_chatting_url(@student_chatting)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_chatting_url(@student_chatting)
    assert_response :success
  end

  test "should update student_chatting" do
    patch student_chatting_url(@student_chatting), params: { student_chatting: { chat_id: @student_chatting.chat_id, end_at: @student_chatting.end_at, start_at: @student_chatting.start_at, student_id: @student_chatting.student_id } }
    assert_redirected_to student_chatting_url(@student_chatting)
  end

  test "should destroy student_chatting" do
    assert_difference('StudentChatting.count', -1) do
      delete student_chatting_url(@student_chatting)
    end

    assert_redirected_to student_chattings_url
  end
end
