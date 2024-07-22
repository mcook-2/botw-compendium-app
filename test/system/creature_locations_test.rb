require "application_system_test_case"

class CreatureLocationsTest < ApplicationSystemTestCase
  setup do
    @creature_location = creature_locations(:one)
  end

  test "visiting the index" do
    visit creature_locations_url
    assert_selector "h1", text: "Creature locations"
  end

  test "should create creature location" do
    visit creature_locations_url
    click_on "New creature location"

    fill_in "Creature", with: @creature_location.creature_id
    fill_in "Location", with: @creature_location.location_id
    click_on "Create Creature location"

    assert_text "Creature location was successfully created"
    click_on "Back"
  end

  test "should update Creature location" do
    visit creature_location_url(@creature_location)
    click_on "Edit this creature location", match: :first

    fill_in "Creature", with: @creature_location.creature_id
    fill_in "Location", with: @creature_location.location_id
    click_on "Update Creature location"

    assert_text "Creature location was successfully updated"
    click_on "Back"
  end

  test "should destroy Creature location" do
    visit creature_location_url(@creature_location)
    click_on "Destroy this creature location", match: :first

    assert_text "Creature location was successfully destroyed"
  end
end
