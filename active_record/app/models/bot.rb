class Bot < ActiveRecord::Base
  has_one :inventory, dependent: :destroy
end
