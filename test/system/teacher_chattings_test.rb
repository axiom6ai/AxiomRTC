require "application_system_test_case"

class TeacherChattingsTest < ApplicationSystemTestCase
  setup do
    @teacher_chatting = teacher_chattings(:one)
  end

  test "visiting the index" do
    visit teacher_chattings_url
    assert_selector "h1", text: "Teacher Chattings"
  end

  test "creating a Teacher chatting" do
    visit teacher_chattings_url
    click_on "New Teacher Chatting"

    fill_in "Chat", with: @teacher_chatting.chat_id
    fill_in "End At", with: @teacher_chatting.end_at
    fill_in "Start At", with: @teacher_chatting.start_at
    fill_in "Teacher", with: @teacher_chatting.teacher_id
    click_on "Create Teacher chatting"

    assert_text "Teacher chatting was successfully created"
    click_on "Back"
  end

  test "updating a Teacher chatting" do
    visit teacher_chattings_url
    click_on "Edit", match: :first

    fill_in "Chat", with: @teacher_chatting.chat_id
    fill_in "End At", with: @teacher_chatting.end_at
    fill_in "Start At", with: @teacher_chatting.start_at
    fill_in "Teacher", with: @teacher_chatting.teacher_id
    click_on "Update Teacher chatting"

    assert_text "Teacher chatting was successfully updated"
    click_on "Back"
  end

  test "destroying a Teacher chatting" do
    visit teacher_chattings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teacher chatting was successfully destroyed"
  end
end
