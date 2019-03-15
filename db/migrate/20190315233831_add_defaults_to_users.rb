class AddDefaultsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :needs_approval, true
    change_column :users, :job_title, :string, null: false
    change_column :users, :name, :string, null: false
    change_column :users, :user_level,:string, null: false, default: 0
  end
end
