class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user, room, message)
    RoomChannel.broadcast_to room, message: render_message(user, message)
  end

  private

  def render_message(user, message)
    ApplicationController.renderer.render(partial: 'chats/chat', locals: {name: user.name, message: message})
  end
end
