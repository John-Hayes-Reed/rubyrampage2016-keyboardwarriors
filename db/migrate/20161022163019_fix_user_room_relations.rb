class FixUserRoomRelations < ActiveRecord::Migration[5.0]
  def change
    change_table :rooms do |t|
      t.remove :user_id
      t.belongs_to :owner
    end

    create_table :users_rooms, id: false do |t|
      t.belongs_to :user
      t.belongs_to :room
    end
  end
end
