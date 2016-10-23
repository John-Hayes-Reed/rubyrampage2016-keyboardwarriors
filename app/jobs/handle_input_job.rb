class HandleInputJob < ApplicationJob
  queue_as :default

  def perform(game, user, original_word, input_word)
    if original_word == input_word
      score = game.scores.find_by(user: user)
      score.update(score: score.score+1)
      if score.score >= 15
        game.update(victor: user)
        GameChannel.broadcast_to game, user_id: user.id, score: score.score, victor: user.name
      else
        GameChannel.broadcast_to game, user_id: user.id, score: score.score
      end
    end
  end
end
