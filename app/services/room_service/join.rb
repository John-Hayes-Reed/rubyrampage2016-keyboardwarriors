class RoomService::Join < RoomService

  def call
    @room.users << @user
    UpdateMemberCountsJob.perform_later @room
  end

end
