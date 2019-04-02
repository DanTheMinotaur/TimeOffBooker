class AddDaysTakenToTimeOffs < ActiveRecord::Migration[5.2]
  def change
    add_column :time_offs, :days_taken, :integer, :default => 0
  end
end
