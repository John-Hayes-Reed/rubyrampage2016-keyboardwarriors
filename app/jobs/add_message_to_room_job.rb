class AddMessageToRoomJob < ApplicationJob
  queue_as :default

  def perform(room, message)
    RoomChannel.broadcast_to(room, message: message)
  end
end
