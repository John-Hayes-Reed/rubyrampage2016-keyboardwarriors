class SetWordJob < ApplicationJob
  queue_as :default

  def perform(game, user)
    word = Word.order("RANDOM()").where(difficulty: game.difficulty).first
    GameChannel.broadcast_to game, user_id: user.id, word: word.text
  end
end
