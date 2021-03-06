class HousingsController < ApplicationController
  before_action :set_housing, only: [:show, :edit, :update, :destroy, :update_tags, :set_tags]

  layout 'admin'
  def index
    @housings = Housing.all
  end

  # GET /housings/1
  # GET /housings/1.json
  def show
  end

  # GET /housings/new
  def new
    @housing = Housing.new
  end

  # GET /housings/1/edit
  def edit
  end

  # POST /housings
  # POST /housings.json
  def create
    @housing = Housing.new(housing_params)

    respond_to do |format|
      if @housing.save
        format.html { redirect_to @housing, notice: 'Housing was successfully created.' }
        format.json { render :show, status: :created, location: @housing }
      else
        format.html { render :new }
        format.json { render json: @housing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /housings/1
  # PATCH/PUT /housings/1.json
  def update
    respond_to do |format|
      if @housing.update(housing_params)
        format.html { redirect_to @housing, notice: 'Housing was successfully updated.' }
        format.json { render :show, status: :ok, location: @housing }
      else
        format.html { render :edit }
        format.json { render json: @housing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /housings/1
  # DELETE /housings/1.json
  def destroy
    @housing.destroy
    respond_to do |format|
      format.html { redirect_to housings_url, notice: 'Housing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_tags

  end

  def set_tags
    @housing.tags.clear
     params.each do |param|
      @tag = Tag.where(name: param).first
      if @tag
        @housing.tags << @tag
      end
    end
    redirect_to @housing
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_housing
      if params[:id]
        @housing = Housing.find(params[:id])
      elsif params[:housing_id]
        @housing = Housing.find(params[:housing_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def housing_params
      params.require(:housing).permit(:name, :rooms, :bathrooms, :street_number, :location_id, :map, :street_name, :postal_code, :neighborhood, :other_details, :unit, :full_address)
    end
end
