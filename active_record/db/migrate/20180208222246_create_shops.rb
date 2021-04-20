class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :description
      t.timestamps

      t.references  :map_tile, index: true, foreign_key: true
    end
  end
end
