class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :root_id
      t.string :name
      t.string :slug
      t.integer :price
      t.integer :sale_price
      t.integer :noc_price
      t.integer :cost
      t.string :unit
      t.text :description
      t.attachment :photo
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
