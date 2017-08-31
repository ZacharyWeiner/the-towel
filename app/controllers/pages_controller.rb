class PagesController < ApplicationController

  def home
    if session[:invited_cohort] && current_user
      @cohort = Cohort.find(session[:invited_cohort])
      unless current_user.cohorts.include?(@cohort)
        current_user.cohorts << @cohort
      end
      session[:invited_cohort] = nil
    end

    if current_user && current_user.is_in_role(Role.cohort_member)
      redirect_to cohort_path(current_user.cohorts.first)
    end
  end

  def about
  end

  def contact
  end
end
