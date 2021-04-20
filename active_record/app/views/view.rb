class View
  def initialize
    @map_pic = Map.new
    @char = CharView.new
    @pet = PetView.new
    @map = MapView.new
    @shop = ShopView.new
    @fight = FightView.new
    @general = GeneralView.new
  end

  def start_game
    banner = Banner.new
    puts banner.greeting
    puts "Welcome"
  end

  def map
    @map_pic.draw_map
  end

  def display_tasks
    puts "\n****----****"
    print "Enter your command:\n> "
  end

  def commands
    puts "These are the available topics:"
    puts "character, pets, map, shop, fight, general"
    print "Which topic do you need help with?\n> "
    ans = gets.chomp
    case
    when ans == "character" then @char.view
    when ans == "pets" then @pet.view
    when ans == "map" then @map.view
    when ans == "shop" then @shop.view
    when ans == "fight" then @fight.view
    when ans == "general" then @general.view
    else
      puts "Please choose a valid option."
    end
  end
end
