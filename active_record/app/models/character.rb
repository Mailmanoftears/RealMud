class Character < ActiveRecord::Base
  has_one :inventory, dependent: :destroy
  has_one :pet, dependent: :destroy

  disciplines = ["thief", "mage", "warrior"]

  def use_discipline
    # Internal method that determines special skills and abilities
    case self.discipline
      when 'thief'
        # we need to add stealth or movement here to give an advantage to
        self.stealth += rand(10)
      when 'mage'
        # need some kinda magic ability
        self.psionics += rand(10)
      when 'warrior'
        # maybe a more fighting orientated skill would be better
        self.strength += rand(10)
      when 'legend'
        self.strength += rand(10)
        self.stealth += rand(4)
    end
  end

  def belongs_to_class
    # classes could be warrior, thief, paladin, necromancer, mage
    # when 'stealthy'
    #   self.stealth += 10
    # when 'brute'
    #   self.strength += 12
    # when 'mage'
    #   self.psionics += 6
  end
end
