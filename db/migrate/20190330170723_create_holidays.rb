class CreateHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :holidays do |t|
      t.date :holiday_date
      t.string :reason

      t.timestamps
    end
  end
end
