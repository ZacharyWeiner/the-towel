class LocationDetail < ApplicationRecord
  belongs_to :location
  belongs_to :organization

  mount_uploader :image, PictureUploader
end
