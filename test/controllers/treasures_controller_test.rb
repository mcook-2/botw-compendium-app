require "test_helper"

class TreasuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treasure = treasures(:one)
  end

  test "should get index" do
    get treasures_url
    assert_response :success
  end

  test "should get new" do
    get new_treasure_url
    assert_response :success
  end

  test "should create treasure" do
    assert_difference("Treasure.count") do
      post treasures_url, params: { treasure: { description: @treasure.description, dlc: @treasure.dlc, image_url: @treasure.image_url, name: @treasure.name } }
    end

    assert_redirected_to treasure_url(Treasure.last)
  end

  test "should show treasure" do
    get treasure_url(@treasure)
    assert_response :success
  end

  test "should get edit" do
    get edit_treasure_url(@treasure)
    assert_response :success
  end

  test "should update treasure" do
    patch treasure_url(@treasure), params: { treasure: { description: @treasure.description, dlc: @treasure.dlc, image_url: @treasure.image_url, name: @treasure.name } }
    assert_redirected_to treasure_url(@treasure)
  end

  test "should destroy treasure" do
    assert_difference("Treasure.count", -1) do
      delete treasure_url(@treasure)
    end

    assert_redirected_to treasures_url
  end
end
