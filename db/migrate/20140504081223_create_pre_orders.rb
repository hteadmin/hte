class CreatePreOrders < ActiveRecord::Migration
  def change
    create_table :pre_orders do |t|
      t.string :client_name
      t.string :phone
      t.string :email
      t.string :street
      t.references :district, index: true
      t.integer :rental_weeks
      t.text :games
      t.text :other_games

      t.timestamps
    end
  end
end
