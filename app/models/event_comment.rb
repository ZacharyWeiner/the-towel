class EventComment < ApplicationRecord
  belongs_to :event
  belongs_to :cohort
  belongs_to :user
end
