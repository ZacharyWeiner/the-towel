class InvitesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :sent]
  layout 'devise'
  def invite
    vars = request.query_parameters
    @invited_cohort = vars[:cohort]
    unless @invited_cohort.nil?
      session[:invited_cohort] = @invited_cohort
      @cohort = Cohort.find(session[:invited_cohort])
    end
  end

  def new
  end

  def create
    @invitor = User.find(params[:user_id])
    @invite_email_address = params[:invite_email_address]
    @cohort = Cohort.find(params[:cohort_id])
    @base_link = "http://localhost:3000"
    @link = @base_link + url_for(invite_path) + "?cohort=#{@cohort.id}"

    @invite_content = "You have been invited to Join the Group #{@cohort.name}, by #{@invitor.email}. Click this link to join the group: #{@link}"
    redirect_path =  @base_link + url_for(invite_sent_path) + "?sentto=#{@invite_email_address}"
    response = UserMailer.send_invite(@invite_email_address, @cohort.name, @invite_content).deliver_now
    byebug
    redirect_to(redirect_path)
  end

  def sent
    vars = request.query_parameters
    @sent_to_email = vars[:sentto]
  end
end
