class Transit < ApplicationRecord
  belongs_to :company
  has_one :departure_location, :class_name => 'Location', :foreign_key => 'departure_location_id'
  has_one :arrival_location, :class_name => 'Location', :foreign_key => 'arrival_location_id'
end
