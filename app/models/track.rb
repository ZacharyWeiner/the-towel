class Track < ApplicationRecord
  has_many :events
  belongs_to :location
  belongs_to :cohort
  belongs_to :chat_room, optional: true
  has_many :photos
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tags

end
