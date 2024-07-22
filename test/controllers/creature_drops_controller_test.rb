require "test_helper"

class CreatureDropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creature_drop = creature_drops(:one)
  end

  test "should get index" do
    get creature_drops_url
    assert_response :success
  end

  test "should get new" do
    get new_creature_drop_url
    assert_response :success
  end

  test "should create creature_drop" do
    assert_difference("CreatureDrop.count") do
      post creature_drops_url, params: { creature_drop: { creature_id: @creature_drop.creature_id, drop_id: @creature_drop.drop_id } }
    end

    assert_redirected_to creature_drop_url(CreatureDrop.last)
  end

  test "should show creature_drop" do
    get creature_drop_url(@creature_drop)
    assert_response :success
  end

  test "should get edit" do
    get edit_creature_drop_url(@creature_drop)
    assert_response :success
  end

  test "should update creature_drop" do
    patch creature_drop_url(@creature_drop), params: { creature_drop: { creature_id: @creature_drop.creature_id, drop_id: @creature_drop.drop_id } }
    assert_redirected_to creature_drop_url(@creature_drop)
  end

  test "should destroy creature_drop" do
    assert_difference("CreatureDrop.count", -1) do
      delete creature_drop_url(@creature_drop)
    end

    assert_redirected_to creature_drops_url
  end
end
