class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :trailer
      t.attachment :photo

      t.timestamps
    end
  end
end
