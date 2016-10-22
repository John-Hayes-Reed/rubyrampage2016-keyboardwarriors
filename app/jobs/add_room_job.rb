class AddRoomJob < ApplicationJob
  queue_as :default

  def perform(room)
    ActionCable.server.broadcast 'rooms_channel', room: render_room(room)
  end

  private

  def render_room(room)
    ApplicationController.renderer.render(partial: 'rooms/room', locals: {room: room})
  end
end
