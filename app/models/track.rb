class Track < ApplicationRecord
  has_many :events
  belongs_to :location
  belongs_to :cohort

  has_and_belongs_to_many :users
end
