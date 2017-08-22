class ScheduleItem < ApplicationRecord
  belongs_to :cohort
  belongs_to :location
  has_and_belongs_to_many :transits
end
