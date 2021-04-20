class MapTile < ActiveRecord::Base
  has_one :shop
  has_many :inventory_items, dependent: :destroy
  has_many :weapons, dependent: :destroy
end
