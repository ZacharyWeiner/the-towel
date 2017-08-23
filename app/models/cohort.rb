class Cohort < ApplicationRecord
  mount_uploader :image, PictureUploader
  mount_uploader :banner_image, PictureUploader
  has_and_belongs_to_many :users
  has_and_belongs_to_many :transits
  has_and_belongs_to_many :chat_rooms
  has_many :events
  has_many :posts
  has_many :side_trips
  has_many :photos
  has_many :schedule_items

  def main_chat
    self.chat_rooms.where(title: self.name).first
  end
end
