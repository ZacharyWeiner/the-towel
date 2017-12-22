class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /tracks
  # GET /tracks.json
  layout 'admin'
  def index
    if current_user.is_in_role(Role.cohort_member) || current_user.is_in_role(Role.cohort_admin)
      @tracks = Track.where(cohort: current_user.current_cohort)
    elsif params[:cohort_id]
      @tracks = Track.where(cohort: Cohort.find(params[:cohort_id]))
    else
      @tracks = Track.all
    end
    return @tracks
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    if @track.chat_room.nil?
      create_chat_room
    end
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)
    @track.location = Location.find(params[:location_id])
    @track.cohort = Cohort.find(params[:cohort_id])
    respond_to do |format|
      if @track.save
        create_chat_room
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    respond_to do |format|
      @track.location = Location.find(params[:location_id])
      @track.cohort = Cohort.find(params[:cohort_id])
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:name, :description, :events_id, :location_id, :cohort_id)
    end

    def create_chat_room
      @chat_room = ChatRoom.create!(title: @track.name, owner: current_user)
      @track.chat_room = @chat_room
      @track.save
    end
end
