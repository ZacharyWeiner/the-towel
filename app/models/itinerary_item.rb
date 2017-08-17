class ItineraryItem
  include ActiveModel::Model

  attr_accessor :date, :time, :location, :title, :description, :company, :route_number, :link, :timezone
end
