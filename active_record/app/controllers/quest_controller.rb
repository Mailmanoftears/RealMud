require "pry-byebug"

class QuestController
  def initialize()
    @view = nil
  end

  def switch_quest(view, character)
    if QuestMaster.where(x_coord: character.x_coord, y_coord: character.y_coord) != []
      currentQuestMaster = QuestMaster.where(x_coord: character.x_coord, y_coord: character.y_coord)
      puts "Lucky you? \nA questmaster named #{currentQuestMaster.name} has given you a quest 😖!"
      @view = view
      @view.set_task(Quest.first.name)
    else
      puts "No questmaster here 😄"
    end
  end

  def solve_quest
    Quest.first.solved = true
  end
end
