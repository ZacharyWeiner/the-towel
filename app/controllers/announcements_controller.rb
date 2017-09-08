class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  before_action :set_cohort
  before_action :check_role, only: [:new, :edit, :create, :update, :destroy]


  layout 'admin'
  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.where(cohort: @cohort).order(created_at: :desc)
    @announcements.each do |announcement|
      user_announcement = announcement.user_announcements.where(user: current_user, announcement: announcement).first
      unless user_announcement.nil?
        user_announcement.read = true
        user_announcement.save
      end
    end
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.user = current_user
    @announcement.cohort = @cohort
    respond_to do |format|
      if @announcement.save
        @cohort.users.each do |user|
          user_announcement = UserAnnouncement.create!(user: user, cohort:@cohort, announcement:@announcement, read: false)
        end
        format.html { redirect_to @cohort, notice: 'Announcement was successfully created.' }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to announcements_url, notice: 'Announcement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def set_cohort
      @cohort = Cohort.find(params[:cohort_id])
    end

    def check_role
      unless (current_user.is_org_admin || current_user.is_cohort_admin || current_user.is_city_admin)
        redirect_to @cohort
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:title, :user_id, :content, :cohort_id)
    end
end
