require "application_system_test_case"

class MonsterLocationsTest < ApplicationSystemTestCase
  setup do
    @monster_location = monster_locations(:one)
  end

  test "visiting the index" do
    visit monster_locations_url
    assert_selector "h1", text: "Monster locations"
  end

  test "should create monster location" do
    visit monster_locations_url
    click_on "New monster location"

    fill_in "Location", with: @monster_location.location_id
    fill_in "Monster", with: @monster_location.monster_id
    click_on "Create Monster location"

    assert_text "Monster location was successfully created"
    click_on "Back"
  end

  test "should update Monster location" do
    visit monster_location_url(@monster_location)
    click_on "Edit this monster location", match: :first

    fill_in "Location", with: @monster_location.location_id
    fill_in "Monster", with: @monster_location.monster_id
    click_on "Update Monster location"

    assert_text "Monster location was successfully updated"
    click_on "Back"
  end

  test "should destroy Monster location" do
    visit monster_location_url(@monster_location)
    click_on "Destroy this monster location", match: :first

    assert_text "Monster location was successfully destroyed"
  end
end
