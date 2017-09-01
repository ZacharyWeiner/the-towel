class Cohort < ApplicationRecord
  mount_uploader :image, PictureUploader
  mount_uploader :banner_image, PictureUploader
  belongs_to :organization
  has_and_belongs_to_many :users
  has_and_belongs_to_many :transits
  has_and_belongs_to_many :chat_rooms
  has_many :events
  has_many :posts
  has_many :side_trips
  has_many :photos
  has_many :schedule_items
  has_many :tracks

  def main_chat
    self.chat_rooms.where(title: self.name).first
  end

  def admins
    role = Role.where(title: Role.site_admin).first
    response = []
    role.users.each do |user|
      if user.cohorts.include?(self)
        response << user
      end
    end
    response
  end
end
