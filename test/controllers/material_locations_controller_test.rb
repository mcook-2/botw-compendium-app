require "test_helper"

class MaterialLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_location = material_locations(:one)
  end

  test "should get index" do
    get material_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_material_location_url
    assert_response :success
  end

  test "should create material_location" do
    assert_difference("MaterialLocation.count") do
      post material_locations_url, params: { material_location: { location_id: @material_location.location_id, material_id: @material_location.material_id } }
    end

    assert_redirected_to material_location_url(MaterialLocation.last)
  end

  test "should show material_location" do
    get material_location_url(@material_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_location_url(@material_location)
    assert_response :success
  end

  test "should update material_location" do
    patch material_location_url(@material_location), params: { material_location: { location_id: @material_location.location_id, material_id: @material_location.material_id } }
    assert_redirected_to material_location_url(@material_location)
  end

  test "should destroy material_location" do
    assert_difference("MaterialLocation.count", -1) do
      delete material_location_url(@material_location)
    end

    assert_redirected_to material_locations_url
  end
end
