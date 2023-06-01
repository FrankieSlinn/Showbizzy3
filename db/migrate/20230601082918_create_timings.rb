class CreateTimings < ActiveRecord::Migration[7.0]
  def change
    create_table :timings do |t|
      t.references :place, null: false, foreign_key: true
      t.date :day
      t.string :timeslot

      t.timestamps
    end
  end
end
