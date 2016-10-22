class RoomService::Create < RoomService

  def initialize(user, params)
    @user = user
    @params = params
  end

  def call
    @room = @user.owned_rooms.create(@params)
    AddRoomJob.perform_later @room
    @room
  end

end
