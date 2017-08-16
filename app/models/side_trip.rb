class SideTrip < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_and_belongs_to_many :users
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :transits
  has_and_belongs_to_many :lodgings
end
