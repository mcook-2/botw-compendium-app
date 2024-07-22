require "test_helper"

class MonsterLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_location = monster_locations(:one)
  end

  test "should get index" do
    get monster_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_location_url
    assert_response :success
  end

  test "should create monster_location" do
    assert_difference("MonsterLocation.count") do
      post monster_locations_url, params: { monster_location: { location_id: @monster_location.location_id, monster_id: @monster_location.monster_id } }
    end

    assert_redirected_to monster_location_url(MonsterLocation.last)
  end

  test "should show monster_location" do
    get monster_location_url(@monster_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_location_url(@monster_location)
    assert_response :success
  end

  test "should update monster_location" do
    patch monster_location_url(@monster_location), params: { monster_location: { location_id: @monster_location.location_id, monster_id: @monster_location.monster_id } }
    assert_redirected_to monster_location_url(@monster_location)
  end

  test "should destroy monster_location" do
    assert_difference("MonsterLocation.count", -1) do
      delete monster_location_url(@monster_location)
    end

    assert_redirected_to monster_locations_url
  end
end
