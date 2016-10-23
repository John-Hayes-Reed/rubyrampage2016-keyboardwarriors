class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.text :participants
      t.timestamps
    end
  end
end
