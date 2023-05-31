class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :venuename
      t.string :town
      t.string :address
      t.string :info

      t.timestamps
    end
  end
end
