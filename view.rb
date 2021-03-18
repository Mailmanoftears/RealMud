require_relative 'character'
require 'colorize'

class View
  attr_reader :name

  def start_game
    puts `clear`
    puts"






                    :+:                                              +-
                 .=%@=                                                %%-
               =#@@@+                                                 .%@@=
            :*@@@@@+                                                   :@@@@=
          =%@@@@@@#                                                     =@@@@@=
       .+@@@@@@@@@.                    :                                 #@@@@@%-
     .+@@@@@@@@@@-                 :+#@@@+:                              .@@@@@@@%:
   .*@@@@@@@@@@@#              .-#@@@@@@@@@@*-                            +@@@@@@@@*.
   :@@@@@@@@@@@@:            =#@@@@@@@@@@@@@@@@*-                        .*@@@@@@@@@@=
    +@@@@@@@@@@@=---::.   -#@@@@@@@@@@@@@@@@@@@@@@*=.         .. .:-=+*%@@@@@@@@@@@@@@+
     %@@@@@@@@@@@@@@@@@. #@@@@@@@@@@@@@@@@@@@@@@@@@@@#=:.:-+#@@# +@@@@@@@@@@@@@@@@@@@@-
     .@@@@@@@@@@@@@@@@@. #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@- %@@@@@@@@@@@@@@@@@@*
      :@@@@@@@@@@@@@@@@  %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@% :@@@@@@@@@@@@@@@@@*
       :@@@@@@@@@@@@@@# :@@@@@@@@#-=+******+++@@@@@@@@@@@@@@@@@@@: %@@@@@@@@@@@@@@@+
        :@@@@@@@@@@@@@- .#@@@@@@@#            .#@@@@@@@@@@@@@@@@@* +@@@@@@@@@@@@@@-
         .#@@@@@@@@@@@@+. -#@@@@@@              +@@@@@@@@@@@@@@@@@ :@@@@@@@@@#*=-.
           -*#@@@@@@@@@@@*: .+@@@@%%#+-.        -@@=::..   -@@@@@@: @@%#+-:
               .:-=+*#%@@@@%+. :+%@@@@@@@*=. .=%@@@*-    =%@@@@@@@: .
                         .:--=-   :%@@@@@@@@%@@+::%@@@**%##%@@@%-
                                   %@@@@@@@@@@=   @@@@@@=    .:
                                   @@@@@@@@@@%-+*+%@@@@@=
                                   @@@@@@@@@@@@@@@@@@@@@-
                                   @@@@@@@@@@@@@@@@@@@@@-
                                  .@@@@@@@@@@@@@@@@@@@@@-
                                  :@@@@@@@@@@@@@@@@@@@@@:
                                  -@@@@@@@@@@@@@@@@@@@@@:
                                  -@@@@@@@@@@@@@@@@@@@@@:
                                  =@@@@@@@@@@@%.@@@@%@@@:
                                  +@@@%-%@@@@@: +@@@.=@@.
                                  +@@=  =@@@@=  .@@#  =@.
                                  *+     @@@#    +@-   -
                                         +@@.     #
                                         .@-
                                          -



                                                                                          ".red
    puts " Welcome...\n Type " + 'look'.red + " to see where you are on the map: "
    puts "The following commands will also work:"
    puts "stats".red + " to see your character info"
    puts "inv".red + " to see your inventory"
    puts "drop".red + " to drop an item"
    puts "save".red + " to save your location for next time"
    puts "n".red + " for north," + " s".red + " for south and so on"
    puts "stop".red + " to stop the program"
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
    possibilities = ["Next...", "What do you want to do?", "Please enter a command..."]
    puts "\n"
    puts possibilities.sample + "#{@name}"
  end
end
