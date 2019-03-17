class AddAppFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :job_title, :string
    add_column :users, :total_days, :integer
    add_column :users, :user_level, :integer
  end
end
