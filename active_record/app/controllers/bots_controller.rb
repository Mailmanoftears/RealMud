require "pry-byebug"

class BotsController
  def announce(char)
    announce_bot(find_bot(char))
  end

  def search_corpse(char)
    corpse = Locate.corpse(char)
    if corpse
      puts "You are searching a dead #{corpse.race}..."
      unless corpse.inventory.inventory_items.empty? && corpse.inventory.weapons.empty?
        corpse.inventory.inventory_items.each do |item|
          puts "You find #{item.name}"
        end
        corpse.inventory.weapons.each do |item|
          puts "You find #{item.name}"
        end
      else
        puts "#{corpse.race} has nothing..."
      end
    end
  end

  def get_item(char)
    search_corpse(char)
    # real shitty to do this twice... gotta write a method to shorten this!!!
    corpse = find_corpse(char)
    if corpse.inventory.inventory_items || corpse.inventory.weapons
      print "What do you want to grab?\n> "
      item_name = gets.chomp

      corpse.inventory.inventory_items.each do |item|
        if item.name == item_name
          char.inventory.inventory_items << item
          item.inventory_id = char.inventory.id
          item.inventory.bot_id = nil
          item.save
        end
      end
      corpse.inventory.weapons.each do |item|
        if item.name == item_name
          char.inventory.weapons << item
          item.inventory_id = char.inventory.id
          item.inventory.bot_id = nil
          item.save
        end
      end

      char.save
      puts "Your position has been saved!"
      char.reload

    end
  end

  def fight(char)
    find_bot(char)

    if @bot.first.has_attribute? 'quest_id'
      puts Rainbow("... you cannot fight a questmaster.").red
    else
      if @bot
        @bot = @bot.first

      # A fight between to nearly equally strong characters
      # should last around 4 rounds ...
        while char.hitpoints > 0 && @bot.hitpoints > 0
          damage = rand(char.strength)
          if char.pet
            bites = rand(char.pet.strength)
          end
          counter = rand(@bot.strength)
          puts "#{char.name} hits #{@bot.name} for #{damage} hitpoints"
          if char.pet
            puts Rainbow("#{char.pet.name} hits #{@bot.name} for #{bites} hitpoints").orange.bright
          end
          @bot.update(hitpoints: @bot.hitpoints - damage)
          sleep 1
          if @bot.hitpoints <= 0
            puts "#{@bot.name} makes a last gurgling sound..."
            sleep 1
            puts "#{@bot.race} has died."
            @bot.update(alive: false)
            gain_exp(char, @bot)
          end
          unless @bot.hitpoints <= 0
            puts "#{@bot.name} hits #{char.name} for #{counter} hitpoints"
            char.update(hitpoints: char.hitpoints - counter)
            if char.hitpoints <= 0
              sleep 1
              puts "#{char.name} has died."
              char.update(alive: false)
            end
          end
        end
      end
    end
  end

  private

  def find_corpse(char)
    # Line 83 is deprecated?
    bot = Bot.where(x_coord: char.x_coord, y_coord: char.y_coord)
    unless bot.count == 0 || bot.first.alive == true
      return bot.first
    end
  end

  def find_bot(char)
    # binding.pry
    @bot = Bot.where(x_coord: char.x_coord, y_coord: char.y_coord)
    if @bot.empty?
      @bot = QuestMaster.where(x_coord: char.x_coord, y_coord: char.y_coord)
      unless @bot.empty?
        # binding.pry
        puts "A... Questmaster"
      end
    end

    # This needs to change if we want to have more than one bot in a tile
    if @bot.count == 0
      return nil
    else
      return @bot.first
    end
  end

  def announce_bot(bot)
    if bot.nil?
      puts '...'
    elsif bot.alive?
      puts "You see a #{bot.race}."
    elsif bot.alive == false
      puts "You see a dead #{bot.race}."
    end
  end

  def gain_exp(char, bot)
    check_level = Level.new
    if bot.strength > char.strength
      ex = bot.strength * 5
      char.exp += ex
    else
      ex = bot.strength * 3
      char.exp += ex
    end
    char.save
    puts Rainbow("You earned #{ex} experience points").yellow
    check_level.level_up(char)
  end

end
