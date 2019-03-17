class AlterLevelColumnToInOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :user_level, :integer
  end
end
