require "application_system_test_case"

class TreasuresTest < ApplicationSystemTestCase
  setup do
    @treasure = treasures(:one)
  end

  test "visiting the index" do
    visit treasures_url
    assert_selector "h1", text: "Treasures"
  end

  test "should create treasure" do
    visit treasures_url
    click_on "New treasure"

    fill_in "Description", with: @treasure.description
    check "Dlc" if @treasure.dlc
    fill_in "Image url", with: @treasure.image_url
    fill_in "Name", with: @treasure.name
    click_on "Create Treasure"

    assert_text "Treasure was successfully created"
    click_on "Back"
  end

  test "should update Treasure" do
    visit treasure_url(@treasure)
    click_on "Edit this treasure", match: :first

    fill_in "Description", with: @treasure.description
    check "Dlc" if @treasure.dlc
    fill_in "Image url", with: @treasure.image_url
    fill_in "Name", with: @treasure.name
    click_on "Update Treasure"

    assert_text "Treasure was successfully updated"
    click_on "Back"
  end

  test "should destroy Treasure" do
    visit treasure_url(@treasure)
    click_on "Destroy this treasure", match: :first

    assert_text "Treasure was successfully destroyed"
  end
end
