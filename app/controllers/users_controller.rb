class UsersController < ApplicationController
  before_action :set_user, only: [:show]
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
      user = User.where(email: param).first
      if user
        current_user.roomate_requests << RoomateRequest.create!(requester: current_user, requested: user.id)
      end
    end
    redirect_to user_preferences_path(current_user)
  end

  def skills

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
end
