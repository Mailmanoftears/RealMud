require "pry-byebug"

module Locate
  def self.bot(char)
    bot = Bot.where(x_coord: char.x_coord, y_coord: char.y_coord)
  end

  def self.corpse(char)
    bot = Locate.bot(char)
    unless bot.count == 0 || bot.first.alive == true
      return bot.first
    end
  end

  def self.show_coords(model)
    puts Rainbow("#{model.name} is at: #{model.x_coord} and #{model.y_coord}").yellow.bright
  end
end

module Fight
  def self.test(stuff)
    puts "#{stuff.upcase} gives you a fight!"
  end
end

module Route
  def self.test(stuff)
    puts "#{stuff} should route all your stuff!"
  end

  def self.choice
    gets.chomp
  end
end

module Item
  def self.search_corpse(char)
    corpse = Locate.corpse(char)
    if corpse
      puts "You are searching a dead #{corpse.race}..."
      unless corpse.inventory.inventory_items.empty? && corpse.inventory.weapons.empty?
        corpse.inventory.inventory_items.each do |item|
          puts "You find #{item.name}"
        end
        corpse.inventory.weapons.each do |weapon|
          puts "You find #{weapon.name}"
        end
      else
        puts "#{corpse.race} has nothing..."
      end
    end
  end

  def self.find_items(char)
    stuff = []
    corpse = Item.find_corpse(char)
    stuff << items = corpse.inventory.inventory_items
    stuff << weapons = corpse.inventory.weapons
  end

  # this method should only deal with adding the actual item to character model
  def self.get_item(char, stuff)
    stuff.each do |item|
      if item.first.class == Weapon.new.class
        char.inventory.weapons << item
      elsif item.first.class == InventoryItem.new.class
        char.inventory.inventory_items << item
      end
    end
  end
end
