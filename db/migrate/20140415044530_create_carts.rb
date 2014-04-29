class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :client_name
      t.string :phone
      t.string :email
      t.string :street
      t.references :district, index: true
      t.integer :rental_weeks
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
