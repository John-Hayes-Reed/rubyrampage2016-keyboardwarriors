class UpdateMemberCountsJob < ApplicationJob
  queue_as :default

  def perform(room)
    ActionCable.server.broadcast 'rooms_channel', room_id: room.id, count: room.users.count
  end
end
