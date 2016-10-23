class RoomService::Destroy < RoomService

  def call
    RemoveRoomJob.perform_later @room
    Room.find(@room.id).destroy
  end
end
