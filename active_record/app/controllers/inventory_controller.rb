class InventoryController
  def initialize
    # setup
  end

  def setup
    # puts "We need to create some inventory items to test with... "
    # inventory = InventoryItem.new
    # puts "Enter an item name: "
    # name = gets.chomp
    # inventory.name = name
    # puts "Enter an amount:"
    # amount = gets.chomp
    # inventory.amount = amount
    # puts "Which Character does this item belong to?"
    # id = gets.chomp
    # inventory.character = Character.find(id.to_i)
    # inventory.save
  end

  def show_inventory(character)
    puts Rainbow("These are your items:").blue.bright
    character.inventory.inventory_items.each do |item|
      puts "--> #{item.amount} " + Rainbow("#{item.name}").yellow.bright
    end
    if character.inventory.weapons
      puts Rainbow("and your weapons:").blue.bright
      character.inventory.weapons.each do |weapon|
        puts "--> #{weapon.amount} " + Rainbow("#{weapon.name}").crimson.bright
      end
    end
  end

  def drop_item(character)
    print "Which item do you want to drop?\n> "
    item_name = gets.chomp
    character.inventory.inventory_items.each do |item|
      if item.name == item_name
        tile = find_tile(character)
        tile.inventory_items << item
        item.inventory_id = nil
        item.map_tile_id = tile.id
        item.save
      end
    end
    character.inventory.weapons.each do |item|
      if item.name == item_name
        tile = find_tile(character)
        tile.weapons << item
        item.inventory_id = nil
        item.map_tile_id = tile.id
        item.save
      end
    end
    character.save
    puts "Your position has been saved!"
    character.reload
  end

  def grab_item(character)
    print "Which item do you want to grab?\n> "
    item_name = gets.chomp
    tile = find_tile(character)
    tile.inventory_items.each do |item|
      if item.name == item_name
        character.inventory.inventory_items << item
        item.inventory_id = character.inventory.id
        item.map_tile_id = nil
        item.save
      end
    end
    tile.weapons.each do |item|
      if item.name == item_name
        character.inventory.weapons << item
        item.inventory_id = character.inventory.id
        item.map_tile_id = nil
        item.save
      end
    end
    character.save
    puts "Your position has been saved!"
    character.reload
  end

  private

  def find_tile(char)
    tiles = MapTile.all
    tiles.each do |tile|
      if tile.x_coord == char.x_coord && tile.y_coord == char.y_coord
        return tile
      end
    end
  end
end
