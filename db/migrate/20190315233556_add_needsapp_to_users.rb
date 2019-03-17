class AddNeedsappToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :needs_approval, :boolean
  end
end
