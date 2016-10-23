class UpdateMemberCountsJob < ApplicationJob
  queue_as :default

  def perform(room)
    rendered_users = render_user_names(room)
    ActionCable.server.broadcast 'rooms_channel', room_id: room.id, count: room.users.count, updated_members: rendered_users
    RoomChannel.broadcast_to room, updated_members: rendered_users, full: room.full?
  end

  private

  def render_user_names(room)
    ApplicationController.renderer.render(partial: 'rooms/user_list', locals: {users: room.users})
  end
end
