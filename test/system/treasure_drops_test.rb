require "application_system_test_case"

class TreasureDropsTest < ApplicationSystemTestCase
  setup do
    @treasure_drop = treasure_drops(:one)
  end

  test "visiting the index" do
    visit treasure_drops_url
    assert_selector "h1", text: "Treasure drops"
  end

  test "should create treasure drop" do
    visit treasure_drops_url
    click_on "New treasure drop"

    fill_in "Drop", with: @treasure_drop.drop_id
    fill_in "Treasure", with: @treasure_drop.treasure_id
    click_on "Create Treasure drop"

    assert_text "Treasure drop was successfully created"
    click_on "Back"
  end

  test "should update Treasure drop" do
    visit treasure_drop_url(@treasure_drop)
    click_on "Edit this treasure drop", match: :first

    fill_in "Drop", with: @treasure_drop.drop_id
    fill_in "Treasure", with: @treasure_drop.treasure_id
    click_on "Update Treasure drop"

    assert_text "Treasure drop was successfully updated"
    click_on "Back"
  end

  test "should destroy Treasure drop" do
    visit treasure_drop_url(@treasure_drop)
    click_on "Destroy this treasure drop", match: :first

    assert_text "Treasure drop was successfully destroyed"
  end
end
