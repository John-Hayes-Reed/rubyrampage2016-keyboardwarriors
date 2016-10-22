class RoomService

  def self.call(*args)
    new(*args).()
  end

  def initialize(user, room, **options)
    @user = user
    @room = room
  end
end
