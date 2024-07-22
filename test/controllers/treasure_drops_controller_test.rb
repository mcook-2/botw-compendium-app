require "test_helper"

class TreasureDropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treasure_drop = treasure_drops(:one)
  end

  test "should get index" do
    get treasure_drops_url
    assert_response :success
  end

  test "should get new" do
    get new_treasure_drop_url
    assert_response :success
  end

  test "should create treasure_drop" do
    assert_difference("TreasureDrop.count") do
      post treasure_drops_url, params: { treasure_drop: { drop_id: @treasure_drop.drop_id, treasure_id: @treasure_drop.treasure_id } }
    end

    assert_redirected_to treasure_drop_url(TreasureDrop.last)
  end

  test "should show treasure_drop" do
    get treasure_drop_url(@treasure_drop)
    assert_response :success
  end

  test "should get edit" do
    get edit_treasure_drop_url(@treasure_drop)
    assert_response :success
  end

  test "should update treasure_drop" do
    patch treasure_drop_url(@treasure_drop), params: { treasure_drop: { drop_id: @treasure_drop.drop_id, treasure_id: @treasure_drop.treasure_id } }
    assert_redirected_to treasure_drop_url(@treasure_drop)
  end

  test "should destroy treasure_drop" do
    assert_difference("TreasureDrop.count", -1) do
      delete treasure_drop_url(@treasure_drop)
    end

    assert_redirected_to treasure_drops_url
  end
end
