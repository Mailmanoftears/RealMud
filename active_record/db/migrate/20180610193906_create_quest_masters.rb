class CreateQuestMasters < ActiveRecord::Migration[5.0]
  def change
    create_table :quest_masters do |t|
      t.string :name
      t.string :race
      t.integer :x_coord, :default => 0
      t.integer :y_coord, :default => 0
      t.boolean :alive, :default => true
      t.timestamps

      t.references  :quest, index: true, foreign_key: true
    end
  end
end
