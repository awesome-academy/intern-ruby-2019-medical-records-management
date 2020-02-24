class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel_#{message_account.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
