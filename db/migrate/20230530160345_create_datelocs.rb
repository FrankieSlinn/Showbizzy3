class CreateDatelocs < ActiveRecord::Migration[7.0]
  def change
    create_table :datelocs do |t|
      t.references :show, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.date :date
      t.string :time

      t.timestamps
    end
  end
end
