class AvatarCreationController
  attr_reader :char

  def initialize
    @view = CharView.new
  end

  def intro
    puts "
      Welcome to this awesome MUD.\n
      Before we can begin you will have to create a character.\n"
  end

  def create_char
    # @char = Character.new

    includes_valid_race = false
    races = ["orc", "elf", "human", "dwarf"]
    name = @view.ask_for("name")


      race = @view.ask_for("race")
      race = race.downcase

      if races.include? race
        character = Character.new(name: name, race: race, y_coord: 0, x_coord: 0)
        character.alive = true
        character.save
        puts "Character created and saved!"
        includes_valid_race = true
      else
        puts "Please enter a valid race."
      end


  end

  def give_attributes
    print "Give your character a name:\n> "
    @char.name = Route.choice
    print "What race is your character [Elf, Dwarf, Human, Orc]:\n> "
    @char.race = Route.choice
    print "Does your character have a discipline [thief, mage, warrior]?:\n> "
    @char.discipline = Route.choice
    @char.alive = true
    @char.hitpoints = 25
    @char.strength = 8
    puts "This is what you picked so far:\n
      #{@char.name}\n
      #{@char.race}\n
      #{@char.discipline}\n
      Hitpoints: #{@char.hitpoints}\n
      Strength: #{@char.strength}\n"

    print "Do you want to save this character?\n> "
    ans = Route.choice
    if ans == "yes"
      @char.save
    else
      puts "You just wasted your time..."
    end
  end

  def apply_skill
    # some method to apply skill points
  end
end
