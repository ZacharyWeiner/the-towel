class PagesController < ApplicationController
  layout 'solidstate'
  def home
    @contact_submission = ContactSubmission.new
    #Manage off the street sign ups
    if current_user
      if  current_user.organization_id == 1 && current_user.cohorts.count == 0
        current_user.cohorts << current_user.organization.cohorts.first
        current_user.roles << Role.where(title: Role.cohort_member).first
      elsif current_user.organization.nil?
        current_user.organization = Organization.find(1)
        current_user.cohorts << current_user.organization.cohorts.first
        current_user.roles << Role.where(title: Role.cohort_member).first
      end
    end

    #Manage Invited Users
    if session[:invited_cohort] && current_user
      @cohort = Cohort.find(session[:invited_cohort])
      unless current_user.cohorts.include?(@cohort)
        current_user.cohorts << @cohort
        current_user.organization = @cohort.organization
        current_user.save
      end
      session[:invited_cohort] = nil
    end


    if current_user && current_user.is_in_role(Role.cohort_member)
      redirect_to cohort_path(current_user.current_cohort)
    elsif current_user && current_user.is_admin
      redirect_to admin_dashboard_path
    end
  end

  def about
  end

  def contact
  end

  def account
  end
end
