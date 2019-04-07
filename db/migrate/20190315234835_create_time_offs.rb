class CreateTimeOffs < ActiveRecord::Migration[5.2]
  def change
    create_table :time_offs do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.text :note
      t.integer :off_type, null: false, default: 0
      t.belongs_to :user, index: true
      t.boolean :approved, null: true
      t.integer :approved_by, null: true
      t.timestamps
    end
  end
end
