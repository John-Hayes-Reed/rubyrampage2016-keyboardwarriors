# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:room_id])
    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def chat(data)
    user = User.find(data['user_id']) rescue nil
    room = Room.find(data['room_id']) rescue nil
    message = data['message']
    ChatBroadcastJob.perform_later user, room, message if user && room
  end

  def trigger_game(data)
    room = Room.find(data['room_id']) rescue nil
    GameService::Create.(Game.new, room)
  end
end
