class UsersController < ApplicationController
  before_action :set_user, only: [:show, :skills]
  layout 'admin'
  def show
    if @user.profile.nil?
      Profile.create!(user:@user)
    end
  end

  def preferences
  end

  def update_housing_preferences
    current_user.clear_housing_tags
     params.each do |param|
      @tag = Tag.where(name: param).first
      if @tag
        current_user.tags << @tag
      end
    end
    redirect_to user_preferences_path(current_user)
  end

  def update_roomate_preferences
    current_user.clear_roomate_preferences
    params.each do |param|
      if param.include?("email")
        user_email = params[param]
        user = User.where(email: user_email).first
        if user
          rr = RoomateRequest.create!(requester: current_user, requested_roomate: user)
          rr.save
        end
      end
    end
    redirect_to user_preferences_path(current_user)
  end

  def skills
    if editable
    else
      redirect_to show_user_path(@user)
    end
  end

  def update_skills
    current_user.clear_skills
    params.each do |param|
      @tag = Tag.where(name: param).first
      if @tag
        current_user.tags << @tag
      end
    end
    redirect_to user_skills_path(current_user)
  end

  private
  def set_user
    if (params[:id])
      @user = User.find(params[:id])
    end
  end

  def editable
    if current_user != @user
      return false
    else
      return true
    end
  end
end
