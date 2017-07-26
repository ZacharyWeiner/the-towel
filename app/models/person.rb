class Person < ApplicationRecord
  belongs_to :location, optional: true
  validates :name, presence: true
end
