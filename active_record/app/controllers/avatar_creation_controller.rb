class AvatarCreationController
  attr_reader :char

  def intro
    puts "
      Welcome to this awesome MUD.\n
      Before we can begin you will have to create a character.\n"
  end

  def create_char
    @char = Character.new
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
