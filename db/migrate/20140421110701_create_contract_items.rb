class CreateContractItems < ActiveRecord::Migration
  def change
    create_table :contract_items do |t|
      t.references :order_item, index: true
      t.references :inventory_item, index: true

      t.timestamps
    end
  end
end
