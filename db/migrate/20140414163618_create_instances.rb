class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.references :product, index: true
      t.string :name
      t.string :slug
      t.boolean :available

      t.timestamps
    end
  end
end
