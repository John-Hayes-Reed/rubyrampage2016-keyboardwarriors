class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def create
    @room.users << User.find(current_user.id)
    redirect_to room_path(@room)
  end

  def destroy
    @room.users.delete(current_user)
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end
end
