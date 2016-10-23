# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    game = Game.find(params[:game_id])
    stream_for game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def input(data)
    user = User.find(data['user_id']) rescue nil
    game = Game.find(data['game_id']) rescue nil
    original_word = data['original_word']
    input = data['input']
    SetWordJob.perform_later game, user
    HandleInputJob.perform_later game, user, original_word, input
  end
end
