class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.integer :score
      
      t.timestamps
    end
  end
end
