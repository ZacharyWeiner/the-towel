require 'test_helper'

class LodgingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lodging = lodgings(:one)
  end

  test "should get index" do
    get lodgings_url
    assert_response :success
  end

  test "should get new" do
    get new_lodging_url
    assert_response :success
  end

  test "should create lodging" do
    assert_difference('Lodging.count') do
      post lodgings_url, params: { lodging: { address: @lodging.address, checkin_date: @lodging.checkin_date, checkin_time: @lodging.checkin_time, checkout_date: @lodging.checkout_date, checkout_time: @lodging.checkout_time, location_id: @lodging.location_id, map: @lodging.map, phone: @lodging.phone, website: @lodging.website } }
    end

    assert_redirected_to lodging_url(Lodging.last)
  end

  test "should show lodging" do
    get lodging_url(@lodging)
    assert_response :success
  end

  test "should get edit" do
    get edit_lodging_url(@lodging)
    assert_response :success
  end

  test "should update lodging" do
    patch lodging_url(@lodging), params: { lodging: { address: @lodging.address, checkin_date: @lodging.checkin_date, checkin_time: @lodging.checkin_time, checkout_date: @lodging.checkout_date, checkout_time: @lodging.checkout_time, location_id: @lodging.location_id, map: @lodging.map, phone: @lodging.phone, website: @lodging.website } }
    assert_redirected_to lodging_url(@lodging)
  end

  test "should destroy lodging" do
    assert_difference('Lodging.count', -1) do
      delete lodging_url(@lodging)
    end

    assert_redirected_to lodgings_url
  end
end
