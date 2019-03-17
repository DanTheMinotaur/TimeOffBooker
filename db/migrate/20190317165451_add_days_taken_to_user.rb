class AddDaysTakenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :days_taken, :integer, :default => 0
  end
end
