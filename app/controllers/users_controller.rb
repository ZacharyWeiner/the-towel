class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
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


  private
  def set_user
    if (params[:id])
      @user = User.find(params[:id])
    end
  end
end
