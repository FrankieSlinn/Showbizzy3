class AddLinkToShow < ActiveRecord::Migration[7.0]
  def change
    add_column :shows, :ticketlink, :string
  end
end
