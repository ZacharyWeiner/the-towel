require 'test_helper'

class HousingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @housing = housings(:one)
  end

  test "should get index" do
    get housings_url
    assert_response :success
  end

  test "should get new" do
    get new_housing_url
    assert_response :success
  end

  test "should create housing" do
    assert_difference('Housing.count') do
      post housings_url, params: { housing: { bathrooms: @housing.bathrooms, location_id: @housing.location_id, map: @housing.map, name: @housing.name, neighborhood: @housing.neighborhood, other_details: @housing.other_details, postal_code: @housing.postal_code, rooms: @housing.rooms, street_name: @housing.street_name, street_number: @housing.street_number } }
    end

    assert_redirected_to housing_url(Housing.last)
  end

  test "should show housing" do
    get housing_url(@housing)
    assert_response :success
  end

  test "should get edit" do
    get edit_housing_url(@housing)
    assert_response :success
  end

  test "should update housing" do
    patch housing_url(@housing), params: { housing: { bathrooms: @housing.bathrooms, location_id: @housing.location_id, map: @housing.map, name: @housing.name, neighborhood: @housing.neighborhood, other_details: @housing.other_details, postal_code: @housing.postal_code, rooms: @housing.rooms, street_name: @housing.street_name, street_number: @housing.street_number } }
    assert_redirected_to housing_url(@housing)
  end

  test "should destroy housing" do
    assert_difference('Housing.count', -1) do
      delete housing_url(@housing)
    end

    assert_redirected_to housings_url
  end
end
