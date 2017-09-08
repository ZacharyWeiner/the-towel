class ContactSubmissionsController < ApplicationController
  before_action :set_contact_submission, only: [:show, :edit, :update, :destroy]
  layout 'solidstate'
  # GET /contact_submissions
  # GET /contact_submissions.json
  def index
    @contact_submissions = ContactSubmission.all
  end

  # GET /contact_submissions/1
  # GET /contact_submissions/1.json
  def show
  end

  # GET /contact_submissions/new
  def new
    @contact_submission = ContactSubmission.new
  end

  # GET /contact_submissions/1/edit
  def edit
  end

  # POST /contact_submissions
  # POST /contact_submissions.json
  def create
    @contact_submission = ContactSubmission.new(contact_submission_params)
    respond_to do |format|
      if @contact_submission.save
        format.html { redirect_to contact_submissions_message_thank_you_path }
        format.json { render :show, status: :created, location: @contact_submission }
      else
        format.html { render :new }
        format.json { render json: @contact_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def message_thank_you
  end

  # PATCH/PUT /contact_submissions/1
  # PATCH/PUT /contact_submissions/1.json
  def update
    respond_to do |format|
      if @contact_submission.update(contact_submission_params)
        format.html { redirect_to @contact_submission, notice: 'Contact submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_submission }
      else
        format.html { render :edit }
        format.json { render json: @contact_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_submissions/1
  # DELETE /contact_submissions/1.json
  def destroy
    @contact_submission.destroy
    respond_to do |format|
      format.html { redirect_to contact_submissions_url, notice: 'Contact submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_submission
      @contact_submission = ContactSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_submission_params
      params.require(:contact_submission).permit(:name, :email, :message)
    end
end
