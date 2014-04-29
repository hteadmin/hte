class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :cart, index: true
      t.integer :quantity
      t.integer :price
      t.boolean :primary, default: false
      t.references :product, index: true
      t.references :instance, index: true

      t.timestamps
    end
  end
end
