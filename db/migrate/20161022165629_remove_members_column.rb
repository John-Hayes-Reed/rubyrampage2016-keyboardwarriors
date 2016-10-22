class RemoveMembersColumn < ActiveRecord::Migration[5.0]
  def change
    change_table :rooms do |t|
      t.remove :members
    end
  end
end
