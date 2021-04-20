class CreateMapTiles < ActiveRecord::Migration[5.0]
  def change
    create_table :map_tiles do |t|
      t.string :name
      t.string :description
      t.integer :x_coord
      t.integer :y_coord
      t.timestamps
    end
  end
end
