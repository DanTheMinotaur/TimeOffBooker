class ChangeApprovedbyFromNotNullTimeOffs < ActiveRecord::Migration[5.2]
  def change
    change_column :time_offs, :approved_by, :integer, null: true
  end
end
