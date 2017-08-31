class AdminController < ApplicationController
  before_action :authenticate
  layout 'admin'
  def cohorts
  end

  def dashboard
    byebug
  end

  def events
    if params[:event_id]
      @event = Event.find(params[:event_id])
    end
  end

  def upgrade_from_waitlist
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @event_rsvp = EventRsvp.create!(user: @user, event:@event)
    @event_waitlist = EventWaitlist.where(event: @event, user: @user).first
    @event_waitlist.destroy
    redirect_to event_admin_path(@event)
  end

  def remove_user_from_event
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @event.users.destroy(@user)
    redirect_to event_admin_path(@event)
  end

  def create_event_rsvp
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @event_rsvp = EventRsvp.create!(event: @event, user: @user)

    redirect_to event_admin_path(@event)
  end

  def housing
    if params[:location_id]
      @location = Location.find(params[:location_id])
      @units = Housing.where(location: @location)
      @users = current_user.current_cohort.users
    end #if
    if params[:housing_id]
      @users = current_user.current_cohort.users
      @housing = Housing.find(params[:housing_id])
      @users_in_home = []
      @requested_roomates = []
      @rank_hash = {}
      rank_3 = []
      rank_2 = []
      rank_1 = []
      rank_0 = []
      rooms_taken = 0
      @users.each do |user|
        rank = user.rank_for_housing(@housing)
        if user.housings.include?(@housing)
          rooms_taken = rooms_taken +1
          @users_in_home << user
          user.requested_roomates.each do |request|
            @requested_roomates << User.find(request.requested)
          end
        end
        if rank == 0
          rank_0 << user
        elsif rank == 1
          rank_1 << user
        elsif rank == 2
          rank_2 << user
        elsif rank == 3
          rank_3 << user
        end
      end
      @rank_hash.store(:three, rank_3)
      @rank_hash.store(:two, rank_2)
      @rank_hash.store(:one, rank_1)
      @rank_hash.store(:zero, rank_0)
      @rooms_avialable = (@housing.rooms > rooms_taken)

    end
  end

  def assign_user_to_housing
    @housing = Housing.find(params[:housing_id])
    @user = User.find(params[:user_id])
    unless @user.housings.include?(@housing)
      @user.housings << @housing
    end
    redirect_to admin_housing_unit_path(@housing)
  end

  def remove_user_from_housing
    @housing = Housing.find(params[:housing_id])
    @user = User.find(params[:user_id])
    @user.housings.destroy(@housing)
    redirect_to admin_housing_unit_path(@housing)
  end

  def cohort_managers
    @cohort = Cohort.find(params[:cohort_id])
  end

  def add_cohort_manager
    @cohort = Cohort.find(params[:cohort_id])
    @user = User.find(params[:user_id])
    @role = Role.where(title: 'cohort_admin')
    unless @cohort.users.include?(@user)
      @cohort.users << @user
    end

    unless @user.roles.include?(@role)
      @user.roles << @role
    end
    redirect_to cohort_managers_path(@cohort)
  end

  def remove_cohort_manager
    @cohort = Cohort.find(params[:cohort_id])
    @user = User.find(params[:user_id])
    @role = Role.where(title: 'cohort_admin').first

    if @user.roles.include?(@role)
      @user.roles.destroy(@role)
    end
    redirect_to cohort_managers_path(@cohort)
  end

  private
  def authenticate
    :authenticate_user!
    unless current_user.is_admin
      redirect_to root_path
    end
  end
end
