class AdminController < ApplicationController
  def cohorts 
  end 

  def add_manager 
    @cohort = Cohort.find(params[:cohort_id])
    @user = User.find(params[:user_id])
    @role = Role.find(title: 'cohort_admin')
  end 
end