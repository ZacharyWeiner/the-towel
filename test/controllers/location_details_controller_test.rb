require 'test_helper'

class LocationDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_detail = location_details(:one)
  end

  test "should get index" do
    get location_details_url
    assert_response :success
  end

  test "should get new" do
    get new_location_detail_url
    assert_response :success
  end

  test "should create location_detail" do
    assert_difference('LocationDetail.count') do
      post location_details_url, params: { location_detail: { description: @location_detail.description, image: @location_detail.image, location_id: @location_detail.location_id } }
    end

    assert_redirected_to location_detail_url(LocationDetail.last)
  end

  test "should show location_detail" do
    get location_detail_url(@location_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_detail_url(@location_detail)
    assert_response :success
  end

  test "should update location_detail" do
    patch location_detail_url(@location_detail), params: { location_detail: { description: @location_detail.description, image: @location_detail.image, location_id: @location_detail.location_id } }
    assert_redirected_to location_detail_url(@location_detail)
  end

  test "should destroy location_detail" do
    assert_difference('LocationDetail.count', -1) do
      delete location_detail_url(@location_detail)
    end

    assert_redirected_to location_details_url
  end
end
