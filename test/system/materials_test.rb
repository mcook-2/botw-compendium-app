require "application_system_test_case"

class MaterialsTest < ApplicationSystemTestCase
  setup do
    @material = materials(:one)
  end

  test "visiting the index" do
    visit materials_url
    assert_selector "h1", text: "Materials"
  end

  test "should create material" do
    visit materials_url
    click_on "New material"

    fill_in "Cooking effect", with: @material.cooking_effect
    fill_in "Description", with: @material.description
    check "Dlc" if @material.dlc
    fill_in "Hearts recovered", with: @material.hearts_recovered
    fill_in "Image url", with: @material.image_url
    fill_in "Name", with: @material.name
    click_on "Create Material"

    assert_text "Material was successfully created"
    click_on "Back"
  end

  test "should update Material" do
    visit material_url(@material)
    click_on "Edit this material", match: :first

    fill_in "Cooking effect", with: @material.cooking_effect
    fill_in "Description", with: @material.description
    check "Dlc" if @material.dlc
    fill_in "Hearts recovered", with: @material.hearts_recovered
    fill_in "Image url", with: @material.image_url
    fill_in "Name", with: @material.name
    click_on "Update Material"

    assert_text "Material was successfully updated"
    click_on "Back"
  end

  test "should destroy Material" do
    visit material_url(@material)
    click_on "Destroy this material", match: :first

    assert_text "Material was successfully destroyed"
  end
end
