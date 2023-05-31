class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.references :show, null: false, foreign_key: true
      t.string :placevenue
      t.string :placetown
      t.string :placeaddress
      t.string :placeinfo

      t.timestamps
    end
  end
end
