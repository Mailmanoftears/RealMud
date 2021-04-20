class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.timestamps

      t.references :character, index: true, foreign_key: true
      t.references :bot, index: true, foreign_key: true
    end
  end
end
