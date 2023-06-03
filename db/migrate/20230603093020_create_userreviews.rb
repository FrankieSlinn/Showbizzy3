class CreateUserreviews < ActiveRecord::Migration[7.0]
  def change
    create_table :userreviews do |t|
      t.references :show, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating
      t.string :review

      t.timestamps
    end
  end
end
