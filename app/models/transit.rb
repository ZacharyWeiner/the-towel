class Transit < ApplicationRecord
  belongs_to :company
  belongs_to :departure_location, :class_name => 'Location', :foreign_key => 'departure_location_id'
  belongs_to :arrival_location, :class_name => 'Location', :foreign_key => 'arrival_location_id'
end
