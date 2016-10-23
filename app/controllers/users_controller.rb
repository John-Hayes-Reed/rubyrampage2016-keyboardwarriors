class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def create
    redirect_to rooms_path, alert: t('room_is_full') and return if @room.full?

    RoomService::Join.(current_user, @room)
    redirect_to room_path(@room)
  end

  def destroy
    RoomService::Leave.(current_user, @room) if @room
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find(params[:room_id]) rescue nil
  end
end
