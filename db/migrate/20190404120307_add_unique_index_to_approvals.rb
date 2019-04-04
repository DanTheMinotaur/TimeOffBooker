class AddUniqueIndexToApprovals < ActiveRecord::Migration[5.2]
  def change
    add_index :approvals, [:manager_id, :user_id], unique: true
  end
end
