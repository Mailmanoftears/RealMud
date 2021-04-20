require "pry-byebug"

class CharactersController
  def initialize
    @view = CharView.new
    @pet = PetController.new
    @monster = MonstersController.new
  end

  def index
    # list all characters ... just for debugging purposes
    list = Character.where(alive: true)
    @view.list_all(list)
  end

  def load
    id = @view.ask_for("your character's id")
    begin
      character = Character.find(id)
      if character.alive
        character
      else
        puts "sorry that character is dead"
      end
    rescue
      puts "Sorry, we cannot find that Character"
    end
  end

  def create
    name = @view.ask_for("name")
    race = @view.ask_for("race")
    character = Character.new(name: name, race: race, y_coord: 0, x_coord: 0)
    character.alive = true
    character.save
  end

  def update(character)
    puts "Change your character's name and race"
    character.name = @view.ask_for(:name)
    character.race = @view.ask_for(:race)
    character.save
    @view.give_msg("Update succesful!")
  end

  def destroy
    id = @view.ask_for("id").to_i
    begin
      character = Character.find(id)
      character.destroy
      @view.give_msg("You just destroyed that ID!!!")
    rescue
      puts "No character with that ID... : ("
    end
  end

  def move_char(char, direction)
    move(char, direction)
    # Need a method to do 'look'

    tile = MapTile.where(x_coord: char.x_coord, y_coord: char.y_coord).first

    if tile

      pet = Pet.where(x_coord: char.x_coord, y_coord: char.y_coord).first
      monster = Monster.where(x_coord: char.x_coord, y_coord: char.y_coord).first
      if tile.shop
        puts tile.shop.shopkeeper.greeting
      elsif pet
        puts Rainbow("...you spot a #{pet.kind.downcase}...").purple.bright
      end
      if monster && monster.alive
        # binding.pry
        puts Rainbow("***WATCH OUT***\nYOU SPOT A #{monster.name.upcase}").red.bright
        @monster.check_attack(char)
      end
    else
      puts "... you cannot go there..."
      case
      when direction == 'n'
        move(char, 's')
      when direction == 's'
        move(char, 'n')
      when direction == 'e'
        move(char, 'w')
      when direction == 'w'
        move(char, 'e')
      end
    end

    if char.pet
      char.pet.x_coord = char.x_coord
      char.pet.y_coord = char.y_coord
      char.pet.save
    end
  end

  def show_pos(char)
    puts Rainbow("You are at: #{char.x_coord} and #{char.y_coord}").yellow.bright
  end

  def show_stats(char)
    puts "Your character's statistics:\n
    Name: #{char.name}\n
    Race: #{char.race}\n"
    if char.discipline
      puts "
    Discipline: #{char.discipline.capitalize}\n"
    end
    if char.hitpoints < 5
      puts Rainbow("
    HitPoints: #{char.hitpoints}").red.bright
    else
      puts "
    HitPoints: #{char.hitpoints}\n"
    end
    puts "
    Strength: #{char.strength}\n
    Stealth: #{char.stealth}\n
    Psionics: #{char.psionics}\n
    Rage: #{char.rage}\n
    Agility: #{char.agility}\n
    Level: #{char.level}\n
    Experience: #{char.exp}"
  end
  # NEED --> show_char_stats, read_map_info, show_inventory, save_char_stats, drop_item

  private

  def move(char, direction)
    case
    when direction == 'n'
      char.y_coord += 1
    when direction == 's'
      char.y_coord -= 1
    when direction == 'e'
      char.x_coord += 1
    when direction == 'w'
      char.x_coord -= 1
    end
  end
end
