class Location < ApplicationRecord
    has_many :children, :class_name => "Location", :foreign_key => "parent_id"
    belongs_to :parent, :class_name => 'Location', :foreign_key => "parent_id", optional: true
end
