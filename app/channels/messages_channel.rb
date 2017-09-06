class MessagesChannel < ApplicationCable::Channel
  def subscribed
     stream_from "messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def generate_connection_token
      SecureRandom.hex(36)
    end
end
