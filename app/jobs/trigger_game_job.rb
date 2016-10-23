class TriggerGameJob < ApplicationJob
  queue_as :default

  def perform(room, game)
    RoomChannel.broadcast_to room, trigger: render_game_link(game)
    ActionCable.server.broadcast 'rooms_channel', closed: room.id
    room.destroy
  end

  private

  def render_game_link(game)
    ApplicationController.renderer.render(partial: 'rooms/trigger_link', locals: {game: game})
  end

end
