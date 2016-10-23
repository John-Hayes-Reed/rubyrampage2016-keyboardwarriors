class ChangeGames < ActiveRecord::Migration[5.0]
  def change
    change_table :games do |t|
      t.remove :participants
      t.column :diffifculty, :string
    end
  end
end
