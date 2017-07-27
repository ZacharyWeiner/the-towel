require 'test_helper'

class EventRsvpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_rsvp = event_rsvps(:one)
  end

  test "should get index" do
    get event_rsvps_url
    assert_response :success
  end

  test "should get new" do
    get new_event_rsvp_url
    assert_response :success
  end

  test "should create event_rsvp" do
    assert_difference('EventRsvp.count') do
      post event_rsvps_url, params: { event_rsvp: { event_id: @event_rsvp.event_id, note: @event_rsvp.note, user_id: @event_rsvp.user_id } }
    end

    assert_redirected_to event_rsvp_url(EventRsvp.last)
  end

  test "should show event_rsvp" do
    get event_rsvp_url(@event_rsvp)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_rsvp_url(@event_rsvp)
    assert_response :success
  end

  test "should update event_rsvp" do
    patch event_rsvp_url(@event_rsvp), params: { event_rsvp: { event_id: @event_rsvp.event_id, note: @event_rsvp.note, user_id: @event_rsvp.user_id } }
    assert_redirected_to event_rsvp_url(@event_rsvp)
  end

  test "should destroy event_rsvp" do
    assert_difference('EventRsvp.count', -1) do
      delete event_rsvp_url(@event_rsvp)
    end

    assert_redirected_to event_rsvps_url
  end
end
