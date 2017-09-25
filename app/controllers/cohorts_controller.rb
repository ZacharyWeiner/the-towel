class CohortsController < ApplicationController
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin'
  # GET /cohorts
  # GET /cohorts.json
  def index
    @cohorts = Cohort.where(organization_id: current_user.organization_id)
  end

  # GET /cohorts/1
  # GET /cohorts/1.json
  def show
    :authenticate_user!
    #all users can see cohorts from the Towel Nation
    if @cohort.organization.id == 1 || (@cohort.organization ==  current_user.organization)
      @post = Post.new
      @posts = Post.where(cohort: @cohort).order(created_at: :desc)
      if @cohort.chat_rooms.count == 0
        create_chat_room
      end
    else
      redirect_to current_user.current_cohort
    end
    current_user.events_missing_ratings
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
  end

  # GET /cohorts/1/edit
  def edit
  end

  # POST /cohorts
  # POST /cohorts.json
  def create
    @cohort = Cohort.new(cohort_params)
    if params[:organization_id]
      org = Organization.find(params[:organization_id])
      @cohort.organization = org
    end
    respond_to do |format|
      if @cohort.save
        create_chat_room
        format.html { redirect_to @cohort, notice: 'Cohort was successfully created.' }
        format.json { render :show, status: :created, location: @cohort }
      else
        if params[:cohort][:organization_id]
          id = params[:cohort][:organization_id]
          render "/organizations/#{id}/cohorts/new"
        else
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /cohorts/1
  # PATCH/PUT /cohorts/1.json
  def update
    respond_to do |format|
      if @cohort.update(cohort_params)
        format.html { redirect_to @cohort, notice: 'Cohort was successfully updated.' }
        format.json { render :show, status: :ok, location: @cohort }
      else
        format.html { render :edit }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohorts/1
  # DELETE /cohorts/1.json
  def destroy
    @cohort.destroy
    respond_to do |format|
      format.html { redirect_to cohorts_url, notice: 'Cohort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_user
    @cohort = Cohort.find(params[:cohort_id])
    if params[:id] && @cohort.users.include?(params[:id]) == false
      @cohort.users << User.find(params[:id ])
    end
    redirect_to edit_cohort_path(@cohort)
  end

  def remove_user
    @cohort = Cohort.find(params[:cohort_id])
    if params[:id] && @cohort.users.include?(User.find(params[:id])) == true
      @cohort.users.destroy(User.find(params[:id ]))
    end
    redirect_to edit_cohort_path(@cohort)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cohort
    @cohort = Cohort.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cohort_params
    params.require(:cohort).permit(:name, :description, :start_date, :end_date, :banner_image, :image, :organization_id)
  end

  def create_chat_room
    if @cohort.chat_rooms.count == 0
      @chat_room = ChatRoom.where(title: @cohort.name).first
      unless @chat_room
        if current_user.current_cohort
          admins = current_user.current_cohort.admins
          @chat_room = ChatRoom.create(title: @cohort.name, owner: admins.first)
        else
          admin = @cohort.admins
          @chat_room = ChatRoom.create(title: @cohort.name, owner: admin.first)
        end
      end
      @cohort.chat_rooms << @chat_room
    end
  end
end
