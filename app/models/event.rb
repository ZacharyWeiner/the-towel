class Event < ApplicationRecord
  belongs_to :location
  has_and_belongs_to_many :users
  belongs_to :cohort, optional: true
  has_many :event_comments
  has_many :event_rsvps
end
