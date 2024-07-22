require "application_system_test_case"

class MonsterDropsTest < ApplicationSystemTestCase
  setup do
    @monster_drop = monster_drops(:one)
  end

  test "visiting the index" do
    visit monster_drops_url
    assert_selector "h1", text: "Monster drops"
  end

  test "should create monster drop" do
    visit monster_drops_url
    click_on "New monster drop"

    fill_in "Drop", with: @monster_drop.drop_id
    fill_in "Monster", with: @monster_drop.monster_id
    click_on "Create Monster drop"

    assert_text "Monster drop was successfully created"
    click_on "Back"
  end

  test "should update Monster drop" do
    visit monster_drop_url(@monster_drop)
    click_on "Edit this monster drop", match: :first

    fill_in "Drop", with: @monster_drop.drop_id
    fill_in "Monster", with: @monster_drop.monster_id
    click_on "Update Monster drop"

    assert_text "Monster drop was successfully updated"
    click_on "Back"
  end

  test "should destroy Monster drop" do
    visit monster_drop_url(@monster_drop)
    click_on "Destroy this monster drop", match: :first

    assert_text "Monster drop was successfully destroyed"
  end
end
