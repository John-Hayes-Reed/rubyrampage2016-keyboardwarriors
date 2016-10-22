class FixTableName < ActiveRecord::Migration[5.0]
  def change
    drop_table :users_rooms

    create_table :rooms_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :room
    end
  end
end
