class CreateQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :quests do |t|
      t.string :name
      t.integer :length_in_minutes
      t.integer :reward_in_exp
      t.string :description
      t.boolean :solved, :default => false
      t.timestamps
    end
  end
end
