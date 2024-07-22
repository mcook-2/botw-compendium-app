require "test_helper"

class MonsterDropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_drop = monster_drops(:one)
  end

  test "should get index" do
    get monster_drops_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_drop_url
    assert_response :success
  end

  test "should create monster_drop" do
    assert_difference("MonsterDrop.count") do
      post monster_drops_url, params: { monster_drop: { drop_id: @monster_drop.drop_id, monster_id: @monster_drop.monster_id } }
    end

    assert_redirected_to monster_drop_url(MonsterDrop.last)
  end

  test "should show monster_drop" do
    get monster_drop_url(@monster_drop)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_drop_url(@monster_drop)
    assert_response :success
  end

  test "should update monster_drop" do
    patch monster_drop_url(@monster_drop), params: { monster_drop: { drop_id: @monster_drop.drop_id, monster_id: @monster_drop.monster_id } }
    assert_redirected_to monster_drop_url(@monster_drop)
  end

  test "should destroy monster_drop" do
    assert_difference("MonsterDrop.count", -1) do
      delete monster_drop_url(@monster_drop)
    end

    assert_redirected_to monster_drops_url
  end
end
