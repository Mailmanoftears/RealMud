class CreateShopkeepers < ActiveRecord::Migration[5.0]
  def change
    create_table :shopkeepers do |t|
      t.string :name
      t.string :greeting
      t.timestamps

      t.references  :shop, index: true, foreign_key: true
    end
  end
end
