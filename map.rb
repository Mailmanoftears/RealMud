require 'csv'
require_relative 'maptile'

class Map
  attr_reader :maptiles

  def initialize(csv_file)
    @csv_file = csv_file
    @maptiles = CSV.read(@csv_file).map do |map|
      if map[2]
        MapTile.new(map[0], map[1], map[2])
      else
        MapTile.new(map[0], map[1])
      end
    end
  end

  def create_tile(coords, info, item)
    coords = "#{coords[0]} #{coords[1]}"
    item = "#{item.name} #{item.amount}"
    tile = MapTile.new(coords, info, item)
    remove_tile(info, tile)
  end

  def add_tile(new_tile)
    @maptiles << new_tile
    write_to_csv(@maptiles)
  end

  def remove_tile(info, tile)
    tile_id = maptiles.each_with_index do |tile, index|
      if tile.info == info
        index
      end
    end
    @maptiles.delete_at(tile_id.join.to_i)
    add_tile(tile)
  end

  def write_to_csv(map_tiles)
    CSV.open(@csv_file, "wb") do |csv|
      map_tiles.each do |tile|
        # Here, row is an array of columns
        if tile.items == {}
          csv << [tile.coords] + [tile.info]
        else
          csv << [tile.coords] + [tile.info] + [tile.items]
        end
      end
    end
  end
end
