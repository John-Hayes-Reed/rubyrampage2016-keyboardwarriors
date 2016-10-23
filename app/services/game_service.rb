class GameService

  def self.call(*args)
    new(*args).()
  end

  def initialize(game, room)
    @game = game
    @room = room
  end
  
end
