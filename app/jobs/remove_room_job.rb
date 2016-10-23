class RemoveRoomJob < ApplicationJob
  queue_as :default

  def perform(room)
    ActionCable.server.broadcast 'rooms_channel', closed: room.id
    RoomChannel.broadcast_to room, closed: true
  end
end
