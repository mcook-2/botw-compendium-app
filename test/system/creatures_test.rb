require "application_system_test_case"

class CreaturesTest < ApplicationSystemTestCase
  setup do
    @creature = creatures(:one)
  end

  test "visiting the index" do
    visit creatures_url
    assert_selector "h1", text: "Creatures"
  end

  test "should create creature" do
    visit creatures_url
    click_on "New creature"

    fill_in "Cooking effect", with: @creature.cooking_effect
    fill_in "Description", with: @creature.description
    check "Dlc" if @creature.dlc
    check "Edible" if @creature.edible
    fill_in "Hearts recovered", with: @creature.hearts_recovered
    fill_in "Image url", with: @creature.image_url
    fill_in "Name", with: @creature.name
    click_on "Create Creature"

    assert_text "Creature was successfully created"
    click_on "Back"
  end

  test "should update Creature" do
    visit creature_url(@creature)
    click_on "Edit this creature", match: :first

    fill_in "Cooking effect", with: @creature.cooking_effect
    fill_in "Description", with: @creature.description
    check "Dlc" if @creature.dlc
    check "Edible" if @creature.edible
    fill_in "Hearts recovered", with: @creature.hearts_recovered
    fill_in "Image url", with: @creature.image_url
    fill_in "Name", with: @creature.name
    click_on "Update Creature"

    assert_text "Creature was successfully updated"
    click_on "Back"
  end

  test "should destroy Creature" do
    visit creature_url(@creature)
    click_on "Destroy this creature", match: :first

    assert_text "Creature was successfully destroyed"
  end
end
