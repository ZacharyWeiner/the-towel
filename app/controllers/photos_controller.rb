class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /photos
  # GET /photos.json
  def index
    if params[:user_id]
      @photos = User.find(params[:user_id]).photos.order(created_at: :desc)
    elsif params[:cohort_id]
      @photos = Cohort.find(params[:cohort_id]).photos.order(created_at: :desc)
    elsif params[:event_id]
      @photos = Event.find(params[:event_id]).photos.order(created_at: :desc)
    else
      @photos = Photo.all.order(created_at: :desc)
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
    if params[:housing_id]
      @housing = Housing.find(params[:housing_id])
    end
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if  params[:photo][:housing_id]
      @housing = Housing.find(params[:photo][:housing_id])
      @photo.location = @housing.location
    else
      @photo.cohort = current_user.current_cohort
    end
    if params[:photo][:event_id]
      @photo.event_id = params[:photo][:event_id]
    end
    respond_to do |format|
      if @photo.save
        if params[:photo][:housing_id]
          @housing.photos << @photo
          format.html { redirect_to @housing, notice: 'Photo was successfully created.' }
          format.json { render :show, status: :created, location: @photo }
        elsif params[:photo][:event_id]
          format.html { redirect_to Event.find(params[:event_id]), notice: 'Photo was successfully created.' }
          format.json { render :show, status: :created, location: @photo }
        elsif params[:photo][:user_id]
          format.html { redirect_to user_photos_path(@photo.user), notice: 'Photo was successfully created.' }
          format.json { render :show, status: :created, location: @photo }
        else
          format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
          format.json { render :show, status: :created, location: @photo }
        end
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        if params[:photo][:housing_id]
          @housing.photos << @photo
          format.html { redirect_to @housing, notice: 'Photo was successfully updated.' }
          format.json { render :show, status: :created, location: @photo }
        elsif params[:photo][:event_id]
          format.html { redirect_to Event.find(params[:event_id]), notice: 'Photo was successfully updated.' }
          format.json { render :show, status: :created, location: @photo }
        elsif params[:photo][:user_id]
          format.html { redirect_to user_photos_path(@photo.user), notice: 'Photo was successfully updated.' }
          format.json { render :show, status: :created, location: @photo }
        else
          format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
          format.json { render :show, status: :created, location: @photo }
        end
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:cohort_id, :event_id, :city_id, :post_id, :lodging_id, :side_trip_id, :picture, :caption, :housing_id)
    end
end
