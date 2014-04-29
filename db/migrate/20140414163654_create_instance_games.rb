class CreateInstanceGames < ActiveRecord::Migration
  def change
    create_table :instance_games do |t|
      t.references :instance, index: true
      t.references :game, index: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
