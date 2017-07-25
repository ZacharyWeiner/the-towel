class Transit < ApplicationRecord
  belongs_to :company
  belongs_to :departure_location
  belongs_to :arrival_location
end
