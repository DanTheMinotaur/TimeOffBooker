class AddUniqueIndexToHolidays < ActiveRecord::Migration[5.2]
  def change
    add_index :holidays, :holiday_date, unique: true
  end
end
