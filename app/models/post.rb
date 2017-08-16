class Post < ApplicationRecord
  include AutoHtml
  belongs_to :user
  belongs_to :cohort, optional: true
  belongs_to :actions, optional: true
  belongs_to :event, optional: true
  belongs_to :side_trip, optional: true

  auto_html_for :content do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => true)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
