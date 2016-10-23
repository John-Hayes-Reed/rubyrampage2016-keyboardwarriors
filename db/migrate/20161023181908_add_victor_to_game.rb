class AddVictorToGame < ActiveRecord::Migration[5.0]
  def change
    change_table :games do |t|
      t.column :victor_id, :integer
    end
  end
end
