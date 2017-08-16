class SideTripsController < ApplicationController
  before_action :set_side_trip, only: [:show, :edit, :update, :destroy]

  # GET /side_trips
  # GET /side_trips.json
  def index
    @side_trips = SideTrip.all
  end

  # GET /side_trips/1
  # GET /side_trips/1.json
  def show
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

    respond_to do |format|
      if @side_trip.save
        format.html { redirect_to @side_trip, notice: 'Side trip was successfully created.' }
        format.json { render :show, status: :created, location: @side_trip }
      else
        format.html { render :new }
        format.json { render json: @side_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /side_trips/1
  # PATCH/PUT /side_trips/1.json
  def update
    respond_to do |format|
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
    @side_trip.destroy
    respond_to do |format|
      format.html { redirect_to side_trips_url, notice: 'Side trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_side_trip
      @side_trip = SideTrip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def side_trip_params
      params.require(:side_trip).permit(:title, :start_date, :end_date, :is_public, :creator_id)
    end
end
