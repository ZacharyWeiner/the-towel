class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :move_to_track]
  layout 'admin'
  # GET /events
  # GET /events.json
  def index
    if params[:track_id]
      @track = Track.find(params[:track_id])
      @events = Event.where(track_id: params[:track_id]).where(event_type: 'track')
    else
      @events = Event.all
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event_comment = EventComment.new
    if @event.cost.nil?
      @event.cost = 0
    end
    if @event.chat_room.nil?
      create_chat_room
    end
    notification = Notification.where(user: current_user, notification_type: "Event", notification_obeject_id: @event.id).first
    if notification.nil? == false && notification.read == false
      notification.read = true
      notification.save
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    if params[:cohort_id]
      @cohort = Cohort.find(params[:cohort_id])
    else
      @cohort = Cohort.first
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    if @event.cost == nil?
      @event.cost = 0
    end
    if params[:event][:track_id]
      @track = Track.find(params[:event][:track_id])
      @cohort = @track.cohort
      @event.cohort = @cohort
    end
    if params[:event][:side_trip_id]
      @side_trip = SideTrip.find(params[:event][:side_trip_id])
      @event.side_trip = @side_trip
    end
    respond_to do |format|
      if @event.save
        unless @track.nil?
          update_users
        end
        send_notifications
        create_chat_room
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def move_to_track
    track = Track.find(params[:track_id])
    @event.track = track
    @event.save
    redirect_to @event
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    if params[:event_id]
      @event = Event.find(params[:event_id])
    else
      @event = Event.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:date, :start_time, :end_time, :title, :description, :cost, :capacity, :location_id, :meeting_point, :event_type, :cohort_id, :track_id, :is_public)
  end

  def create_chat_room
    @chat_room = ChatRoom.create!(title: @event.title, owner: current_user)
    @event.chat_room = @chat_room
    @event.save
  end

  def update_users
    @event.users << @track.users
    @track.users.each do |u|
      u.events << @event
    end
  end

  def send_notifications
    # Event for Cohort - Not Side Trip
    if @side_trip.nil? && @event.is_public
      notify_cohort
    else
      #Event for SideTrip not Cohort
      @side_trip.users.each do |user|
        notification = Notification.create!(user: user, notification_type: "Event", notification_obeject_id: @event.id)
      end
    end
  end

  def notify_cohort
    if @cohort.nil?
      @cohort = Cohort.find(params[:event][:cohort_id])
    end
    @cohort.users.each do |user|
      notification = Notification.create!(user: user, notification_type: "Event", notification_obeject_id: @event.id)
    end
  end
end
