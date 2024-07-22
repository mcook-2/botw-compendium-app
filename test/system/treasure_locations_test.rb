require "application_system_test_case"

class TreasureLocationsTest < ApplicationSystemTestCase
  setup do
    @treasure_location = treasure_locations(:one)
  end

  test "visiting the index" do
    visit treasure_locations_url
    assert_selector "h1", text: "Treasure locations"
  end

  test "should create treasure location" do
    visit treasure_locations_url
    click_on "New treasure location"

    fill_in "Location", with: @treasure_location.location_id
    fill_in "Treasure", with: @treasure_location.treasure_id
    click_on "Create Treasure location"

    assert_text "Treasure location was successfully created"
    click_on "Back"
  end

  test "should update Treasure location" do
    visit treasure_location_url(@treasure_location)
    click_on "Edit this treasure location", match: :first

    fill_in "Location", with: @treasure_location.location_id
    fill_in "Treasure", with: @treasure_location.treasure_id
    click_on "Update Treasure location"

    assert_text "Treasure location was successfully updated"
    click_on "Back"
  end

  test "should destroy Treasure location" do
    visit treasure_location_url(@treasure_location)
    click_on "Destroy this treasure location", match: :first

    assert_text "Treasure location was successfully destroyed"
  end
end
