class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :kind
      t.string :description
      t.integer :strength
      t.integer :x_coord, :default => 0
      t.integer :y_coord, :default => 0
      t.boolean :alive, :default => true
      t.timestamps

      t.references  :character, index: true, foreign_key: true
    end
  end
end
