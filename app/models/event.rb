class Event < ApplicationRecord

  belongs_to :location
  belongs_to :track, optional: true
  belongs_to :side_trip, optional: true
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tags
  belongs_to :cohort, optional: true
  has_many :event_comments
  has_many :event_rsvps
  has_many :photos
  belongs_to :chat_room, optional: true

  def self.create_itinerary_items(collection)
    response = []
    collection.each do |event|
      response << event.create_itinerary_item
    end
    response
  end

  def waitlist
    EventWaitlist.where(event: self).map{|ew| ew.user }
  end

  def create_itinerary_item
    ItineraryItem.new(date: self.date,
                      item_type: "event",
                      time: self.start_time.to_time,
                      location: self.location.name,
                      title: self.title,
                      description: self.description,
                      link: Rails.application.routes.url_helpers.event_path(self.id),
                      timezone: "#{self.location.name}/#{self.location.parent.parent.name}")
  end

  def ratings
    Rating.event_ratings(self.id)
  end

  def rating
    self.ratings.average(:rating)
  end
end
