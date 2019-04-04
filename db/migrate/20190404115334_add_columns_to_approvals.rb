class AddColumnsToApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :approvals, :manager_id, :integer, null: false, default: 0
    add_column :approvals, :user_id, :integer, null: false, default: 0
  end
end
