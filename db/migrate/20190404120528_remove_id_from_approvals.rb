class RemoveIdFromApprovals < ActiveRecord::Migration[5.2]
  def change
    remove_column :approvals, :id
  end
end
