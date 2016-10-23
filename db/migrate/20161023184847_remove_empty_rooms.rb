class RemoveEmptyRooms < ActiveRecord::Migration[5.0]
  def change
    Room.destroy_all
  end
end
