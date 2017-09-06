class AddAnnouncementToUserAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_announcements, :announcement, foreign_key: true
  end
end
