class GameService::Create < GameService

  def call
    @game.difficulty = @room.difficulty
    @game.save
    @room.users.each do |user|
      Score.create(game: @game, user: user)
    end
    TriggerGameJob.perform_later @room, @game
  end

end
