require "application_system_test_case"

class CommitmentsTest < ApplicationSystemTestCase
  setup do
    @commitment = commitments(:one)
  end

  test "visiting the index" do
    visit commitments_url
    assert_selector "h1", text: "Commitments"
  end

  test "creating a Commitment" do
    visit commitments_url
    click_on "New Commitment"

    fill_in "Action", with: @commitment.action
    fill_in "Content", with: @commitment.content
    fill_in "Due date", with: @commitment.due_date
    fill_in "Initiative", with: @commitment.initiative_id
    fill_in "Start date", with: @commitment.start_date
    fill_in "User", with: @commitment.user_id
    click_on "Create Commitment"

    assert_text "Commitment was successfully created"
    click_on "Back"
  end

  test "updating a Commitment" do
    visit commitments_url
    click_on "Edit", match: :first

    fill_in "Action", with: @commitment.action
    fill_in "Content", with: @commitment.content
    fill_in "Due date", with: @commitment.due_date
    fill_in "Initiative", with: @commitment.initiative_id
    fill_in "Start date", with: @commitment.start_date
    fill_in "User", with: @commitment.user_id
    click_on "Update Commitment"

    assert_text "Commitment was successfully updated"
    click_on "Back"
  end

  test "destroying a Commitment" do
    visit commitments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Commitment was successfully destroyed"
  end
end
