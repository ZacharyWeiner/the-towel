class ChargesController < ApplicationController
  def new
end

def create
  # Amount in cents
  @amount = 0
  if params[:event_id]
    @event = Event.find(params[:event_id])
    @amount = @event.cost * 100
    @event_rsvp = current_user.event_rsvps.where(event: @event).first
  end

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  if charge[:paid]
    @event_rsvp.is_paid = true
    @event_rsvp.charge_id = charge[:id]
    @event_rsvp.save
    redirect_to @event
  end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end
