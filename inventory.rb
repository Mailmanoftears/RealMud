require 'csv'
require_relative 'inventory_item'

class Inventory
  attr_reader :items

  def initialize(csv_file)
    @csv_file = csv_file
    @items = CSV.read(@csv_file).map do |item|
      InventoryItem.new(item[0], item[1])
    end
  end
end
