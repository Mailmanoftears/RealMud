class Character < ActiveRecord::Base
  has_one :inventory, dependent: :destroy
  has_one :pet, dependent: :destroy

  disciplines = ["thief", "mage", "warrior"]

  def use_discipline
    # Internal method that determines special skills and abilities
    case self.discipline
      when 'thief'
        # we need to add stealth or movement here to give an advantage to
        self.stealth += rand(6)
      when 'mage'
        # need some kinda magic ability
        self.psionics += rand(6)
      when 'warrior'
        # maybe a more fighting orientated skill would be better
        self.strength += rand(6)
    end
  end

  def belongs_to_class
    # classes could be warrior, thief, paladin, necromancer, mage
  end
end
