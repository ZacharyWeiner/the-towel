class Photo < ApplicationRecord
  belongs_to :cohort, optional: true
  belongs_to :event, optional: true
  belongs_to :location, optional: true
  belongs_to :post, optional: true
  belongs_to :lodging, optional: true
  belongs_to :side_trip, optional: true
  belongs_to :user, optional: true
  belongs_to :housing, optional: true

  mount_uploader :picture, PictureUploader
  attr_accessor :picture_cache
end
