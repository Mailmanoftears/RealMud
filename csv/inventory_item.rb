class InventoryItem
  attr_reader :name, :amount #,:position

  def initialize(name, amount) #position
    @name = name
    @amount = amount
    #@position = position
  end
end
