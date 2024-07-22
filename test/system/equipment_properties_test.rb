require "application_system_test_case"

class EquipmentPropertiesTest < ApplicationSystemTestCase
  setup do
    @equipment_property = equipment_properties(:one)
  end

  test "visiting the index" do
    visit equipment_properties_url
    assert_selector "h1", text: "Equipment properties"
  end

  test "should create equipment property" do
    visit equipment_properties_url
    click_on "New equipment property"

    fill_in "Attack", with: @equipment_property.attack
    fill_in "Defense", with: @equipment_property.defense
    fill_in "Equipment", with: @equipment_property.equipment_id
    click_on "Create Equipment property"

    assert_text "Equipment property was successfully created"
    click_on "Back"
  end

  test "should update Equipment property" do
    visit equipment_property_url(@equipment_property)
    click_on "Edit this equipment property", match: :first

    fill_in "Attack", with: @equipment_property.attack
    fill_in "Defense", with: @equipment_property.defense
    fill_in "Equipment", with: @equipment_property.equipment_id
    click_on "Update Equipment property"

    assert_text "Equipment property was successfully updated"
    click_on "Back"
  end

  test "should destroy Equipment property" do
    visit equipment_property_url(@equipment_property)
    click_on "Destroy this equipment property", match: :first

    assert_text "Equipment property was successfully destroyed"
  end
end
