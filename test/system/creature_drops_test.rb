require "application_system_test_case"

class CreatureDropsTest < ApplicationSystemTestCase
  setup do
    @creature_drop = creature_drops(:one)
  end

  test "visiting the index" do
    visit creature_drops_url
    assert_selector "h1", text: "Creature drops"
  end

  test "should create creature drop" do
    visit creature_drops_url
    click_on "New creature drop"

    fill_in "Creature", with: @creature_drop.creature_id
    fill_in "Drop", with: @creature_drop.drop_id
    click_on "Create Creature drop"

    assert_text "Creature drop was successfully created"
    click_on "Back"
  end

  test "should update Creature drop" do
    visit creature_drop_url(@creature_drop)
    click_on "Edit this creature drop", match: :first

    fill_in "Creature", with: @creature_drop.creature_id
    fill_in "Drop", with: @creature_drop.drop_id
    click_on "Update Creature drop"

    assert_text "Creature drop was successfully updated"
    click_on "Back"
  end

  test "should destroy Creature drop" do
    visit creature_drop_url(@creature_drop)
    click_on "Destroy this creature drop", match: :first

    assert_text "Creature drop was successfully destroyed"
  end
end
