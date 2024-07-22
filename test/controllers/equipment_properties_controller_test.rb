require "test_helper"

class EquipmentPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment_property = equipment_properties(:one)
  end

  test "should get index" do
    get equipment_properties_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_property_url
    assert_response :success
  end

  test "should create equipment_property" do
    assert_difference("EquipmentProperty.count") do
      post equipment_properties_url, params: { equipment_property: { attack: @equipment_property.attack, defense: @equipment_property.defense, equipment_id: @equipment_property.equipment_id } }
    end

    assert_redirected_to equipment_property_url(EquipmentProperty.last)
  end

  test "should show equipment_property" do
    get equipment_property_url(@equipment_property)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_property_url(@equipment_property)
    assert_response :success
  end

  test "should update equipment_property" do
    patch equipment_property_url(@equipment_property), params: { equipment_property: { attack: @equipment_property.attack, defense: @equipment_property.defense, equipment_id: @equipment_property.equipment_id } }
    assert_redirected_to equipment_property_url(@equipment_property)
  end

  test "should destroy equipment_property" do
    assert_difference("EquipmentProperty.count", -1) do
      delete equipment_property_url(@equipment_property)
    end

    assert_redirected_to equipment_properties_url
  end
end
