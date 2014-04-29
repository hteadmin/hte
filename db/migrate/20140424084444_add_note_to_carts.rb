class AddNoteToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :note, :text
  end
end
