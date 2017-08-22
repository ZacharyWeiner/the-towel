class Message < ApplicationRecord
  include AutoHtml
  belongs_to :user
  belongs_to :chat_room
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  auto_html_for :body do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => true)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
