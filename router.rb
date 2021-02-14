require_relative 'view'

class Router
  def initialize(controller)
    @controller = controller
    @running = true
    @view = View.new
  end

  def run
    @view.start_game

    while @running
      display_tasks
      action = gets.chomp
      route(action)
    end
  end

  private

  def route(action)
    case
    when action.length == 1 then @controller.move_char(action)
    when action == 'stats' then @controller.show_char_stats
    when action == 'look' then @controller.read_map_info
    when action == 'inv' then @controller.show_inventory
    when action == 'save' then @controller.save_char_stats
    when action == 'drop' then @controller.drop_item
    when action == 'stop' || action == 'exit' then stop
    else
      puts "Please enter a valid command"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    @view.display_tasks
  end
end
