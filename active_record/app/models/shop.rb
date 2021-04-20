class Shop < ActiveRecord::Base
  belongs_to :map_tile
  has_many :inventory_items, dependent: :destroy
  has_many :weapons, dependent: :destroy
  has_one :shopkeeper
end
