class LodgingsController < ApplicationController
  before_action :set_lodging, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  def index
    if params[:side_trip_id]
      @side_trip = SideTrip.find(params[:side_trip_id])
      @lodgings = @side_trip.lodgings
    else
      @lodgings = Lodging.all
    end
  end

  # GET /lodgings/1
  # GET /lodgings/1.json
  def show
    if params[:side_trip_id]
      @side_trip = SideTrip.find(params[:side_trip_id])
    end
  end

  # GET /lodgings/new
  def new
    @lodging = Lodging.new
  end

  # GET /lodgings/1/edit
  def edit
  end

  # POST /lodgings
  # POST /lodgings.json
  def create
    @lodging = Lodging.new(lodging_params)
    respond_to do |format|
      if @lodging.save
        side_trip = SideTrip.find(params[:lodging][:side_trip_id])
        side_trip.lodgings << @lodging
        format.html { redirect_to @lodging, notice: 'Lodging was successfully created.' }
        format.json { render :show, status: :created, location: @lodging }
      else
        format.html { render :new }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lodgings/1
  # PATCH/PUT /lodgings/1.json
  def update
    respond_to do |format|
      if @lodging.update(lodging_params)
        format.html { redirect_to @lodging, notice: 'Lodging was successfully updated.' }
        format.json { render :show, status: :ok, location: @lodging }
      else
        format.html { render :edit }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lodgings/1
  # DELETE /lodgings/1.json
  def destroy
    @lodging.destroy
    respond_to do |format|
      format.html { redirect_to lodgings_url, notice: 'Lodging was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lodging
      @lodging = Lodging.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lodging_params
      params.require(:lodging).permit(:name, :checkin_date, :checkin_time, :checkout_date, :checkout_time, :phone, :website, :address, :location_id, :map, :description)
    end
end
