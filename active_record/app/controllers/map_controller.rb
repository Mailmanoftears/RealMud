# require "pry-byebug"

class MapController
  def initialize
    @tiles = MapTile.all
  end

  def read_title(x, y)
    @tiles.each do |tile|
      if tile.x_coord == x && tile.y_coord == y
        puts tile.name
      end
    end
  end

  def read_description(x, y)
    @tiles.each do |tile|
      if tile.x_coord == x && tile.y_coord == y
        puts tile.description
      end
    end
  end

  def search_tile(x, y)
    @tiles.each do |tile|
      tile.reload
      if tile.x_coord == x && tile.y_coord == y
        if tile.inventory_items != []
          # binding.pry
          puts "You see..."
          tile.inventory_items.each do |item|
            puts "#{item.amount} #{item.name}"
          end
        elsif tile.weapons != []
          # binding.pry
          puts "You see..."
          tile.weapons.each do |item|
            puts "#{item.amount} #{item.name}"
          end
        else
          puts "Nothing interesting here..."
        end
      end
    end
  end
end
