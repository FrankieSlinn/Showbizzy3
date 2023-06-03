class AddForeignKeyToChildTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :users, index: true, foreign_key: true
  end

end
