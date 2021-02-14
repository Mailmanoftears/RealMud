require_relative 'view'
require_relative 'inventory'
require 'csv'

class Character
  attr_reader :coords, :name, :race, :inventory
  attr_writer :coords

  def initialize(csv_file, inventory)
    @csv_file = csv_file
    @name = CSV.read(@csv_file).map do |attr|
      attr[1]
    end
    @race = CSV.read(@csv_file).map do |attr|
      attr[2]
    end
    @coords = CSV.read(@csv_file).map do |attr|
      attr[0]
    end
    @view = View.new
    @inventory = inventory
  end

  def add_to_inventory

  end

  def drop_item(map, coords) # Would be cool to drop on map => (map)
    puts "Which item do you want to drop?"
    item_name = gets.chomp

    info = get_info(map, coords)

    self.inventory.items.each_with_index do |item, index|
      if item.name == item_name
        map.create_tile(coords, info, item)
        self.inventory.items.delete_at(index)
      end
    end
  end

  def get_info(map, coords)
    if map.maptiles.any? {|tile| tile.coords == "#{coords[0]} #{coords[1]}"}
      map.maptiles.each do |tile|
        if tile.coords == "#{coords[0]} #{coords[1]}"
          if tile.items != {}
            return info = tile.info + " " + tile.items
          else
            return info = tile.info
          end
        end
      end
    else
      return info = "no map yet"
    end
  end

  def default_coords
    # This is why we need to move to Active Record
    @coords = {
      :x => self.coords[0].split(' ')[0].to_i,
      :y => self.coords[0].split(' ')[1].to_i
    }
  end

  def save(char)
    coords = "#{char.coords[:x]} #{char.coords[:y]}"
    CSV.open(@csv_file, "wb") do |csv|
      csv << [coords] + char.name + char.race
    end
  end

  def read_map_info(coords, map)
    info = get_info(map, coords)
    @view.show_map(info)
  end
end
