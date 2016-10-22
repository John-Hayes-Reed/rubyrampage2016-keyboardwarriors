class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.integer :victor_id
      t.string :difficulty
      t.string :status
      t.integer :member_count
      t.text :members

      t.timestamps
    end
  end
end
