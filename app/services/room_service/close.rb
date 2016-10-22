class RoomService::Close < RoomService

  def call
    @user.owned_rooms.find(@room.id).destroy
  end

end
