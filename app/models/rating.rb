class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :tags, optional: true

  def self.event_ratings(event_id)
    self.where(object_type: "Event").where(object_id: event_id)
  end

  def self.track_ratings(track_id)
    self.where(object_type: "Track").where(object_id: track_id)
  end

  def self.housing_ratings(housing_id)
    self.where(object_type: "Housing").where(object_id: housing_id)
  end

  def self.city_ratings(city_id)
    self.where(object_type: "City").where(object_id: city_id)
  end
end
