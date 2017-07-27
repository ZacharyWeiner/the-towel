class EventRsvpsController < ApplicationController
  before_action :set_event_rsvp, only: [:show, :edit, :update, :destroy]

  # GET /event_rsvps
  # GET /event_rsvps.json
  def index
    @event_rsvps = EventRsvp.all
  end

  # GET /event_rsvps/1
  # GET /event_rsvps/1.json
  def show
  end

  # GET /event_rsvps/new
  def new
    @event_rsvp = EventRsvp.new
  end

  # GET /event_rsvps/1/edit
  def edit
  end

  # POST /event_rsvps
  # POST /event_rsvps.json
  def create

    @event_rsvp = EventRsvp.new(event_rsvp_params)
    @event = Event.find(params[:event_id])
    byebug
    respond_to do |format|
      if @event_rsvp.save
        format.html { redirect_to event_path(@event), notice: 'Event rsvp was successfully created.' }
        format.json { render :show, status: :created, location: @event_rsvp }
      else
        format.html { render :new }
        format.json { render json: @event_rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_rsvps/1
  # PATCH/PUT /event_rsvps/1.json
  def update
    respond_to do |format|
      @event = Event.find(params[:event_id])
      if @event_rsvp.update(event_rsvp_params)
        format.html { redirect_to event_path(@event), notice: 'Event rsvp was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_rsvp }
      else
        format.html { render :edit }
        format.json { render json: @event_rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_rsvps/1
  # DELETE /event_rsvps/1.json
  def destroy
    @event_rsvp.destroy
    @event = Event.find(params[:event_id])
    respond_to do |format|
      format.html { redirect_to event_path(@event), notice: 'Event rsvp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_rsvp
      @event_rsvp = EventRsvp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_rsvp_params
      params.require(:event_rsvp).permit(:event_id, :user_id, :note)
    end
end
