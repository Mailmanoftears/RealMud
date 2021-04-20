class Quest < ActiveRecord::Base
  belongs_to :quest_master
  belongs_to :character
  has_one  :quest_master
end
