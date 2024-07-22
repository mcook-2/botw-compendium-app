require "test_helper"

class TreasureLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treasure_location = treasure_locations(:one)
  end

  test "should get index" do
    get treasure_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_treasure_location_url
    assert_response :success
  end

  test "should create treasure_location" do
    assert_difference("TreasureLocation.count") do
      post treasure_locations_url, params: { treasure_location: { location_id: @treasure_location.location_id, treasure_id: @treasure_location.treasure_id } }
    end

    assert_redirected_to treasure_location_url(TreasureLocation.last)
  end

  test "should show treasure_location" do
    get treasure_location_url(@treasure_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_treasure_location_url(@treasure_location)
    assert_response :success
  end

  test "should update treasure_location" do
    patch treasure_location_url(@treasure_location), params: { treasure_location: { location_id: @treasure_location.location_id, treasure_id: @treasure_location.treasure_id } }
    assert_redirected_to treasure_location_url(@treasure_location)
  end

  test "should destroy treasure_location" do
    assert_difference("TreasureLocation.count", -1) do
      delete treasure_location_url(@treasure_location)
    end

    assert_redirected_to treasure_locations_url
  end
end
