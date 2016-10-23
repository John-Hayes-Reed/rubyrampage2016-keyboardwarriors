class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[create destroy]

  def create
    redirect_to rooms_path, alert: t('room_is_full') and return if @room.full?

    RoomService::Join.(current_user, @room)
    redirect_to room_path(@room)
  end

  def destroy
    RoomService::Leave.(current_user, @room) if @room
    redirect_to rooms_path
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: t('successfully_updated')
    else
      render :edit
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id]) rescue nil
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
