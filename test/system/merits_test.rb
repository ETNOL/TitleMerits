require "application_system_test_case"

class MeritsTest < ApplicationSystemTestCase
  setup do
    @merit = merits(:one)
  end

  test "visiting the index" do
    visit merits_url
    assert_selector "h1", text: "Merits"
  end

  test "creating a Merit" do
    visit merits_url
    click_on "New Merit"

    fill_in "Name", with: @merit.name
    click_on "Create Merit"

    assert_text "Merit was successfully created"
    click_on "Back"
  end

  test "updating a Merit" do
    visit merits_url
    click_on "Edit", match: :first

    fill_in "Name", with: @merit.name
    click_on "Update Merit"

    assert_text "Merit was successfully updated"
    click_on "Back"
  end

  test "destroying a Merit" do
    visit merits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Merit was successfully destroyed"
  end
end
