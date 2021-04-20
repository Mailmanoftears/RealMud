require "pry-byebug"

class ShopController
  def check(char)
    tile = find_tile(char)
    if tile.shop
      puts "#{tile.shop.description}"
    else
      puts "There is no shop here..."
    end
  end

  def list_items(char)
    tile = find_tile(char)
     if tile.shop
      puts "This shop has the following items:"
      if tile.shop.inventory_items
        tile.shop.inventory_items.each do |item|
          unless item.name == "Coins" || item.amount <= 0
            puts "#{item.name} price: #{item.value} coins"
          end
        end
      else
        puts "...nothing at the moment"
      end
    else
      puts "There is no shop here..."
    end
  end

  def buy(char)
    tile = find_tile(char)
    mon = 0
    char.inventory.inventory_items.each do |item|
      if item.name == "Coins"
        mon = item.amount
      end
    end
    if tile.shop
      print "What would you like to buy?\n> "
      wants = gets.chomp
      if tile.shop.inventory_items
        if tile.shop.inventory_items.exists?(name: wants)
          tile.shop.inventory_items.each do |item|
            if item.name == wants && item.amount > 0
              print "#{item.name} costs #{item.value}\nWould you like to buy #{item.name}?(Y/n)\n> "
              ans = gets.chomp
              unless ans == 'no'
                if item.value <= mon
                  coins = char.inventory.inventory_items.find_by(name: "Coins")
                  coins.update(amount: coins.amount - item.value)
                  register = tile.shop.inventory_items.find_by(name: "Coins")
                  register.update(amount: register.amount + item.value)
                  item.update(amount: item.amount - 1)
                  x = InventoryItem.new(name: item.name, amount: 1, value: item.value)
                  char.inventory.inventory_items << x # we could move line 54 here and drop x
                  puts "You bought #{item.name}"
                else
                  puts "You don't have enough money to buy #{item.name}"
                  char.save
                end
              else
                puts "...bye"
              end
            elsif item.name == wants && item.amount <= 0
              puts "Sorry, no more #{wants}"
            end
          end
        else
          puts "This item is not available."
          char.save
        end
      end
    else
      puts "You cannot buy anything here..."
    end
    char.save
    char.reload
  end

  private

  def find_tile(char)
    tile = MapTile.where(x_coord: char.x_coord, y_coord: char.y_coord).first
  end
end
