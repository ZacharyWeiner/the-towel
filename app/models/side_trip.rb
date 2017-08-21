class SideTrip < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :cohort
  has_and_belongs_to_many :users
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :transits
  has_and_belongs_to_many :lodgings
  has_many :posts
  has_many :photos
  def self.create_itinerary_items(collection)
    response = []
    collection.each do |side_trip|
      response << side_trip.create_itinerary_item
    end
    response
  end

  def create_itinerary_item
    locations = ""
    self.locations.each{|l| locations << "#{l.name} "}
    ItineraryItem.new(date: self.start_date,
                      location: locations,
                      title: self.title,
                      description: self.description,
                      link: Rails.application.routes.url_helpers.side_trip_path(self.id),
                      timezone: "#{self.locations.first.name}/#{self.locations.first.parent.parent.name}")
  end
end



