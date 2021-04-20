class Inventory < ActiveRecord::Base
  belongs_to :character
  belongs_to :bot
  has_many :inventory_items, dependent: :destroy
  has_many :weapons, dependent: :destroy
end
