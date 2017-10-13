class TransitsController < ApplicationController
  before_action :set_transit, only: [:show, :edit, :update, :destroy]
  # GET /transits
  # GET /transits.json
  layout 'admin'
  def index
    if params[:cohort_id]
      set_cohort
      @transits = @cohort.transits
    elsif params[:side_trip_id]
      set_side_trip
      @transits = @side_trip.transits.order(:date)
    else
      @transits = Transit.all
    end
  end

  # GET /transits/1
  # GET /transits/1.json
  def show
    if params[:cohort_id]
      set_cohort
    end
  end

  # GET /transits/new
  def new
    @transit = Transit.new
  end

  # GET /transits/1/edit
  def edit
    set_side_trip
  end

  # POST /transits
  # POST /transits.json
  def create
    @transit = Transit.new(transit_params)
    respond_to do |format|
      if @transit.save
        if params[:transit][:side_trip_id]
          @side_trip = SideTrip.find(params[:transit][:side_trip_id])
          @side_trip.transits << @transit
          format.html { redirect_to @side_trip, notice: 'Transit was successfully created.' }
        end
        if params[:cohort_id]
          @cohorts.transits << @transit
        end
        format.html { redirect_to @transit, notice: 'Transit was successfully created.' }
        format.json { render :show, status: :created, location: @transit }
      else
        format.html { render :new }
        format.json { render json: @transit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transits/1
  # PATCH/PUT /transits/1.json
  def update
    respond_to do |format|
      if @transit.update(transit_params)
        apply_side_trip
        if params[:cohort_id]
          @cohorts.transits << @transit
        end
        format.html { redirect_to @transit, notice: 'Transit was successfully updated.' }
        format.json { render :show, status: :ok, location: @transit }
      else
        format.html { render :edit }
        format.json { render json: @transit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transits/1
  # DELETE /transits/1.json
  def destroy
    @transit.destroy
    respond_to do |format|
      format.html { redirect_to transits_url, notice: 'Transit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transit
      @transit = Transit.find(params[:id])
    end

    def set_cohort
      @cohort = Cohort.find(params[:cohort_id])
    end

    def set_side_trip
      if params[:transit] && params[:transit][:side_trip_id]
         @side_trip = SideTrip.find(params[:transit][:side_trip_id])
      elsif params[:side_trip_id]
         @side_trip = SideTrip.find(params[:side_trip_id])
      end
    end

    def apply_side_trip
      set_side_trip
      if @side_trip
        @side_trip.transits << @transit
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transit_params
      params.require(:transit).permit(:date, :departure_time, :title, :travel_type, :company_id, :route_number, :departure_location_id, :departure_map, :arrival_location_id, :arrival_time)
    end
end
