class View
  def start_game
    puts `clear`
    puts " Welcome to this MUD\n Type 'look' to see where you are on the map: "
    puts "The following commands will also work:"
    puts "stats to see your character info"
    puts "inv to see your inventory"
    puts "drop to drop an item"
    puts "save to save your location for next time"
    puts "n for north, s for south and so on"
    puts "stop to stop the program"
  end

  def show_map(map_tile_info)
    # map_tile_info could be an array with more values
    puts map_tile_info
  end

  def view_stats(char_stats)
    # just an idea to display some info about the character
    puts char_stats.coords.to_s + ' ' + char_stats.name.join + ' ' + char_stats.race.join
  end

  def view_inventory(char)
    char.inventory.items.each do |item|
      puts item.name + " => " + item.amount.to_s
    end
  end

  def display_tasks
    possibilities = ["Which direction are you going?", "What do you want to do?", "Please enter a command..."]
    puts "\n"
    puts possibilities.sample
  end
end
