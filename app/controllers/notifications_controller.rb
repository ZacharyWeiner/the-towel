class NotificationsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  def index
    @notifications = Notification.where(user: current_user).order(updated_at: :desc)
  end
end
