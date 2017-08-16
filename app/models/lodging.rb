class Lodging < ApplicationRecord
  belongs_to :location
  has_and_belongs_to_many :side_trips
end
