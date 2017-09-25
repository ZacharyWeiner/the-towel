class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  # GET /ratings
  # GET /ratings.json
  def index
    if params[:event_id]
      @ratings = Rating.where(object_type:"Event", object_id: params[:event_id])
    else
      @ratings = Rating.all
    end
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    if @rating.object_type == "Event"
      notification = Notification.where(user: current_user, notification_type: "Event Rating Request", notification_obeject_id: @rating.object_id).first
      unless notification.nil?
        notification.read = true
        notification.save
      end
    end

  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    set_context
    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_context
      if params[:rating][:event_id]
        @rating.object_type = "Event"
        @rating.object_id = params[:rating][:event_id]
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:user_id, :rating, :note, :tags_id, :object_type, :object_id)
    end
end
