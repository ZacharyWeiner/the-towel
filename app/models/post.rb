class Post < ApplicationRecord
  include AutoHtml
  belongs_to :user
  belongs_to :cohort, optional: true
  belongs_to :actions, optional: true
  belongs_to :event, optional: true
  belongs_to :side_trip, optional: true
  has_many :photos
  accepts_nested_attributes_for :photos

  auto_html_for :content do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => true)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  def posted_to
    if self.side_trip.nil? == false
      self.side_trip.title
    elsif self.event.nil? == false
      self.event.title
    else
      self.cohort.name
    end
  end
end
