class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true
      t.string :name
      t.integer :quantity
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
