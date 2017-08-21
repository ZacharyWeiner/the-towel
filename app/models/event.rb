class Event < ApplicationRecord

  belongs_to :location
  belongs_to :track, optional: true
  has_and_belongs_to_many :users
  belongs_to :cohort, optional: true
  has_many :event_comments
  has_many :event_rsvps
  has_many :photos

  def self.create_itinerary_items(collection)
    response = []
    collection.each do |event|
      response << event.create_itinerary_item
    end
    response
  end

  def create_itinerary_item
    ItineraryItem.new(date: self.date,
                      time: self.start_time,
                      location: self.location.name,
                      title: self.title,
                      description: self.description,
                      link: Rails.application.routes.url_helpers.event_path(self.id),
                      timezone: "#{self.location.name}/#{self.location.parent.parent.name}")
  end
end
