require "pry-byebug"

class Router
  def initialize
    @char_controller = CharactersController.new
    @inv_controller = InventoryController.new
    @map_controller = MapController.new
    @shop_controller = ShopController.new
    @pet_controller = PetController.new
    @view = View.new
    @character = 0
    @running = true
    # Just for testing purposes as of now
    @bot_controller = BotsController.new
    @bots = Bot.all
    @banner = BannerTwo.new
  end

  def run
    @view.start_game

    while @running
      if @character == 0 || @character.nil? || @character.alive == false
        start_with_character
      else
        display_tasks
        action = Route.choice
        route(action)
      end
    end
  end

  private

  def route(action)
    case action
    when 's', 'n', 'e', 'w' then @char_controller.move_char(@character, action)
    when 'new' then @char_controller.create
    when 'update' then @char_controller.update(@character)
    when 'load' then @character = @char_controller.load
    when 'delete' then @char_controller.destroy
    when 'inv' then @inv_controller.show_inventory(@character)
    when 'drop' then @inv_controller.drop_item(@character)
    when 'grab' then @inv_controller.grab_item(@character)
    when 'look' then @map_controller.read_title(@character.x_coord, @character.y_coord)
    when 'look again', 'look more' then @map_controller.read_description(@character.x_coord, @character.y_coord) and @pet_controller.announce(@character) and @bot_controller.announce(@character)
    when 'inspect' then @map_controller.search_tile(@character.x_coord, @character.y_coord)
    when 'search corpse' then @bot_controller.search_corpse(@character)
    when 'grab item' then @bot_controller.get_item(@character)
    when 'shop' then @shop_controller.check(@character)
    when 'list items' then @shop_controller.list_items(@character)
    when 'buy' then @shop_controller.buy(@character)
    when 'pos' then Locate.show_coords(@character)
    when 'list' then @char_controller.index
    when 'save' then @character.save and puts "Your position has been saved"
    when 'stats' then @char_controller.show_stats(@character)
    when 'help' then @view.commands
    when 'map' then @view.map
    when 'call pet' then @pet_controller.call(@character)
    when 'tame pet' then @pet_controller.tame(@character)
    when 'pet stats' then @pet_controller.stats(@character)
    when 'banner' then @banner.greeting
      # FOR DEBUGGING PURPOSES:
    when 'pry' then binding.pry
      # Just to test fight mode right now
    when 'fight' then @bot_controller.fight(@character)
      ###
    when 'stop', 'exit' then stop
    else
      puts "Please enter a valid command (you can enter 'help' for a list of commands)"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    @view.display_tasks
  end

  def start_with_character
    puts "You must load a Character first or create a new one"
    print "Do you want a list of characters?[Y/n] or type 'new' to create one\n> "
    ans = gets.chomp

    case
    when ans == '' || ans[0].downcase == 'y'
      route("list")
      route("load")
    when ans == 'no'
      route("load")
    when ans == "new"
      char = AvatarCreationController.new
      char.create_char
      char.give_attributes
      @character = char.char
    else
      puts "please answer 'y', 'no' or 'new'"
    end
  end
end
