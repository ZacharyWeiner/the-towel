class UserPagesController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def my_itinerary
    @itinerary_items = []
    @cohort = current_user.cohorts.where.not(id: 1).first
    @cohort.transits.each { |t| @itinerary_items << t.create_itinerary_item}
    current_user.side_trips.each{ |st| @itinerary_items << st.create_itinerary_item}
    current_user.side_trips.each do | side_trip|
      side_trip.transits.each{ |t| @itinerary_items << t.create_itinerary_item}
    end
    current_user.events.each{ |event| @itinerary_items << event.create_itinerary_item}
    @itinerary_items = @itinerary_items.sort {|x,y| x.date  <=> y.date}
  end
end
