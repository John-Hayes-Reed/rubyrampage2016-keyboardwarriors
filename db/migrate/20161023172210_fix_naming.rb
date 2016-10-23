class FixNaming < ActiveRecord::Migration[5.0]
  def change
    change_table :games do |t|
      t.remove :diffifculty
      t.column :difficulty, :string
    end
  end
end
