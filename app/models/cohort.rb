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
  has_many :announcements
  has_many :tickets

  def main_chat
    self.chat_rooms.where(title: self.name).first
  end

  def admins
    roles = []
    unless Role.where(title: Role.org_admin).first.nil?
      roles << Role.where(title: Role.org_admin).first
    end
    unless Role.where(title: Role.cohort_admin).first.nil?
      roles << Role.where(title: Role.cohort_admin).first
    end
    unless Role.where(title: Role.city_admin).first.nil?
      roles << Role.where(title: Role.city_admin).first
    end
    response = []
    roles.each do |role |
      role.users.each do |user|
        if user.cohorts.include?(self)
          response << user
        end
      end
    end
    response
  end
end
