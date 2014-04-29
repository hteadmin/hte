class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.string :order_type
      t.string :client_name
      t.string :phone
      t.string :email
      t.string :street
      t.references :district, index: true
      t.integer :rental_weeks
      t.integer :shipping_price
      t.integer :subtotal
      t.integer :total
      t.string :state, default: 'pending'
      t.string :deposit_type
      t.integer :deposit_amount
      t.string :delivery_method
      t.datetime :delivered_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
