class PagesController < ApplicationController
  def home
    if session[:invited_cohort] && current_user
      @cohort = Cohort.find(session[:invited_cohort])
      current_user.cohorts << @cohort
      session[:invited_cohort] = nil
    end

    if current_user && current_user.is_in_role(Role.cohort_member)
      redirect_to cohort_path(current_user.cohorts.first)
    end
  end

  def about
  end

  def contact
  end

  def my_itinerary
    :authenticate_user!
    @itinerary_items = []
    @cohort = current_user.cohorts.where.not(id: 1).first
    @cohort.transits.each { |t| @itinerary_items << t.create_itinerary_item}
    current_user.side_trips.each{ |st| @itinerary_items << st.create_itinerary_item}
    current_user.side_trips.each do | side_trip|
      side_trip.transits.each{ |t| @itinerary_items << t.create_itinerary_item}
    end
    @itinerary_items = @itinerary_items.sort {|x,y| x.date  <=> y.date}
  end
end
