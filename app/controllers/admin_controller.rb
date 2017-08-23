class AdminController < ApplicationController
  def cohorts
  end

  def housing
    if params[:location_id]
      @units = Housing.where(location: Location.find(params[:location_id]))
    end
    if params[:housing_id]
      @users = current_user.current_cohort.users
      @housing = Housing.find(params[:housing_id])
    end
  end

  def cohort_managers
    @cohort = Cohort.find(params[:cohort_id])
  end

  def add_cohort_manager
    @cohort = Cohort.find(params[:cohort_id])
    @user = User.find(params[:user_id])
    @role = Role.where(title: 'cohort_admin')
    unless @cohort.users.include?(@user)
      @cohort.users << @user
    end

    unless @user.roles.include?(@role)
      @user.roles << @role
    end
    redirect_to cohort_managers_path(@cohort)
  end

  def remove_cohort_manager
    @cohort = Cohort.find(params[:cohort_id])
    @user = User.find(params[:user_id])
    @role = Role.where(title: 'cohort_admin').first

    if @user.roles.include?(@role)
      @user.roles.destroy(@role)
    end
    redirect_to cohort_managers_path(@cohort)
  end
end
