class RemoveRoomJob < ApplicationJob
  queue_as :default

  def perform(room)
    ActionCable.server.broadcast 'rooms_channel', closed: room
  end
end
