require "test_helper"

class EquipmentLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment_location = equipment_locations(:one)
  end

  test "should get index" do
    get equipment_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_location_url
    assert_response :success
  end

  test "should create equipment_location" do
    assert_difference("EquipmentLocation.count") do
      post equipment_locations_url, params: { equipment_location: { equipment_id: @equipment_location.equipment_id, location_id: @equipment_location.location_id } }
    end

    assert_redirected_to equipment_location_url(EquipmentLocation.last)
  end

  test "should show equipment_location" do
    get equipment_location_url(@equipment_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_location_url(@equipment_location)
    assert_response :success
  end

  test "should update equipment_location" do
    patch equipment_location_url(@equipment_location), params: { equipment_location: { equipment_id: @equipment_location.equipment_id, location_id: @equipment_location.location_id } }
    assert_redirected_to equipment_location_url(@equipment_location)
  end

  test "should destroy equipment_location" do
    assert_difference("EquipmentLocation.count", -1) do
      delete equipment_location_url(@equipment_location)
    end

    assert_redirected_to equipment_locations_url
  end
end
