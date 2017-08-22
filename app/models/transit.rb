class Transit < ApplicationRecord
  belongs_to :company, optional: :true
  has_and_belongs_to_many :cohorts
  has_and_belongs_to_many :side_trips
  belongs_to :departure_location, class_name: 'Location', foreign_key: 'departure_location_id'
  belongs_to :arrival_location, class_name: 'Location', foreign_key: 'arrival_location_id'
  has_and_belongs_to_many :schedule_items
  def self.create_itinerary_items(collection)
    response = []
    collection.each do |transit|
      response << transit.create_itinerary_item
    end
    response
  end

  def create_itinerary_item
    ItineraryItem.new(date: self.date,
                      location: self.departure_location.name,
                      title: self.title,
                      link: Rails.application.routes.url_helpers.transit_path(self.id),
                      timezone: "#{self.departure_location.name}/#{self.departure_location.parent.parent.name}")
  end
end
