require "application_system_test_case"

class AdminChattingsTest < ApplicationSystemTestCase
  setup do
    @admin_chatting = admin_chattings(:one)
  end

  test "visiting the index" do
    visit admin_chattings_url
    assert_selector "h1", text: "Admin Chattings"
  end

  test "creating a Admin chatting" do
    visit admin_chattings_url
    click_on "New Admin Chatting"

    fill_in "Admin", with: @admin_chatting.admin_id
    fill_in "Chat", with: @admin_chatting.chat_id
    fill_in "End At", with: @admin_chatting.end_at
    fill_in "Start At", with: @admin_chatting.start_at
    click_on "Create Admin chatting"

    assert_text "Admin chatting was successfully created"
    click_on "Back"
  end

  test "updating a Admin chatting" do
    visit admin_chattings_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @admin_chatting.admin_id
    fill_in "Chat", with: @admin_chatting.chat_id
    fill_in "End At", with: @admin_chatting.end_at
    fill_in "Start At", with: @admin_chatting.start_at
    click_on "Update Admin chatting"

    assert_text "Admin chatting was successfully updated"
    click_on "Back"
  end

  test "destroying a Admin chatting" do
    visit admin_chattings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admin chatting was successfully destroyed"
  end
end
