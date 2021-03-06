class SideTripsController < ApplicationController
  before_action :set_side_trip, only: [:show, :edit, :update, :destroy, :add_user, :remove_user]
  before_action :authenticate_user!
  layout 'admin'
  def index
    if params[:cohort_id]
      @side_trips = SideTrip.where(cohort_id: params[:cohort_id]).where(is_public: true)
    else
      @side_trips = SideTrip.all
    end
  end

  # GET /side_trips/1
  # GET /side_trips/1.json
  def show
    @post = Post.new
    @posts = @side_trip.posts.order(created_at: :desc)
    if @side_trip.chat_room.nil?
      create_chat_room
    end
    notification = Notification.where(read: false, notification_obeject_id: @side_trip.id, notification_type: "Side Trip", user_id: current_user.id).first
    unless notification.nil?
      notification.read = true
      notification.save
    end
  end

  # GET /side_trips/new
  def new
    @side_trip = SideTrip.new
  end

  # GET /side_trips/1/edit
  def edit
  end

  # POST /side_trips
  # POST /side_trips.json
  def create
    @side_trip = SideTrip.new(side_trip_params)
    @side_trip.creator = current_user
    set_side_trip_cohort
    set_side_trip_event
    respond_to do |format|
      if @side_trip.save
        @side_trip.users << current_user
        create_chat_room
        send_notifications
        format.html { redirect_to @side_trip, notice: 'Side trip was successfully created.' }
        format.json { render :show, status: :created, location: @side_trip }
      else
        format.html { redirect_to new_cohort_side_trip_path(@cohort) }
        format.json { render json: @side_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /side_trips/1
  # PATCH/PUT /side_trips/1.json
  def update
    respond_to do |format|
      set_side_trip_cohort
      if @side_trip.update(side_trip_params)
        format.html { redirect_to @side_trip, notice: 'Side trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @side_trip }
      else
        format.html { render :edit }
        format.json { render json: @side_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /side_trips/1
  # DELETE /side_trips/1.json
  def destroy
    @cohort = @side_trip.cohort
    @side_trip.destroy
    respond_to do |format|
      format.html { redirect_to @cohort, notice: 'Side trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_user
    user = User.find(params[:id])
    unless @side_trip.users.include?(user)
      @side_trip.users << user
    end
    redirect_to side_trip_path(@side_trip)
  end

  def remove_user
    user = User.find(params[:id])
    if @side_trip.users.include?(user)
      @side_trip.users.destroy(user)
    end
    redirect_to side_trip_path(@side_trip)
  end

  def invite
    set_side_trip
  end

  def create_invitations
    set_side_trip
    invitees = params[:invite][:invitees]
    safe_names = ""
    invitees.each do |invitee|
      Notification.create!(user_id: invitee, notification_type: "Side Trip", notification_obeject_id: @side_trip.id)
      safe_names = safe_names + User.find(invitee).safe_name + " "
    end
    respond_to do |format|
      format.html { redirect_to cohort_side_trip_path(@side_trip.cohort, @side_trip), notice: "#{safe_names} have been invited to #{@side_trip.title}" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_side_trip
      if params[:side_trip_id]
        @side_trip = SideTrip.find(params[:side_trip_id])
      else
        @side_trip = SideTrip.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def side_trip_params
      params.require(:side_trip).permit(:title, :start_date, :end_date, :is_public, :creator_id, :cohort_id, :description)
    end

    def set_side_trip_event
      if params[:event_id]
        @side_trip.event_id = params[:event_id]
      end
    end

    def set_side_trip_cohort
      if params[:side_trip][:cohort_id]
        @side_trip.cohort_id = params[:side_trip][:cohort_id]
      else
        @side_trip.cohort_id = current_user.cohorts.first.id
        if @side_trip.cohort_id.nil?
          @side_trip.cohort_id = 1
        end
      end
    end

    def create_chat_room
      @chat_room = ChatRoom.create!(title: "ST- #{@side_trip.title}", owner:current_user)
      @side_trip.chat_room = @chat_room
      @side_trip.save
    end

    def send_notifications
      if @cohort.nil?
        @cohort = Cohort.find(params[:side_trip][:cohort_id])
      end
      @cohort.users.each do |user|
        notification = Notification.create!(user: user, notification_type: "Side Trip", notification_obeject_id: @side_trip.id)
      end
    end
end
