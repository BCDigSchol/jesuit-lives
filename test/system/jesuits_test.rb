require "application_system_test_case"

class JesuitsTest < ApplicationSystemTestCase
  setup do
    @jesuit = jesuits(:one)
  end

  test "visiting the index" do
    visit jesuits_url
    assert_selector "h1", text: "Jesuits"
  end

  test "creating a Jesuit" do
    visit jesuits_url
    click_on "New Jesuit"

    fill_in "Birth date", with: @jesuit.birth_date_id
    fill_in "Death date", with: @jesuit.death_date_id
    fill_in "Entrance date 2", with: @jesuit.entrance_date_2_id
    fill_in "Entrance date", with: @jesuit.entrance_date_id
    fill_in "Entrance province 2", with: @jesuit.entrance_province_2_id
    fill_in "Entrance province", with: @jesuit.entrance_province_id
    fill_in "First name", with: @jesuit.first_name
    fill_in "First name abbrev", with: @jesuit.first_name_abbrev
    fill_in "Jl", with: @jesuit.jl_id
    fill_in "Last name", with: @jesuit.last_name
    fill_in "Place of birth", with: @jesuit.place_of_birth_id
    fill_in "Status", with: @jesuit.status_id
    fill_in "Title", with: @jesuit.title_id
    fill_in "Vow date", with: @jesuit.vow_date_id
    click_on "Create Jesuit"

    assert_text "Jesuit was successfully created"
    click_on "Back"
  end

  test "updating a Jesuit" do
    visit jesuits_url
    click_on "Edit", match: :first

    fill_in "Birth date", with: @jesuit.birth_date_id
    fill_in "Death date", with: @jesuit.death_date_id
    fill_in "Entrance date 2", with: @jesuit.entrance_date_2_id
    fill_in "Entrance date", with: @jesuit.entrance_date_id
    fill_in "Entrance province 2", with: @jesuit.entrance_province_2_id
    fill_in "Entrance province", with: @jesuit.entrance_province_id
    fill_in "First name", with: @jesuit.first_name
    fill_in "First name abbrev", with: @jesuit.first_name_abbrev
    fill_in "Jl", with: @jesuit.jl_id
    fill_in "Last name", with: @jesuit.last_name
    fill_in "Place of birth", with: @jesuit.place_of_birth_id
    fill_in "Status", with: @jesuit.status_id
    fill_in "Title", with: @jesuit.title_id
    fill_in "Vow date", with: @jesuit.vow_date_id
    click_on "Update Jesuit"

    assert_text "Jesuit was successfully updated"
    click_on "Back"
  end

  test "destroying a Jesuit" do
    visit jesuits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jesuit was successfully destroyed"
  end
end
