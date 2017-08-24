class EventWaitlistsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    unless @user.is_on_waitlist(@event)
      EventWaitlist.create!(event: @event, user_id: params[:user_id])
    end
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event_waitlist = EventWaitlist.where(event: @event, user_id: params[:user_id]).first
    @event_waitlist.destroy
    redirect_to @event
  end
end
