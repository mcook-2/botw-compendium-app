require "application_system_test_case"

class EquipmentLocationsTest < ApplicationSystemTestCase
  setup do
    @equipment_location = equipment_locations(:one)
  end

  test "visiting the index" do
    visit equipment_locations_url
    assert_selector "h1", text: "Equipment locations"
  end

  test "should create equipment location" do
    visit equipment_locations_url
    click_on "New equipment location"

    fill_in "Equipment", with: @equipment_location.equipment_id
    fill_in "Location", with: @equipment_location.location_id
    click_on "Create Equipment location"

    assert_text "Equipment location was successfully created"
    click_on "Back"
  end

  test "should update Equipment location" do
    visit equipment_location_url(@equipment_location)
    click_on "Edit this equipment location", match: :first

    fill_in "Equipment", with: @equipment_location.equipment_id
    fill_in "Location", with: @equipment_location.location_id
    click_on "Update Equipment location"

    assert_text "Equipment location was successfully updated"
    click_on "Back"
  end

  test "should destroy Equipment location" do
    visit equipment_location_url(@equipment_location)
    click_on "Destroy this equipment location", match: :first

    assert_text "Equipment location was successfully destroyed"
  end
end
