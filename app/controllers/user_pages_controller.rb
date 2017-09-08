class UserPagesController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def my_itinerary
   @itinerary_items = current_user.my_itinerary
  end

  def my_events
    @events = current_user.events
    @waitlist = current_user.waitlisted_events
  end

  def my_photos
    redirect_to user_photos_path(current_user)
  end

  def my_sidetrips
    @sidetrips = current_user.side_trips
  end

  def my_housings
    @housings = current_user.housings
  end
end
