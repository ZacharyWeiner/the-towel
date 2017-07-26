class Cohort < ApplicationRecord
  mount_uploader :image, PictureUploader
  mount_uploader :banner_image, PictureUploader
  has_and_belongs_to_many :users
  has_many :events
end
