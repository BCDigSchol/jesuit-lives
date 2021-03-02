require "test_helper"

class JesuitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jesuit = jesuits(:one)
  end

  test "should get index" do
    get jesuits_url
    assert_response :success
  end

  test "should get new" do
    get new_jesuit_url
    assert_response :success
  end

  test "should create jesuit" do
    assert_difference('Jesuit.count') do
      post jesuits_url, params: { jesuit: { birth_date_id: @jesuit.birth_date_id, death_date_id: @jesuit.death_date_id, entrance_date_2_id: @jesuit.entrance_date_2_id, entrance_date_id: @jesuit.entrance_date_id, entrance_province_2_id: @jesuit.entrance_province_2_id, entrance_province_id: @jesuit.entrance_province_id, first_name: @jesuit.first_name, first_name_abbrev: @jesuit.first_name_abbrev, jl_id: @jesuit.jl_id, last_name: @jesuit.last_name, place_of_birth_id: @jesuit.place_of_birth_id, status_id: @jesuit.status_id, title_id: @jesuit.title_id, vow_date_id: @jesuit.vow_date_id } }
    end

    assert_redirected_to jesuit_url(Jesuit.last)
  end

  test "should show jesuit" do
    get jesuit_url(@jesuit)
    assert_response :success
  end

  test "should get edit" do
    get edit_jesuit_url(@jesuit)
    assert_response :success
  end

  test "should update jesuit" do
    patch jesuit_url(@jesuit), params: { jesuit: { birth_date_id: @jesuit.birth_date_id, death_date_id: @jesuit.death_date_id, entrance_date_2_id: @jesuit.entrance_date_2_id, entrance_date_id: @jesuit.entrance_date_id, entrance_province_2_id: @jesuit.entrance_province_2_id, entrance_province_id: @jesuit.entrance_province_id, first_name: @jesuit.first_name, first_name_abbrev: @jesuit.first_name_abbrev, jl_id: @jesuit.jl_id, last_name: @jesuit.last_name, place_of_birth_id: @jesuit.place_of_birth_id, status_id: @jesuit.status_id, title_id: @jesuit.title_id, vow_date_id: @jesuit.vow_date_id } }
    assert_redirected_to jesuit_url(@jesuit)
  end

  test "should destroy jesuit" do
    assert_difference('Jesuit.count', -1) do
      delete jesuit_url(@jesuit)
    end

    assert_redirected_to jesuits_url
  end
end
