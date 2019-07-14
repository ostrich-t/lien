class GroupChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_channel_#{params['group_id']}"
    # stream_from "group_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(text: data['message'], user_id: current_user.id, group_id: params['group_id'])
  end
end
