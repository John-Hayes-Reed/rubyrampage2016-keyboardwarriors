class RoomService::Join < RoomService

  def call
    @room.users << @user unless @room.users.include?(@user)
    UpdateMemberCountsJob.perform_later @room
  end

end
