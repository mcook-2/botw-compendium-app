require "test_helper"

class CreatureLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creature_location = creature_locations(:one)
  end

  test "should get index" do
    get creature_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_creature_location_url
    assert_response :success
  end

  test "should create creature_location" do
    assert_difference("CreatureLocation.count") do
      post creature_locations_url, params: { creature_location: { creature_id: @creature_location.creature_id, location_id: @creature_location.location_id } }
    end

    assert_redirected_to creature_location_url(CreatureLocation.last)
  end

  test "should show creature_location" do
    get creature_location_url(@creature_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_creature_location_url(@creature_location)
    assert_response :success
  end

  test "should update creature_location" do
    patch creature_location_url(@creature_location), params: { creature_location: { creature_id: @creature_location.creature_id, location_id: @creature_location.location_id } }
    assert_redirected_to creature_location_url(@creature_location)
  end

  test "should destroy creature_location" do
    assert_difference("CreatureLocation.count", -1) do
      delete creature_location_url(@creature_location)
    end

    assert_redirected_to creature_locations_url
  end
end
