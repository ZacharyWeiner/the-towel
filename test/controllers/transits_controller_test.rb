require 'test_helper'

class TransitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transit = transits(:one)
  end

  test "should get index" do
    get transits_url
    assert_response :success
  end

  test "should get new" do
    get new_transit_url
    assert_response :success
  end

  test "should create transit" do
    assert_difference('Transit.count') do
      post transits_url, params: { transit: { arrival_location_id: @transit.arrival_location_id, arrival_time: @transit.arrival_time, company_id: @transit.company_id, date: @transit.date, departure_location_id: @transit.departure_location_id, departure_map: @transit.departure_map, departure_time: @transit.departure_time, route_number: @transit.route_number, title: @transit.title, travel_type: @transit.travel_type } }
    end

    assert_redirected_to transit_url(Transit.last)
  end

  test "should show transit" do
    get transit_url(@transit)
    assert_response :success
  end

  test "should get edit" do
    get edit_transit_url(@transit)
    assert_response :success
  end

  test "should update transit" do
    patch transit_url(@transit), params: { transit: { arrival_location_id: @transit.arrival_location_id, arrival_time: @transit.arrival_time, company_id: @transit.company_id, date: @transit.date, departure_location_id: @transit.departure_location_id, departure_map: @transit.departure_map, departure_time: @transit.departure_time, route_number: @transit.route_number, title: @transit.title, travel_type: @transit.travel_type } }
    assert_redirected_to transit_url(@transit)
  end

  test "should destroy transit" do
    assert_difference('Transit.count', -1) do
      delete transit_url(@transit)
    end

    assert_redirected_to transits_url
  end
end
