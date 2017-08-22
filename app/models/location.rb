class Location < ApplicationRecord
    has_many :children, :class_name => "Location", :foreign_key => "parent_id"
    belongs_to :parent, :class_name => 'Location', :foreign_key => "parent_id", optional: true
    has_one :location_detail
    has_and_belongs_to_many :side_trips
    has_many :photos
    has_many :housings
end
