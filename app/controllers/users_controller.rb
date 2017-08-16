class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  has_and_belongs_to_many :cohorts
  def show
  end


  private
  def set_user
    if (params[:id])
      @user = User.find(params[:id])
    end
  end
end
