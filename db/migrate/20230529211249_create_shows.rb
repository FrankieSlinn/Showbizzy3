class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :genre
      t.string :image
      t.string :performer

      t.timestamps
    end
  end
end
