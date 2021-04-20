class MonstersController
  def initialize
    @view = MonsterView.new
  end

  def check_attack(char)
    if rand(5).even?
      puts "Whoa..."
      fight(char)
    end
  end

  def fight(char)
    # a seperate/different fight method... call with engage, or perhaps have the monster initiate it
    mon = Monster.where(x_coord: char.x_coord, y_coord: char.y_coord).first

    puts "#{mon.name} attacks you..."

    while char.hitpoints > 0 && mon.hitpoints > 0
      damage = rand(char.strength)
      counter = rand(mon.strength)

      type = ["bites", "chomps", "scratches"]

      puts "#{mon.name} #{type.sample} you"
      char.update(hitpoints: char.hitpoints - counter)

      sleep 1

      if char.hitpoints <= 0
        puts "#{char.name} makes a last gurgling sound..."
        sleep 1
        puts "Your #{char.race} has died."
        char.update(alive: false)
      end

      unless char.hitpoints <= 0
        puts "#{char.name} hits #{mon.name} for #{damage} hitpoints"
        mon.update(hitpoints: mon.hitpoints - damage)

        if mon.hitpoints <= 0
          sleep 1
          puts "#{mon.name} has died."
          mon.update(alive: false)
          puts "You should get some exp for this"
        end
      end
    end
  end

end
