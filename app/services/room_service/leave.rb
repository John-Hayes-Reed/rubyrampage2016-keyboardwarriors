class RoomService::Leave < RoomService

  def call
    @room.users.delete(@user)
    UpdateMemberCountsJob.perform_later @room
  end
end
