class PagesController < ApplicationController
  def home

    if current_user && current_user.is_in_role(@@COHORT_MEMBER)
      redirect_to cohort_path(current_user.cohorts.first)
    end
  end

  def about
  end

  def contact
  end
end
