require "application_system_test_case"

class StudentChattingsTest < ApplicationSystemTestCase
  setup do
    @student_chatting = student_chattings(:one)
  end

  test "visiting the index" do
    visit student_chattings_url
    assert_selector "h1", text: "Student Chattings"
  end

  test "creating a Student chatting" do
    visit student_chattings_url
    click_on "New Student Chatting"

    fill_in "Chat", with: @student_chatting.chat_id
    fill_in "End At", with: @student_chatting.end_at
    fill_in "Start At", with: @student_chatting.start_at
    fill_in "Student", with: @student_chatting.student_id
    click_on "Create Student chatting"

    assert_text "Student chatting was successfully created"
    click_on "Back"
  end

  test "updating a Student chatting" do
    visit student_chattings_url
    click_on "Edit", match: :first

    fill_in "Chat", with: @student_chatting.chat_id
    fill_in "End At", with: @student_chatting.end_at
    fill_in "Start At", with: @student_chatting.start_at
    fill_in "Student", with: @student_chatting.student_id
    click_on "Update Student chatting"

    assert_text "Student chatting was successfully updated"
    click_on "Back"
  end

  test "destroying a Student chatting" do
    visit student_chattings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student chatting was successfully destroyed"
  end
end
