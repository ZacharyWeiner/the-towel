class UserAnnouncementsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  def index
    @announcements = []
    current_user.user_announcements.each do |ua|
      @announcements << ua.announcement
      if ua.read == false
        ua.read = true
        ua.save
      end
    end
    @announcements.reverse
  end
end

