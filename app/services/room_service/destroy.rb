class RoomService::Destroy < RoomService

  def call
    RemoveRoomJob.perform_later @room
    @user.owned_rooms.find(@room.id).destroy
  end
end
