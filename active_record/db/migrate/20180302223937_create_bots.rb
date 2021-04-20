class CreateBots < ActiveRecord::Migration[5.0]
  def change
    create_table :bots do |t|
      t.string :name
      t.string :race
      t.integer :hitpoints
      t.integer :strength
      t.integer :x_coord, :default => 0
      t.integer :y_coord, :default => 0
      t.boolean :alive, :default => true
      t.timestamps
    end
  end
end
