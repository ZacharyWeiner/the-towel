class Announcement < ApplicationRecord
  belongs_to :user
  belongs_to :cohort
  has_many :user_announcements

  auto_html_for :content do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => true)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
