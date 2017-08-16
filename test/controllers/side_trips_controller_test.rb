require 'test_helper'

class SideTripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @side_trip = side_trips(:one)
  end

  test "should get index" do
    get side_trips_url
    assert_response :success
  end

  test "should get new" do
    get new_side_trip_url
    assert_response :success
  end

  test "should create side_trip" do
    assert_difference('SideTrip.count') do
      post side_trips_url, params: { side_trip: { creator_id: @side_trip.creator_id, end_date: @side_trip.end_date, is_public: @side_trip.is_public, start_date: @side_trip.start_date, title: @side_trip.title } }
    end

    assert_redirected_to side_trip_url(SideTrip.last)
  end

  test "should show side_trip" do
    get side_trip_url(@side_trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_side_trip_url(@side_trip)
    assert_response :success
  end

  test "should update side_trip" do
    patch side_trip_url(@side_trip), params: { side_trip: { creator_id: @side_trip.creator_id, end_date: @side_trip.end_date, is_public: @side_trip.is_public, start_date: @side_trip.start_date, title: @side_trip.title } }
    assert_redirected_to side_trip_url(@side_trip)
  end

  test "should destroy side_trip" do
    assert_difference('SideTrip.count', -1) do
      delete side_trip_url(@side_trip)
    end

    assert_redirected_to side_trips_url
  end
end
