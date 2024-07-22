require "application_system_test_case"

class MaterialLocationsTest < ApplicationSystemTestCase
  setup do
    @material_location = material_locations(:one)
  end

  test "visiting the index" do
    visit material_locations_url
    assert_selector "h1", text: "Material locations"
  end

  test "should create material location" do
    visit material_locations_url
    click_on "New material location"

    fill_in "Location", with: @material_location.location_id
    fill_in "Material", with: @material_location.material_id
    click_on "Create Material location"

    assert_text "Material location was successfully created"
    click_on "Back"
  end

  test "should update Material location" do
    visit material_location_url(@material_location)
    click_on "Edit this material location", match: :first

    fill_in "Location", with: @material_location.location_id
    fill_in "Material", with: @material_location.material_id
    click_on "Update Material location"

    assert_text "Material location was successfully updated"
    click_on "Back"
  end

  test "should destroy Material location" do
    visit material_location_url(@material_location)
    click_on "Destroy this material location", match: :first

    assert_text "Material location was successfully destroyed"
  end
end
